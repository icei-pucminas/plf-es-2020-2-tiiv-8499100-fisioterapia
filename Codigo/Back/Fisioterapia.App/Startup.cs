using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using Fisioterapia.App.Helpers;
using Fisioterapia.App.Services;
using Fisioterapia.App.Middleware;
using Fisioterapia.Models;

using Microsoft.Extensions.Hosting;

namespace Fisioterapia.App {
    public class Startup {

        private readonly IWebHostEnvironment _env;
        private readonly IConfiguration _configuration;
        public Startup(IWebHostEnvironment env, IConfiguration configuration) {
            _env = env;
            _configuration = configuration;
        }
        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services) {
            if (_env.IsProduction()) { 
               services.AddDbContext<DataContext, SqlServerContext>();
                
            } else {
                services.AddDbContext<DataContext, SqlServerContext>();
              
            }
            services.AddCors();
            services.AddControllers();
            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
            services.AddSwaggerGen();

            services.Configure<AppSettings>(_configuration.GetSection("AppSettings"));

            services.AddScoped<IUsuarioServices, UsuarioService>();
            services.AddScoped<IAuxiliarService, AuxiliarService>();
            services.AddScoped<IAtletaService, AtletaService>();
            services.AddScoped<IEmailService, EmailService>();
            services.AddScoped<IPedidosServices, PedidoServices>();
            services.AddScoped<IExerciciosServices, ExerciciosServices>();
            services.AddScoped<IExameServices, ExameService>();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, DataContext dataContext) {
            dataContext.Database.Migrate();
            app.UseSwagger();
            app.UseSwaggerUI(x => x.SwaggerEndpoint("/swagger/v1/swagger.json", "ASP.NET Core Sign-up and Verification API"));
            app.UseRouting();
            app.UseCors(x =>x.SetIsOriginAllowed(origin => true).AllowAnyMethod().AllowAnyHeader().AllowCredentials());
            app.UseMiddleware<ErroHandlerMiddleware>();
            app.UseMiddleware<JwtMiddleware>();
            app.UseEndpoints(x => x.MapControllers());
        }
    }
}
