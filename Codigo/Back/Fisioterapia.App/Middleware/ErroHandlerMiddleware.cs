using Fisioterapia.App.Helpers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.Json;
using System.Threading.Tasks;


namespace Fisioterapia.App.Middleware {
    public class ErroHandlerMiddleware {
        private readonly RequestDelegate _next;
        public ErroHandlerMiddleware(RequestDelegate next) {
            _next = next;
        }
        public async Task Invoke(HttpContext context) 
        {
            try {
                await _next(context);

            } catch (Exception erro) 
            {
                var respnse = context.Response;
                respnse.ContentType = "application/json";
                switch (erro) 
                {
                    case AppException e:
                        respnse.StatusCode = (int)HttpStatusCode.BadRequest;
                        break;
                    case KeyNotFoundException e:
                        respnse.StatusCode = (int)HttpStatusCode.NotFound;
                        break;
                    default:
                        respnse.StatusCode = (int)HttpStatusCode.InternalServerError;
                        break;
                }
                var result = JsonSerializer.Serialize(new { message = erro?.Message });
                await respnse.WriteAsync(result);
            }
        }
    }
}
