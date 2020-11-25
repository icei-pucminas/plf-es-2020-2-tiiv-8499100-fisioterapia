using Fisioterapia.App.Models.Exercicios;
using Fisioterapia.Models.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Services {
    public interface IExerciciosServices {
        public void Exercicios(ICollection<ExameExercicios> model, int IdExames);

        public void Teste(ExerciciosModel model); 
    }
}
