using Fisioterapia.App.Helpers;
using Fisioterapia.App.Models.Usuarios;
using Fisioterapia.Models;
using Fisioterapia.Models.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Fisioterapia.App.Services {
    public interface IUsuarioServices {
        LoginResponse login(LoginModel model, string ipAcesso);
        LoginResponse RefreshToken(string token, string ipAcesso);
        void RevokeToken(string token, string ipAcesso);
        void Register(RegisterModel model, string origin);
        void VerificarEmail(string token);
        void RecuperarSenha(EsqueceuSenhaModel model, string origin);
        void validateResetToken(ValidateResetTokenModel model);
        void ResetSenha(ResetSenhaModel model);
        IEnumerable<LoginResponse> GetAll();
        LoginResponse GetById(int id);
        LoginResponse Criar(CriarModel model);
        LoginResponse Update(int id, UpdateModel model);
        void Delete(int id);
        void Deactivate(int id);

    }
    
}
