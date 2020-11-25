using Fisioterapia.Models.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Models.Exame {
    public class ListaExamesAuxiliar {
        public int IdExame { get; set; }
        public List<ExameExerciciosResponse> IdsExamesExercicios { get; set; }
        public string NomeAtleta { get; set; }

        public string NomeFisioterapeuta { get; set; }
    }
}
