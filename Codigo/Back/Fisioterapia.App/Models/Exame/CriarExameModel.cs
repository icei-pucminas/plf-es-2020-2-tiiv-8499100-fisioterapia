using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Fisioterapia.Models.Entidades;


namespace Fisioterapia.App.Models.Exame
{
    public class CriarExameModel
    {
        [Required]
        public int IdAtleta { get; set; }
        //[Required]
        //public int IdUsuario { get; set; }
        [Required]
        public int IdAuxiliar { get; set; }
        //[Required]
        //public virtual Atleta Atleta { get; set; }
        //public virtual Usuarios Usuarios { get; set; }
        [Required]
        public virtual Auxiliar Auxiliar { get; set; }
        public ICollection<ExameExercicios> ExameExercicios { get; set; }
    }
}
