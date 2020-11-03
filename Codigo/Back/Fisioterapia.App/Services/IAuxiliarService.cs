using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Fisioterapia.App.Models.auxiliar;

namespace Fisioterapia.App.Services {
     public  interface IAuxiliarService {
        IEnumerable<ModelAuxiliarResponse> GetAll();
        ModelAuxiliarResponse GetById(int id);
        void Criar(ModelAuxiliar model);
        ModelAuxiliarResponse Update(int id, UpdateAuxiliar model);
        void Delete(int id);

        void VincularAuxiliar(AuxiliarVincular model);
    }
}
