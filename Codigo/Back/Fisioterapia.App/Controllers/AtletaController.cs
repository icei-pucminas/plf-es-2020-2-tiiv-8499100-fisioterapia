using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Fisioterapia.App.Models.Atleta;
using Fisioterapia.App.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Fisioterapia.App.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AtletaController : BaseController
    {
        private IAtletaService _atletaService;
        private IMapper _mapper;

        public AtletaController(IAtletaService atletaService, IMapper mapper)
        {
            _atletaService = atletaService;
            _mapper = mapper;
        }
        [HttpPost("cadastrarAtleta")]
        public ActionResult<CadastrarAtletaModel>cadastrar([FromBody]CadastrarAtletaModel model)
        {
            _atletaService.Cadastro(model,Request.Headers["origem"]);

            return Ok(new { message = "Atleta cadastrado com sucesso!" });
        }
        [HttpPost("updateAtleta")]
        public ActionResult<UpdateAtletaModel> update(UpdateAtletaModel model)
        {
            _atletaService.Update(model, Request.Headers["origem"]);

            return Ok(new { message = "Atleta atualizado com sucesso!" });
        }
        [HttpGet("getallatleta")]
        public IActionResult GetAll() 
        {
            var atleta = _atletaService.GetAll();
            return Ok(atleta);
        }
        [HttpGet("{id}")]
        public ActionResult<ResponseAtletaModel> GetAll(int Id) {
            var atleta = _atletaService.GetById(Id);
            return Ok(atleta);
        }
    }

}
