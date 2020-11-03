using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Fisioterapia.App.Models.Exame;

namespace Fisioterapia.App.Services {
    public  interface IExameServices {
        IEnumerable<ExameResponse> GetAll();
        ExameResponse GetById(int id);
        ExameResponse Criar(CriarExameModel model);
        ExameResponse Update(int id, UpdateExameModel model);

        void Delete(int id);

        DisponibilizarExameResponse  DisponibilizarExame(int id);

        AdicionarExerciciosResponse AdicionarExercicios(int[] id);
        UpdateExerciciosExameResponser RemoverExercicios(int[]id);
        IEnumerable<ExameExercicios> GetAllExercicios(int id);
    }
}
