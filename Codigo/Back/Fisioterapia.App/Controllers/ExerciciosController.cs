using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Fisioterapia.App.Models.Exercicios;
using Fisioterapia.App.Services;
using Fisioterapia.Models.Entidades;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Fisioterapia.App.Controllers {
    [Route("[controller]")]
    [ApiController]
    public class ExerciciosController : BaseController {
        private IExerciciosServices _exerciciosServices;
        private IMapper _mapper;
        public ExerciciosController(IExerciciosServices exerciciosServices, IMapper mapper) {
            _exerciciosServices = exerciciosServices;
            _mapper = mapper;
        }

        [HttpPost("Responder")]
        public IActionResult Responder([FromBody] ExerciciosModel model) 
        {
            _exerciciosServices.Teste(model);
            return Ok(new { messagem = "Teste realizado com sucesso!" });
        }
    }
}
