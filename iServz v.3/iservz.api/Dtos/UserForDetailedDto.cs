using System;
using System.Collections.Generic;
using Iservz.API.Properties.Models;

namespace iservz.api.Dtos
{
    public class UserForDetailedDto
    {
        public int Id {get; set;}
        public string Username {get; set;}
        public string Role { get; set; }
        public int Age { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime Created { get; set; }
        public DateTime LastActive { get; set; } 
        public string Service { get; set; }  
        public string BusinessDescription { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string PhotoUrl { get; set; }
        public ICollection<PhotosForDetailedDto> Photos { get; set; }
    }
}