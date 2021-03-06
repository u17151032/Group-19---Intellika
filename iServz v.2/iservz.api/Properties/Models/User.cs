using System;
using System.Collections.Generic;

namespace Iservz.API.Properties.Models
{
    public class User
    {
        public int Id {get; set;}
        public string Username {get; set;}
        public byte[] PasswordHash { get; set; }
        public byte[] PasswordSalt { get; set; }
        public string Role { get; set; }
        public DateTime DateOfBirth { get; set; }
        public DateTime Created { get; set; }
        public DateTime LastActive { get; set; }
        public string About { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string Country { get; set; }
        public ICollection<Photo> Photos{get;set;}
        
    }
    
}