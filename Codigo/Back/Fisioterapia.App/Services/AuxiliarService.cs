using AutoMapper;
using Fisioterapia.App.Helpers;
using Fisioterapia.App.Models.auxiliar;
using Fisioterapia.App.Models.Usuarios;
using Fisioterapia.Models;
using Fisioterapia.Models.Entidades;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BC = BCrypt.Net.BCrypt;

namespace Fisioterapia.App.Services {
    public class AuxiliarService : IAuxiliarService {
        private readonly DataContext _context;
        private readonly IMapper _mappe;
        private readonly AppSettings _appSeiting;
        private readonly IEmailService _emailService;
     
        public AuxiliarService(DataContext context, IMapper mapper, IOptions<AppSettings> appSetting, IEmailService emailService, IUsuarioServices usuarioServices) {
            _context = context;
            _mappe = mapper;
            _appSeiting = appSetting.Value;
            _emailService = emailService;
           

        }
        public void Criar(ModelAuxiliar model) {
             int id = CriarUsuario(model.Email, model.Senha, model.Nome);
             var auxiliar = _mappe.Map<Auxiliar>(model);
             auxiliar.IdUsuario = id;
            _context.Auxiliars.Add(auxiliar);
            _context.SaveChanges();
           
        }
        private int CriarUsuario(string email, string senha, string nome) {
            //validar
            if (_context.Usuarios.Any(x => x.Email == email))
                throw new AppException($"Email '{email}' já estar registrado");
            //map model do  usuario objeto
            var usuario = new Usuarios {
                Nome = nome,
                Email = email,
                Role = Role.Auxi,
                Titulo = "Mr"
               
            };

            usuario.Criado = DateTime.UtcNow;
            usuario.Verificado = DateTime.UtcNow;
            usuario.Codvinculo = "H589LC";
            //hash senha
            usuario.SenhaHash = BC.HashPassword(senha);
            //salvar a conta
            _context.Usuarios.Add(usuario);
            _context.SaveChanges();
            return _context.Usuarios.SingleOrDefault(a=>a.Email == email).Id;
        }

        public void Delete(int id) {
            var auxiliar = getAuxiliar(id);
            _context.Auxiliars.Remove(auxiliar);
            _context.SaveChanges();
        }
        private Auxiliar getAuxiliar(int id) 
        {
            var auxiliar = _context.Auxiliars.Find(id);
            if (auxiliar == null) throw new KeyNotFoundException("Atleta não  encontrado!");
            return auxiliar;
        }

        public IEnumerable<ModelAuxiliarResponse> GetAll() {
            var auxiliar = _context.Auxiliars;
            return _mappe.Map<IList<ModelAuxiliarResponse>>(auxiliar);
        }

        public ModelAuxiliarResponse GetById(int id) {
            var auxiliar = getAuxiliar(id);
            return _mappe.Map<ModelAuxiliarResponse>(auxiliar);
        }

        public ModelAuxiliarResponse Update(int id, UpdateAuxiliar model) {
            var auxiliar = getAuxiliar(id);
            return _mappe.Map<ModelAuxiliarResponse>(auxiliar);
        }

        public void VincularAuxiliar(AuxiliarVincular model) {
            var vinculo = new AuxiliarUsuarios { 
                IdAuxiliar = model.Id,
                IdUsuario = _context.Usuarios.SingleOrDefault(a=>a.Codvinculo.Contains(model.codVinculo)).Id
            };
            _context.AuxiliarUsuarios.Add(vinculo);
            _context.SaveChanges();
        }

        
    }
}
