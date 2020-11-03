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
            if (_context.Atletas.Any(x => x.Email == model.Email))
                throw new AppException($"Atleta '{ model.Nome }' já está cadastrado!");


            var atleta = _mapper.Map<Atleta>(model);
            _context.Atletas.Add(atleta);
            _context.SaveChanges();
        }

        public void Update(UpdateAtletaModel model, string origem)
        {
            if (_context.Atletas.Any(x => x.Email == model.Email))
            {
                var atleta = _mapper.Map<Atleta>(model);
                _context.Atletas.Update(atleta);
                _context.SaveChanges();
            }
            else
            {
                throw new AppException("Não foi possível atualizar os dados do atleta!");
            }
        }

        public IEnumerable<ResponseAtletaModel> GetAll() {
            var atletas = _context.Atletas;
            return _mapper.Map<IList<ResponseAtletaModel>>(atletas);
        }

        public ResponseAtletaModel GetById(int id) {
            var atleta = getAtleta(id);
            return _mapper.Map<ResponseAtletaModel>(atleta);
        }

        private Atleta getAtleta(int id) {
            var atleta = _context.Atletas.Find(id);
            if (atleta == null) throw new KeyNotFoundException("Usuario não encontrado!");
            return atleta;
        }

    }
}
