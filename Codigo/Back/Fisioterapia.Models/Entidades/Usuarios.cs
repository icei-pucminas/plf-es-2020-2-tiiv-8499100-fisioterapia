using System;
using System.Collections.Generic;

namespace Fisioterapia.Models.Entidades {
    public class Usuarios {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Nome { get; set; }

        public string Email { get; set; }
        public string SenhaHash { get; set; }
        public bool AceitoTermos { get; set; }
        public Role Role { get; set; }
        public string VerificacaoToken { get; set; }
        public DateTime? Verificado { get; set; }
        public bool IsVerificado => Verificado.HasValue || SenhaReset.HasValue;
        public string ResetToken { get; set; }
        public DateTime? ResetTokenExpires { get; set; }
        public DateTime? SenhaReset { get; set; }
        public DateTime Criado { get; set; }
        public DateTime? Atualizado { get; set; }
        public List<RefreshToken> RecarregarToken { get; set; }
        public bool OwnsToken(string token) {
            return this.RecarregarToken?.Find(x => x.Token == token) != null;
        } 
        public bool Active { get; set; }

    }
}
