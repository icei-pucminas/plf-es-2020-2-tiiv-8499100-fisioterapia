using System.ComponentModel.DataAnnotations;

namespace Fisioterapia.App.Models.Usuarios {
    public class LoginModel {
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        public string Senha { get; set; }
    }
}
