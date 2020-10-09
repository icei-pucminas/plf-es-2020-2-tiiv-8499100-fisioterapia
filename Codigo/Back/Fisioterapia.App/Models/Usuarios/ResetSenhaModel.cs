using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Models.Usuarios {
    public class ResetSenhaModel {
        [Required]
        public string Token { get; set; }
        [Required]
        [MinLength(6)]
        public string Senha { get; set; }
        [Required]
        [Compare("Senha")]
        public string ConfirmarSenha { get; set; }
    }
}
