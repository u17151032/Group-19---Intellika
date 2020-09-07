using System.Collections.Generic;
using System.Threading.Tasks;
using Iservz.API.Properties.Models;

namespace iservz.api.Properties.Data
{
    public interface IiservzRepository
    {
         void Add<T>(T entity) where T: class;
         void Delete<T>(T entity) where T: class;
         Task<bool> SaveAll();
         Task<IEnumerable<User>> GetUsers(); 
         Task<User> GetUser(int id);
    }
}