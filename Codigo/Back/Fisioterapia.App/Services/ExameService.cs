using Fisioterapia.App.Models.Exame;
using System;
using System.Collections.Generic;
using AutoMapper;
using Fisioterapia.App.Helpers;
using Fisioterapia.App.Models.Atleta;
using Fisioterapia.Models;
using Fisioterapia.Models.Entidades;
using Microsoft.EntityFrameworkCore.Internal;
using Microsoft.Extensions.Options;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Services
{
    public class ExameService : IExameServices
    {

        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly AppSettings _appSettings;

        public ExameService(DataContext context, IMapper mapper, IOptions<AppSettings> appSettings)
        {
            _context = context;
            _mapper = mapper;
            _appSettings = appSettings.Value;
        }
        public AdicionarExerciciosResponse AdicionarExercicios(int[] id)
        {
            throw new NotImplementedException();
        }

        public ExameResponse Criar(CriarExameModel model)
        {
            //if (_context.Exames.Any(x => x.Id == model.Id))
            //    throw new AppException($"Exame já estar registrado");

            var exame = _mapper.Map<Exames>(model);

            _context.Exames.Add(exame);
            _context.SaveChanges();
            return _mapper.Map<ExameResponse>(exame);
        }

        public void Delete(int id)
        {
            var exame = getExame(id);
            _context.Exames.Remove(exame);
            _context.SaveChanges();
        }

        public DisponibilizarExameResponse DisponibilizarExame(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<ExameResponse> GetAll()
        {
            var exames = _context.Exames;

            return _mapper.Map<IList<ExameResponse>>(exames);
        }

        public ExameResponse GetById(int id)
        {
            var exame = getExame(id);

            return _mapper.Map<ExameResponse>(exame);
        }

        public UpdateExerciciosExameResponser RemoverExercicios(int[] id)
        {
            throw new NotImplementedException();
        }

        public ExameResponse Update(int id, UpdateExameModel model)
        {
            var exame = getExame(id);

            _mapper.Map(model, exame);
            _context.Exames.Update(exame);
            _context.SaveChanges();

            return _mapper.Map<ExameResponse>(exame);
        }

        private Exames getExame(int id)
        {
            var exame = _context.Exames.Find(id);
            if (exame == null) throw new KeyNotFoundException("Exame não encontrado!");
            return exame;
        }

        public IEnumerable<ExameExercicios> GetAllExercicios(int id)
        {
            var exercicios = _context.ExameExercicios.Where(a => a.IdExame == id);
            List<ExamesExercicios> Exercicios = new List<ExamesExercicios>();
            foreach (var item in exercicios)
            {
                var exameExercicio = _context.ExamesExercicios.SingleOrDefault(u => u.Id == item.IdExame);
                if (exameExercicio != null)
                    Exercicios.Add(exameExercicio);
            }
            return _mapper.Map<IList<ExameExercicios>>(Exercicios);
        }
    }
}
