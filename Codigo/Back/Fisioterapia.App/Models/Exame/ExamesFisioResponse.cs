using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Models.Exame {
    public class ExamesFisioResponse {
        public int IdExame { get; set; }
        public List<ExerciciosExamerespondidosResponse> IdsExamesExercicios { get; set; }
        public string NomeAtleta { get; set; }

        public string NomeFisioterapeuta { get; set; }
    }
}
