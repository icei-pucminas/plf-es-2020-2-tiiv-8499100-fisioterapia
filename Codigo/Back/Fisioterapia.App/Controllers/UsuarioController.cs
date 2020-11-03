using System;
using System.Collections.Generic;
using AutoMapper;
using System.Security.Claims;
using Fisioterapia.App.Helpers;
using Fisioterapia.App.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Fisioterapia.App.Models.Usuarios;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using Fisioterapia.Models.Entidades;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace Fisioterapia.App.Controllers {

    [Route("[controller]")]
    [ApiController]
    public class UsuarioController : BaseController {
        private IUsuarioServices _usuarioServices;
        private IMapper _mapper;
       
        public UsuarioController(IUsuarioServices usuarioServices, IMapper mapper) {
            _usuarioServices = usuarioServices;
            _mapper = mapper;
           
        }
       
        [HttpPost("login")]
        public ActionResult<LoginResponse> Login([FromBody] LoginModel model) 
        {
            var response = _usuarioServices.login(model, IpAcesso());
            SetTokenCookie(response.RecarregarToken);
            return  Ok(response);
            
        }

        [HttpPost("register")]
        public IActionResult Register(RegisterModel model) 
        {
            _usuarioServices.Register(model, Request.Headers["origin"]);
            return Ok(new {message = "Cadastrado com sucesso, por favor check o  seu email para verificação!" });
        }

        private void SetTokenCookie(string token) 
        {
            var cookieOption = new CookieOptions 
            {
                HttpOnly = true,
                Expires = DateTime.UtcNow.AddDays(7)
            };
            Response.Cookies.Append("refreshToken", token, cookieOption);
        }
        private string IpAcesso() 
        {
            if (Request.Headers.ContainsKey("X-Forwarded-For"))
                return Request.Headers["X-Forwarded-For"];
            else
                return HttpContext.Connection.RemoteIpAddress.MapToIPv4().ToString();
        }

        [HttpPut("deactivate")]
        public IActionResult Deactivate(int id) {
            _usuarioServices.Deactivate(id);
            return Ok(new { message = "Usuário desativado com sucesso!" });
        }

        [HttpGet("{id}")]
        public IActionResult GetAllAuxiliar(int id) 
        {
            var response = _usuarioServices.GetAllAuxiliar(id);
            return Ok(response);
        }

    }
}
