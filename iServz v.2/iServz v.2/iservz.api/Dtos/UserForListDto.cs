using System;

namespace iservz.api.Dtos
{
    public class UserForListDto
    {
        public int Id {get; set;}
        public string Username {get; set;}
        public string Role { get; set; }
        public int Age { get; set; }
        public string FirstName { get; set; }
        public string Service { get; set; }
        public string LastName { get; set; }
        public DateTime Created { get; set; }
        public DateTime LastActive { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string PhotoUrl { get; set;}
        
    }
}