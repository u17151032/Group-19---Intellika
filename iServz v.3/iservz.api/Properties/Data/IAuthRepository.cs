using System.Threading.Tasks;
using Iservz.API.Properties.Models;

namespace iservz.api.Properties.Data
{
    public interface IAuthRepository
    {
         Task<User> Register(User user, string password);
         Task<User> Login(string username, string password);
         Task<bool> UserExists(string username);
    }
}