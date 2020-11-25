using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Fisioterapia.App.Models.Pedido;


namespace Fisioterapia.App.Services {
    public interface IPedidosServices {
        PedidoModelResponse CriarPedido(PedidoModel model);
        IEnumerable<PedidoModelResponse> GetAll(int id);

    }
}
