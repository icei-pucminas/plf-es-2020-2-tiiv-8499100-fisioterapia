using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Fisioterapia.App.Models.Exercicios;
using Fisioterapia.Models.Entidades;


namespace Fisioterapia.App.Models.Exame
{
    public class CriarExameModel
    {
        
        public int IdAtleta { get; set; }
       
        public int IdUsuario { get; set; }
     
        public int IdAuxiliar { get; set; }
      
       
        public ICollection<ExameExercicios> ExameExercicios { get; set; }
    }
}
