using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Fisioterapia.Models.Entidades {
    [Owned]
    public class RefreshToken {
        public int Id { get; set; }
        public Usuarios Usuarios { get; set; }
        public string Token { get; set; }
        public DateTime Expires { get; set; }
        public bool IsExpired => DateTime.UtcNow >= Expires;
        public DateTime Created { get; set; }
        public string CreatedById { get; set; }
        public DateTime? Revoked { get; set; }
        public string RevokedById { get; set; }
        public string ReplacedByToken { get; set; }
        public bool IsActive => Revoked == null && !IsExpired;
    }
}
