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
using Microsoft.EntityFrameworkCore;

namespace Fisioterapia.App.Services {
    public class ExameService : IExameServices {

        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly AppSettings _appSettings;

        private IExerciciosServices _exerciciosServices;

        public ExameService(DataContext context, IMapper mapper, IOptions<AppSettings> appSettings, IExerciciosServices exerciciosServices) {
            _context = context;
            _mapper = mapper;
            _appSettings = appSettings.Value;
            _exerciciosServices = exerciciosServices;
        }
        public AdicionarExerciciosResponse AdicionarExercicios(int[] id) {
            throw new NotImplementedException();
        }

        public void Criar(CriarExameModel model) {
             var contador = _context.Exames.Where(a => a.IdAtleta == model.IdAtleta).Count();

            var exame = new Exames {
                IdAtleta = model.IdAtleta,
                IdAuxiliar = model.IdAuxiliar,
                IdUsuario = model.IdUsuario,
                QuantiFichas = contador + 1
            };

            _context.Exames.Add(exame);
            _context.SaveChanges();


            var Exercicios = model.ExameExercicios;

            _exerciciosServices.Exercicios(Exercicios, _context.Exames.FirstOrDefault(a => a.IdAtleta == model.IdAtleta && a.QuantiFichas == (contador+1)).Id);


        }

        public void Delete(int id) {
            var exame = getExame(id);
            _context.Exames.Remove(exame);
            _context.SaveChanges();
        }

        public DisponibilizarExameResponse DisponibilizarExame(int id) {
            throw new NotImplementedException();
        }

        public IEnumerable<ExameResponse> GetAll() {
            var exames = _context.Exames;

            return _mapper.Map<IList<ExameResponse>>(exames);
        }

        public ExameResponse GetById(int id) {
            var exame = getExame(id);

            return _mapper.Map<ExameResponse>(exame);
        }

        public UpdateExerciciosExameResponser RemoverExercicios(int[] id) {
            throw new NotImplementedException();
        }

        public ExameResponse Update(int id, UpdateExameModel model) {
            var exame = getExame(id);

            _mapper.Map(model, exame);
            _context.Exames.Update(exame);
            _context.SaveChanges();

            return _mapper.Map<ExameResponse>(exame);
        }

        private Exames getExame(int id) {
            var exame = _context.Exames.Find(id);
            if (exame == null) throw new KeyNotFoundException("Exame não encontrado!");
            return exame;
        }

        public IEnumerable<DisponibilizarExerciciosResponse> GetAllExercicios() {
            var exercicios = _context.Exercicios;
            return _mapper.Map<IList<DisponibilizarExerciciosResponse>>(exercicios);
        }

        public IEnumerable<ListaExamesAuxiliar> GetAuxiliarExame(int id) {
            List<ListaExamesAuxiliar> listas = new List<ListaExamesAuxiliar>();
            List<ExameExerciciosResponse> exameExercicios = new List<ExameExerciciosResponse>();
            var exame = _context.Exames.Include(a => a.ExameExercicios).Where(a => a.IdAuxiliar == id && a.ExameExercicios.Any(e=>e.Valor1 == null)).ToList();
            foreach (var item in exame) {
                foreach (var item2 in item.ExameExercicios) {
                    var dados1 = new ExameExerciciosResponse {
                        IdExame = item2.IdExame,
                        IdExercios = item2.IdExercios,
                        Nome = _context.Exercicios.SingleOrDefault(e=>e.Id == item2.IdExercios).Nome
                    };
                    exameExercicios.Add(dados1);
                }
                var dados = new ListaExamesAuxiliar {
                    IdExame = item.Id,
                    IdsExamesExercicios = exameExercicios.Where(a=>a.IdExame == item.Id).ToList(),
                    NomeAtleta = _context.Atletas.Single(a => a.Id == item.IdAtleta).Nome,
                    NomeFisioterapeuta =_context.Usuarios.Single(u=>u.Id == item.IdUsuario).Nome
                };
                listas.Add(dados);
            }
            return listas;
        }

        public int? Notificacao(int idExame) 
        {
            int? notificar = null;
            if (_context.ExameExercicios.Any(a => a.IdExame == idExame && a.Resultado1 == null)) {
                notificar = 1;
            } else 
            {
                notificar = 2;
            }
            return notificar;
        }
        public IEnumerable<ListaExamesFisio> GetFisioExame(int id) {
            List<ListaExamesFisio> listas = new List<ListaExamesFisio>();
            List<ExerciciosExamerespondidosResponse> exameExercicios = new List<ExerciciosExamerespondidosResponse>();
            var exame = _context.Exames.Include(a => a.ExameExercicios).Where(a => a.IdUsuario == id).ToList();
            foreach (var item in exame) {
                foreach (var item2 in item.ExameExercicios) {
                    var dados1 = new ExerciciosExamerespondidosResponse {
                        IdExame = item2.IdExame,
                        IdExercios = item2.IdExercios,
                        Nome = _context.Exercicios.SingleOrDefault(e => e.Id == item2.IdExercios).Nome,
                        Valor1 = item2.Valor1,
                        Valor2 = item2.Valor2,
                        Valor3 = item2.Valor3,
                        Valor4 = item2.Valor4,
                        Valor5 = item2.Valor5,
                        Valor6 = item2.Valor6,
                        Valor7 = item2.Valor7,
                        Valor8 = item2.Valor8,
                        Resultado1 = item2.Resultado1,
                        Resultado2 = item2.Resultado2
                    };
                    exameExercicios.Add(dados1);
                }
                var dados = new ListaExamesFisio {
                    IdExame = item.Id,
                    IdsExamesExercicios = exameExercicios.Where(a => a.IdExame == item.Id).ToList(),
                    NomeAtleta = _context.Atletas.Single(a => a.Id == item.IdAtleta).Nome,
                    NomeFisioterapeuta = _context.Usuarios.Single(u => u.Id == item.IdUsuario).Nome,
                    AuxiliarNome = _context.Usuarios.Single(a=>a.Id == _context.Auxiliars.Single(u=>u.Id == item.IdAuxiliar).IdUsuario).Nome
                };
                listas.Add(dados);
            }
            return listas;
        }
    }
}
