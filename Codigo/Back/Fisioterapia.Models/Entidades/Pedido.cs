using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Fisioterapia.Models.Entidades {
    public class Pedido {
        public int Id { get; set; }
        public int IdUsuario { get; set; }

        public int IdAuxiliar { get; set; }

        public string NomeAlteta { get; set; }

        [ForeignKey("IdUsuario")]
        public virtual Usuarios Usuarios { get; set; }

        [ForeignKey("IdAuxiliar")]
        public virtual Auxiliar Auxiliar { get; set; }

    }
}
