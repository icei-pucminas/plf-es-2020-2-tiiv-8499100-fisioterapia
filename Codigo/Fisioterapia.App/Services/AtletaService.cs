using AutoMapper;
using Fisioterapia.App.Helpers;
using Fisioterapia.App.Models.Atleta;
using Fisioterapia.Models;
using Fisioterapia.Models.Entidades;
using Microsoft.EntityFrameworkCore.Internal;
using Microsoft.Extensions.Options;
using Org.BouncyCastle.Math.EC.Rfc7748;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Services
{
    public class AtletaService : IAtletaService
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly AppSettings _appSettings;

        public AtletaService(DataContext context, IMapper mapper, IOptions<AppSettings> appSettings)
        {
            _context = context;
            _mapper = mapper;
            _appSettings = appSettings.Value;
        }
        public void Cadastro(CadastrarAtletaModel model, string origem)
        {
            if (_context.Atleta.Any(x => x.Email == model.Email))
                throw new AppException($"Atleta '{ model.Nome }' já está cadastrado!");

            var atleta = _mapper.Map<Atleta>(model);
            _context.Atleta.Add(atleta);
            _context.SaveChanges();
        }

        public void Update(UpdateAtletaModel model, string origem)
        {
            if (_context.Atleta.Any(x => x.Email == model.Email))
            {
                var atleta = _mapper.Map<Atleta>(model);
                _context.Atleta.Update(atleta);
                _context.SaveChanges();
            }
            else
            {
                throw new AppException("Não foi possível atualizar os dados do atleta!");
            }
        }
    }
}
