using Fisioterapia.Models.Entidades;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Helpers {
    public class AuthorizeAttribute: Attribute, IAuthorizationFilter {
        private readonly IList<Role> _roles;
        public AuthorizeAttribute(params Role[] role) {
            _roles = role ?? new Role[] { };
        }
        public void OnAuthorization(AuthorizationFilterContext context) 
        {
            var usuario = (Usuarios)context.HttpContext.Items["Usuarios"];
            if (usuario == null || (_roles.Any() && !_roles.Contains(usuario.Role))) 
            {
                context.Result = new JsonResult(new { message = "Unauthorized" }) { StatusCode = StatusCodes.Status401Unauthorized };
            }
        }


    }
}
