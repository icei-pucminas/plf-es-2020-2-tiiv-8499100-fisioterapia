using Fisioterapia.App.Helpers;
using Fisioterapia.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fisioterapia.App.Middleware {
    public class JwtMiddleware {
        private readonly RequestDelegate _next;
        private readonly AppSettings _appSettings;
        public JwtMiddleware(RequestDelegate next, IOptions<AppSettings> appsettings) {
            _next = next;
            _appSettings = appsettings.Value;
        }
        public async Task Invoke(HttpContext context, DataContext dataContext) 
        {
            var token = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            if (token != null) 
            {
                await attachAccountToContext(context, dataContext, token);

            }
            await _next(context);
        }
        private async Task attachAccountToContext(HttpContext context, DataContext dataContext, string token) 
        {
            try {
                var tokenHandler = new JwtSecurityTokenHandler();
                var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
                tokenHandler.ValidateToken(token, new TokenValidationParameters {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    // define clockskew para zero para que os tokens expirem exatamente no tempo de expiração do token (em vez de 5 minutos depois)
                    ClockSkew = TimeSpan.Zero

                }, out SecurityToken validatedToken);
                var jwtToken = (JwtSecurityToken)validatedToken;
                var accountId = int.Parse(jwtToken.Claims.First(x => x.Type == "id").Value);
                context.Items["Usuarios"] = await dataContext.Usuarios.FindAsync(accountId);
            } catch 
            {
                // não faça nada se a validação do jwt falhar
                // a conta não está anexada ao contexto, então a solicitação não terá acesso a rotas seguras
            }

        }

    }
}
