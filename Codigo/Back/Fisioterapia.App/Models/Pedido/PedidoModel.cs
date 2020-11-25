using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Models.Pedido {
    public class PedidoModel {
        public int IdUsuario { get; set; }
        public string NomeAtleta { get; set; }

        public int IdAuxiliar { get; set; }
    }
}
