using System;
using System.Text.Json.Serialization;

namespace Fisioterapia.App.Models.Usuarios {
    public class LoginResponse {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
        public DateTime Criado { get; set; }
        public DateTime? Atulizado { get; set; }
        public bool IsVerificado { get; set; }
        public string jwtToken { get; set; }
        [JsonIgnore]
        public string RecarregarToken { get; set; }
    }

}
