using System.ComponentModel.DataAnnotations;

namespace iservz.api.Dtos
{
    public class UserForRegisterDto
    {
        [Required]
        public string Username {get; set;}

        [Required]
        [StringLength(8, MinimumLength=4, ErrorMessage="Password must be betwwen for and 8 characters")]
        public string Password {get; set;}
    }
}