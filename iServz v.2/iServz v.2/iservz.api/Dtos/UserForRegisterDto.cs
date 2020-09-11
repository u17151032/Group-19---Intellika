using System;
using System.ComponentModel.DataAnnotations;

namespace iservz.api.Dtos
{
    public class UserForRegisterDto
    {
        [Required]
        public string Username {get; set;}

        [Required]
        [StringLength(8, MinimumLength=5, ErrorMessage="Password must be betwwen 4 and 8 characters")]
        public string Password {get; set;}
        [Required]
        public string Role { get; set; }
    
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public DateTime DateOfBirth { get; set; }
        [Required]
        public string City { get; set; }
        public string Serivce { get; set; }
        public DateTime Created { get; set; }
        public DateTime LastActive { get; set; }

        public UserForRegisterDto()
        {
            Created = DateTime.Now;
            LastActive = DateTime.Now;

        }

    }
}