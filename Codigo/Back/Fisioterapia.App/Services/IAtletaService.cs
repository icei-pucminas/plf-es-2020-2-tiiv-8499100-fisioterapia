using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Fisioterapia.App.Models.Atleta;

namespace Fisioterapia.App.Services
{
    public interface IAtletaService
    {
        void Cadastro(CadastrarAtletaModel model, string origem);
        void Update(UpdateAtletaModel model, string origem);

    }
}
