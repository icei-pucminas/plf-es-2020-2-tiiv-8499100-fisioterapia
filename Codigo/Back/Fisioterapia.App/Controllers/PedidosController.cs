using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Fisioterapia.App.Models.Pedido;
using Fisioterapia.App.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Fisioterapia.App.Controllers {
    [Route("[controller]")]
    [ApiController]
    public class PedidosController : BaseController {

        private IPedidosServices _PedidoServices;
        private IMapper _mapper;

        public PedidosController(IPedidosServices PedidoServices, IMapper mapper) {
            _PedidoServices = PedidoServices;
            _mapper = mapper;

        }
        [HttpPost("CriarPedido")]
        public IActionResult CriarPedido([FromBody]PedidoModel model) 
        {
            _PedidoServices.CriarPedido(model);
            return Ok(new { messagem = "Pedido Realizado  com Sucesso!" });
        }


        [HttpGet("{id}")]
        public IActionResult GetAllAuxiliar(int id) {
            var response = _PedidoServices.GetAll(id);
            return Ok(response);
        }
    }
}
