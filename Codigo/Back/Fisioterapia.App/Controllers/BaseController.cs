using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Fisioterapia.Models.Entidades;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Fisioterapia.App.Controllers {
    [Controller]
    public class BaseController : ControllerBase {
        // retorna a conta autenticada atual (nulo se não estiver conectado)
        public Usuarios Usuarios => (Usuarios)HttpContext.Items["Usuarios"];
        public Auxiliar Auxiliar => (Auxiliar)HttpContext.Items["Auxiliar"];

    }
}
