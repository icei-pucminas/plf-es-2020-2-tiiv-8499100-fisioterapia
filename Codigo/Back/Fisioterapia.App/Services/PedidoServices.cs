using AutoMapper;
using Fisioterapia.App.Models.Pedido;
using Fisioterapia.Models;
using Fisioterapia.Models.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Services {
    public class PedidoServices : IPedidosServices {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        public PedidoServices(DataContext context, IMapper mapper) {
            _context = context;
            _mapper = mapper;
           
        }
        public PedidoModelResponse CriarPedido(PedidoModel model) {
            var pedido = new Pedido {
               
                IdAuxiliar = model.IdAuxiliar,
                IdUsuario = model.IdUsuario,
                NomeAlteta = model.NomeAtleta
            };
            _context.Pedidos.Add(pedido);
            _context.SaveChanges();
            return _mapper.Map<PedidoModelResponse>(pedido);
        }



        public IEnumerable<PedidoModelResponse> GetAll(int id) {
            var pedidos = _context.Pedidos.Where(p => p.IdAuxiliar == id && !_context.Atletas.Any(a=>a.Nome == p.NomeAlteta)).ToList();
            List<PedidoModelResponse> lista = new List<PedidoModelResponse>();
            foreach (var item in pedidos) 
            {
                var dados = new PedidoModelResponse {
                 NomeAtleta = item.NomeAlteta,
                 Fisioterapeuta = _context.Usuarios.FirstOrDefault(a=>a.Id == item.IdUsuario).Nome
                };
                lista.Add(dados);
            }
           return lista;
        }
    }
}
