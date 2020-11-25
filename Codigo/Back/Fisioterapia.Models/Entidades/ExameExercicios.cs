using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Fisioterapia.Models.Entidades {
    public class ExameExercicios {
        public int IdExame { get; set; }
        public int IdExercios { get; set; }
        [ForeignKey("IdExame ")]
        public virtual Exames Exames { get; set; }
        [ForeignKey("IdExercios")]

        public virtual Exercicios Exercicios { get; set; }
        public string Valor1 { get; set; }
        public string Valor2 { get; set; }
        public string Valor3 { get; set; }
        public string Valor4 { get; set; }
        public string Valor5 { get; set; }
        public string Valor6 { get; set; }
        public string Valor7 { get; set; }
        public string Valor8 { get; set; }

        public string Resultado1 { get; set; }
        public string Resultado2 { get; set; }
    }
}
