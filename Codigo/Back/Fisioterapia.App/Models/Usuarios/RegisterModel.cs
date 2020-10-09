using System.ComponentModel.DataAnnotations;

namespace Fisioterapia.App.Models.Usuarios {
    public class RegisterModel {
        [Required]
        public string Titulo { get; set; }
        [Required]
        public string Nome { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        [MinLength(6)]
        public string Senha { get; set; }
        [Required]
        [Compare("Senha")]
        public string ConfirmaSenha { get; set; }
        [Range(typeof(bool),"true","true")]
        public bool AceitoTermos { get; set; }
    }
}
