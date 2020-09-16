using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Models.Atleta
{
    public class UpdateAtletaModel
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        [Range(typeof(int), "0", "??")]
        public int Numero { get; set; }
        [Required]
        public string Posicao { get; set; }
        [Required]
        public float Peso { get; set; }
        [Required]
        public string Celular { get; set; }
        public string Profissao { get; set; }
    }
}
