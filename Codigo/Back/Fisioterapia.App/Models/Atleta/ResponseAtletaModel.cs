using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Models.Atleta
{
    public class ResponseAtletaModel
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public DateTime Idade { get; set; }
        public string LadoDominante { get; set; }
        public int Numero { get; set; }
        public string Posicao { get; set; }
        public float Peso { get; set; }
        public float Altura { get; set; }
        public string Celular { get; set; }
        public string Profissao { get; set; }
        public bool OcorreuContusao { get; set; }
    }
}
