using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Fisioterapia.App.Models.Exame;
using Fisioterapia.Models.Entidades;

namespace Fisioterapia.App.Services {
    public  interface IExameServices {
        IEnumerable<ExameResponse> GetAll();
        ExameResponse GetById(int id);
        void Criar(CriarExameModel model);
        ExameResponse Update(int id, UpdateExameModel model);

        void Delete(int id);

        DisponibilizarExameResponse  DisponibilizarExame(int id);

        AdicionarExerciciosResponse AdicionarExercicios(int[] id);
        UpdateExerciciosExameResponser RemoverExercicios(int[]id);
        IEnumerable<DisponibilizarExerciciosResponse> GetAllExercicios();
        public IEnumerable<ListaExamesAuxiliar> GetAuxiliarExame(int id);
        public int? Notificacao(int idExame);
        public IEnumerable<ListaExamesFisio> GetFisioExame(int id);
    }
}
