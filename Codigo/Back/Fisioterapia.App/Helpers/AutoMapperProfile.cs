using AutoMapper;
using Fisioterapia.Models.Entidades;
using Fisioterapia.App.Models.Usuarios;
using Fisioterapia.App.Models.auxiliar;
using Fisioterapia.App.Models.Atleta;
using Fisioterapia.App.Models.Pedido;
using Fisioterapia.App.Models.Exercicios;
using Fisioterapia.App.Models.Exame;

namespace Fisioterapia.App.Helpers {
    public class AutoMapperProfile : Profile {
        public AutoMapperProfile() {
            CreateMap<Usuarios, UsuarioModel>();
            CreateMap<Usuarios, LoginResponse>();
            CreateMap<RegisterModel, Usuarios>();
            CreateMap<CriarModel, Usuarios>();
            CreateMap<UpdateModel, Usuarios>().ForAllMembers(x => x.Condition(
                (src, dest, prop) => {
                    if (prop == null) return false;
                    if (prop.GetType() == typeof(string) && string.IsNullOrEmpty((string)prop)) return false;
                    if(x.DestinationMember.Name == "Role" && src.Role == null) return false;
                    return true;
                }));

            CreateMap<Auxiliar,ModelAuxiliar >();
            CreateMap<Auxiliar, ModelAuxiliarResponse>();
            CreateMap<ModelAuxiliar, Auxiliar>();
            CreateMap<ModelAuxiliar, Auxiliar>();
            CreateMap<UpdateAuxiliar, Auxiliar>();

            CreateMap<Atleta, CadastrarAtletaModel>();
            CreateMap<Atleta, ResponseAtletaModel>();
            CreateMap<CadastrarAtletaModel, Atleta>();
            CreateMap<CadastrarAtletaModel, Atleta>();
            CreateMap<UpdateAtletaModel, Atleta>();


            CreateMap<Pedido, PedidoModel>();
            CreateMap<Pedido, PedidoModelResponse>();
            CreateMap<PedidoModel, Pedido>();

            CreateMap<ExameExercicios, ExerciciosModel>();




            CreateMap<Exames, CriarExameModel>();
            CreateMap<Exames, ExameResponse>();
            

            CreateMap<Exercicios, DisponibilizarExerciciosResponse>();
            CreateMap<Exames, DisponibilizarExameResponse>();
            CreateMap<DisponibilizarExameResponse, Exames>();
            CreateMap<NotificarModel, Exames>();


        }
    }
}
