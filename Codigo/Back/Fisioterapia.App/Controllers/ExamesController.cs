using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AutoMapper;
using Fisioterapia.App.Services;
using Fisioterapia.App.Models.Exame;
using Fisioterapia.App.Helpers;
namespace Fisioterapia.App.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ExamesController : ControllerBase
    {
        private IExameServices _exameServices;
        private IMapper _mapper;

        public ExamesController(IExameServices exameServices, IMapper mapper)
        {
            _exameServices = exameServices;
            _mapper = mapper;

        }

        [HttpGet("getAll")]
        public IEnumerable<ExameResponse> GetAll()
        {
            return _exameServices.GetAll();
        }

        [HttpGet("{id}")]
        public ExameResponse GetById(int id)
        {
            return _exameServices.GetById(id);
        }

        [HttpPost("registerExame")]
        public IActionResult Register([FromBody] CriarExameModel model)
        {
            if (model == null)
            {
                return BadRequest(new { message = "É necessário fornecer dados do exame!" });
            }

            try
            {
                _exameServices.Criar(model);
                return Ok(new { message = "Exame registrado com sucesso!" });
            }
            catch (AppException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody] UpdateExameModel model)
        {
            try
            {
                _exameServices.Update(id, model);
                return Ok();
            }
            catch (AppException ex)
            {
                return BadRequest(new { message = ex.Message });
            }

        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _exameServices.Delete(id);
            return Ok(new { message = "Exame excluido  com  sucesso!" });
        }

        [HttpGet("{id}")]
        public IActionResult GetAllExercicios(int id)
        {
            var response = _exameServices.GetAllExercicios(id);
            return Ok(response);
        }
    }
}
