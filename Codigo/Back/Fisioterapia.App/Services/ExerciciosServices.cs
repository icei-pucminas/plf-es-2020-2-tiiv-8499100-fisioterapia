using AutoMapper;
using Fisioterapia.App.Models.Exercicios;
using Fisioterapia.Models;
using Fisioterapia.Models.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Services {
    public class ExerciciosServices : IExerciciosServices {
        private readonly DataContext _context;
        private readonly IMapper _mappe;

        public ExerciciosServices(DataContext context, IMapper mapper) {
            _context = context;
            _mappe = mapper;
        }
        public void Exercicios(ICollection<ExameExercicios> model, int IdExame) {
            foreach (var item in model) {
                item.IdExame = IdExame;
                var exercicios = _mappe.Map<ExameExercicios>(item);
                _context.ExameExercicios.Add(exercicios);
                _context.SaveChanges();
            }
        }

        public void Teste(ExerciciosModel model) {
            var teste = _context.ExameExercicios.SingleOrDefault(t => t.IdExame == model.IdExame && t.IdExercios == model.IdExercicio);
            if (teste != null) {
                teste.Valor1 = model.Valor1;
                teste.Valor2 = model.Valor2;
                teste.Valor3 = model.Valor3;
                teste.Valor4 = model.Valor4;
                teste.Valor5 = model.Valor5;
                teste.Valor6 = model.Valor6;
                teste.Valor7 = model.Valor7;
                teste.Valor8 = model.Valor8;
                teste.Resultado1 = model.Resultado1;
                teste.Resultado2 = model.Resultado2;
            }
            _context.ExameExercicios.Update(teste);
            _context.SaveChanges();

        }
    }
}
