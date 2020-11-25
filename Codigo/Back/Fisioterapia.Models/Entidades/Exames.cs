using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Fisioterapia.Models.Entidades {
    public class Exames {
       
        public int Id { get; set; }
        public int IdAtleta { get; set; }
        public int IdUsuario { get; set; }
        public int IdAuxiliar { get; set; }
        [ForeignKey("IdAtleta")]
        public virtual Atleta Atleta { get; set; }
        [ForeignKey("IdUsuario")]
        public virtual Usuarios Usuarios { get; set; }
        [ForeignKey("IdAuxiliar")]
        public virtual Auxiliar Auxiliar { get; set; }

        public ICollection<ExameExercicios> ExameExercicios { get; set; }

        public int QuantiFichas { get; set; }

    }
}
