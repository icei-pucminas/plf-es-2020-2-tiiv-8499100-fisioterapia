using AutoMapper;
using Fisioterapia.Models.Entidades;
using Fisioterapia.App.Models.Usuarios;
using Fisioterapia.App.Models.Atleta;

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
            CreateMap<CadastrarAtletaModel, Atleta>();
            CreateMap<UpdateAtletaModel, Atleta>();
        }
    }
}
