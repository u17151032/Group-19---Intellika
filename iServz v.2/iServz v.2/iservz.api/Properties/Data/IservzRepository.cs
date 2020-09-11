using System.Collections.Generic;
using System.Threading.Tasks;
using iservz.api.Helpers;
using iservz.api.Properties.Models;
using Iservz.API.Properties.Models;

namespace iservz.api.Properties.Data
{
    public interface IservzRepository
    {
         void Add<T>(T entity) where T: class;
         void Delete<T>(T entity) where T: class;
         Task<bool> SaveAll();
         Task<PagedList<User>> GetUsers(UserParams userParams);
         Task<User> GetUser(int id);
         Task<Photo> GetPhoto(int id);
         Task<Message> GetMessage(int id);
         Task<PagedList<Message>> GetMessagesForUser(MessageParams messageParams);
         Task<IEnumerable<Message>> GetMessageThread(int userId, int recipientId);
    }
}