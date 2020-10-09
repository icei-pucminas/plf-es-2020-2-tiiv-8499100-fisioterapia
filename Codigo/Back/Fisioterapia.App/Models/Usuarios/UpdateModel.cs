using Fisioterapia.Models.Entidades;
using System.ComponentModel.DataAnnotations;

namespace Fisioterapia.App.Models.Usuarios {
    public class UpdateModel {

        private string _senha;
        private string _confirmarsenha;
        private string _role;
        private string _email;
        public string Titulo { get; set; }
        public string Nome { get; set; }
        public bool Active { get; set; }

        [EnumDataType(typeof(Role))]
        public string Role {
            get => _role;
            set => _role = replaceEmptyWithNull(value);
        }
        [EmailAddress]
        public string Email {
            get => _email; set => _email = replaceEmptyWithNull(value);

        }
        [MinLength(6)]
        public string Senha { get => _senha; set => _senha = replaceEmptyWithNull(value); }
        [Compare("Senha")]
        public string ConfirmarSenha { get => _confirmarsenha; set => _confirmarsenha = replaceEmptyWithNull(value); }


        private string replaceEmptyWithNull(string value) {
            return string.IsNullOrEmpty(value) ? null : value;
        }
    }
}
