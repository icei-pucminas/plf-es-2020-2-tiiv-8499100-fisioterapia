using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Fisioterapia.Models.Entidades {
    public class Auxiliar {
        public int Id { get; set; }
        public string Instituicao { get; set; }
        public int Periodo { get; set; }
        public DateTime DataDeNacimento { get; set; }
        public int IdUsuario { get; set; }
        [ForeignKey("IdUsuario")]
        public virtual Usuarios Usuarios { get; set; }

        public string CPF { get; set; }
        public ICollection<AuxiliarUsuarios> AuxiliarUsuarios { get; set; }
    }
}
