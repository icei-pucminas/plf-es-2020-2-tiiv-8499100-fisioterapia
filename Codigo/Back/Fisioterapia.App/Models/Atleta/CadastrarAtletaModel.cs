using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Models.Atleta
{
    public class CadastrarAtletaModel
    {
        [Required]
        public string Nome { get; set; }
        [Required]
        [EmailAddress]
        public string Email  { get; set; }
        [Required]
        [DataType(DataType.DateTime)]
        public DateTime Idade { get; set; }
        [Required]
        public string LadoDominante { get; set; }
        [Required]
        
        public int Numero { get; set; }
        [Required]
        public string Posicao { get; set; }
        [Required]
        public float Peso { get; set; }
        [Required]
        public float Altura { get; set; }
        [Required]
        public string Celular { get; set; }
        public string Profissao { get; set; }
        [Required]
        public bool OcorreuContusao { get; set; }
    }
}
