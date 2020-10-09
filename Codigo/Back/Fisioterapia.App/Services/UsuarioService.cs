using AutoMapper;
using Fisioterapia.App.Helpers;
using Fisioterapia.App.Models.Usuarios;
using Fisioterapia.Models;
using Fisioterapia.Models.Entidades;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using BC = BCrypt.Net.BCrypt;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace Fisioterapia.App.Services {
    public class UsuarioService : IUsuarioServices {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly AppSettings _appSetting;
        private readonly IEmailService _emailService;

        public UsuarioService(DataContext context, IMapper mapper, IOptions<AppSettings> appSettings,IEmailService emailService) {
            _context = context;
            _mapper = mapper;
            _appSetting = appSettings.Value;
            _emailService = emailService;
        }
        public LoginResponse Criar(CriarModel model) {
            //validar
            if (_context.Usuarios.Any(x => x.Email == model.Email))
                throw new AppException($"Email '{model.Email}' já estar registrado");
            //map model do  usuario objeto
            var usuario = _mapper.Map<Usuarios>(model);
            usuario.Criado = DateTime.UtcNow;
            usuario.Verificado = DateTime.UtcNow;
            //hash senha
            usuario.SenhaHash = BC.HashPassword(model.Senha);
            //salvar a conta
            _context.Usuarios.Add(usuario);
            _context.SaveChanges();
            return _mapper.Map<LoginResponse>(usuario);
        }

        public void Delete(int id) {
            var usuario = getUsuario(id);
            _context.Usuarios.Remove(usuario);
            _context.SaveChanges();
        }

        public IEnumerable<LoginResponse> GetAll() {
            var usuario = _context.Usuarios;
            return _mapper.Map<IList<LoginResponse>>(usuario);
        }

        public LoginResponse GetById(int id) {
            var usuario = getUsuario(id);
            return _mapper.Map<LoginResponse>(usuario);
        }

        public LoginResponse login(LoginModel model, string ipAcesso) {
            var usuario = _context.Usuarios.SingleOrDefault(x => x.Email == model.Email);
            if (usuario == null || !usuario.IsVerificado || BC.Verify(BC.HashPassword(model.Senha), usuario.SenhaHash))
                throw new AppException("Email ou Senha estar Incorreto!");
            var JwtToken = generateJwtToken(usuario);
            var refreshToken = generateRefreshToken(ipAcesso);
            usuario.RecarregarToken.Add(refreshToken);
            _context.Update(usuario);
            _context.SaveChanges();

            var reponse = _mapper.Map<LoginResponse>(usuario);
            reponse.jwtToken = JwtToken;
            reponse.RecarregarToken = refreshToken.Token;
            return reponse;
        }

        public void RecuperarSenha(EsqueceuSenhaModel model, string origin) {
            var user = _context.Usuarios.SingleOrDefault(x => x.Email == model.Email);
            if (user == null) return;
            user.ResetToken = randomTokenString();
            user.ResetTokenExpires = DateTime.UtcNow.AddDays(24);
            _context.Usuarios.Update(user);
            _context.SaveChanges();

            //falta o  envio  de email
            
        }

        public LoginResponse RefreshToken(string token, string ipAcesso) {
            throw new NotImplementedException();
        }

        public void Register(RegisterModel model, string origin) {
            //validate
            if (_context.Usuarios.Any(x => x.Email == model.Email)) 
            {
                // enviar erro já registrado no e-mail para evitar enumeração de conta
                //não implemetado ainda 
            }
            var usuario = _mapper.Map<Usuarios>(model);
            var isFirstUsuario = _context.Usuarios.Count() == 0;
            usuario.Role = isFirstUsuario ? Role.Admin : Role.Auxi;
            usuario.Criado = DateTime.UtcNow;
            usuario.VerificacaoToken = randomTokenString();
            //hash Senha
            usuario.SenhaHash = BC.HashPassword(model.Senha);
            //salvar usuarios
            _context.Usuarios.Add(usuario);
            _context.SaveChanges();
            //Implemetar verificar emails
        }

        public void ResetSenha(ResetSenhaModel model) {
            throw new NotImplementedException();
        }

        public void RevokeToken(string token, string ipAcesso) {
            var (refreshToken, usuario) = getRefreshToken(token);
            //revoke token e salva
            refreshToken.Revoked = DateTime.UtcNow;
            refreshToken.RevokedById = ipAcesso;
            _context.Update(usuario);
            _context.SaveChanges();
        }

        public LoginResponse Update(int id, UpdateModel model) {
            var usuario = getUsuario(id);
            //validar
            if (usuario.Email != model.Email && _context.Usuarios.Any(x => x.Email == model.Email))
                throw new AppException($"Email '{model.Email}' já estar sendo  utilizado!");
            if (!string.IsNullOrEmpty(model.Senha))
                usuario.SenhaHash = BC.HashPassword(model.Senha);
            //copiar modal do usuario e salvar
            _mapper.Map(model, usuario);
            usuario.Atualizado = DateTime.UtcNow;
            _context.Usuarios.Update(usuario);
            _context.SaveChanges();
            return _mapper.Map<LoginResponse>(usuario);
        }

        public void validateResetToken(ValidateResetTokenModel model) {
            throw new NotImplementedException();
        }

        public void VerificarEmail(string token) {
            var user = _context.Usuarios.SingleOrDefault(x => x.VerificacaoToken == token);
            if (user == null) throw new AppException("Verificação  falhou!");
            user.Verificado = DateTime.UtcNow;
            user.VerificacaoToken = null;
            _context.Usuarios.Update(user);
            _context.SaveChanges();
        }

        public void Deactive(int id)
        {
            var user = getUsuario(id);

            if (user != null) {
                user.Active = false;
                _context.Usuarios.Update(user);
                _context.SaveChanges();
            }
            else
                throw new ApplicationException("Usuário não encontrado!");
        }

        private string generateJwtToken(Usuarios usuarios) 
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSetting.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor 
            {
                Subject = new ClaimsIdentity(new[] {new Claim("id", usuarios.Id.ToString()) }),
                Expires = DateTime.UtcNow.AddMinutes(15),
                SigningCredentials = new SigningCredentials( new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);


        }
        private RefreshToken generateRefreshToken(string ipAcesso) 
        {
            return new RefreshToken 
            {
                Token = randomTokenString(),
                Expires = DateTime.UtcNow.AddDays(7),
                Created = DateTime.UtcNow,
                CreatedById = ipAcesso
            };
        
        }
        private string randomTokenString() 
        {
            using var rngCryptoServiceProvider = new RNGCryptoServiceProvider();
            var randomBytes = new byte[40];
            rngCryptoServiceProvider.GetBytes(randomBytes);
            //converte random bytes de hex string

            return BitConverter.ToString(randomBytes).Replace("-","");
        }

        private (RefreshToken, Usuarios) getRefreshToken(string token) 
        {
            var usuario = _context.Usuarios.SingleOrDefault(u => u.RecarregarToken.Any(t => t.Token == token));
            if (usuario == null) throw new AppException("Token Invalido!");
            var refreshToken = usuario.RecarregarToken.Single(x => x.Token == token);
            if (!refreshToken.IsActive) throw new AppException("Token Invalido!");
            return (refreshToken, usuario);
        }
        private Usuarios getUsuario(int id) 
        {
            var usuario = _context.Usuarios.Find(id);
            if (usuario == null) throw new KeyNotFoundException("Usuario não encontrado!");
            return usuario;
        }

        private void EnviarVerificarEmail(Usuarios usuarios, string origem) 
        {
            string messagem;
            if (!string.IsNullOrEmpty(origem)) {
                var verifiUrl = $"{origem}/Usuario/VerificarEmail?={usuarios.VerificacaoToken}";
                messagem = $@"<p>Por vafor click no link abaixo  para verificar o  email de acesso</p>
                            <p><a href=""{verifiUrl}"">{verifiUrl}</a></p>";
            } else 
            {
                messagem = $@"<p>Please use the below token to verify your email address with the <code>/accounts/verify-email</code> api route:</p>
                             <p><code>{usuarios.VerificacaoToken}</code></p>";
            }
            _emailService.Send(
                to: usuarios.Email,
                subject:"Sign-up verificação API - Verificar Email",
                html:$@"<h4> Verificar Email</h4>
                 <p>Obrigado por se registrar</p>
                    {messagem}"
                
                );
        }



    }
}
