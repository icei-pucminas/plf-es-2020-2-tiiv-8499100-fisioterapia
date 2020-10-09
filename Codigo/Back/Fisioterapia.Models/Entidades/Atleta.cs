using System;
using System.Collections.Generic;
using System.Text;

namespace Fisioterapia.Models.Entidades
{
    public class Atleta
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
        public byte OcorreuContusao { get; set; }
    }
}
