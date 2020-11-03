using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Fisioterapia.App.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Fisioterapia.App.Models.auxiliar;
using Fisioterapia.Models.Entidades;


namespace Fisioterapia.App.Controllers {
    [Route("[controller]")]
    [ApiController]
    public class AuxiliarController : BaseController{

        private IAuxiliarService _auxiliarService;
        private IMapper _mapper;
        public AuxiliarController(IAuxiliarService auxiliarService, IMapper mapper) {
            _auxiliarService = auxiliarService;
            _mapper = mapper;
        }

        [HttpPost("register")]
        public IActionResult Register([FromBody]ModelAuxiliar model) {

            _auxiliarService.Criar(model);
            return Ok(new { message = "Cadastrado com sucesso!" });
        }

        [HttpPost("update")]
        public IActionResult Update(int id, [FromBody] UpdateAuxiliar model) {

            try { _auxiliarService.Update(id, model);
                return Ok();
            } catch 
            {
                return BadRequest(new { message = "Erro ao  atualizar usuario!" });
            }
            
        }
        [HttpDelete("{id}")]
        public IActionResult Delete(int id) {
            _auxiliarService.Delete(id);
            return Ok(new { message = "Auxiliar excluido  com  sucesso!" });
        }
        [HttpPost("vincular")]
        public IActionResult VincularAuxiliar([FromBody] AuxiliarVincular model) 
        {
            _auxiliarService.VincularAuxiliar(model);
            return Ok(new { message = "Vinculado com  Sucesso!" });
        }


    }
}
