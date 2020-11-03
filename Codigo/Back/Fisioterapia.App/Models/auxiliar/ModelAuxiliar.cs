using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Models.auxiliar {
    public class ModelAuxiliar {
        public string Email { get; set; }
        public string Senha { get; set; }
       
        [Compare("Senha")]
        public string confirmarSenha { get; set; }
        public string Nome { get; set; }
        public string Instituicao { get; set; }
        public int Periodo { get; set; }
        public DateTime DataDeNacimento { get; set; }
      
        public string CPF { get; set; }
    }
}
