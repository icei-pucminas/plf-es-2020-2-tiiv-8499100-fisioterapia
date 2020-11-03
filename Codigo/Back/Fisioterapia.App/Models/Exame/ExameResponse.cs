using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using Fisioterapia.Models.Entidades;

namespace Fisioterapia.App.Models.Exame
{
    public class ExameResponse
    {
        public int Id { get; set; }
        public int IdAtleta { get; set; }
        //public int IdUsuario { get; set; }
        public int IdAuxiliar { get; set; }
        //public virtual Atleta Atleta { get; set; }
        //public virtual Usuarios Usuarios { get; set; }
        public virtual Auxiliar Auxiliar { get; set; }
        public ICollection<ExameExercicios> ExameExercicios { get; set; }
    }
}

