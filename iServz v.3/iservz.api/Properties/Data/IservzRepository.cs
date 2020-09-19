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
         Task<Photo> GetMainPhotoForUser(int userId);
         Task<Message> GetMessage(int id);//message
         Task<PagedList<Message>> GetMessagesForUser(MessageParams messageParams);//message
         Task<IEnumerable<Message>> GetMessageThread(int userId, int recipientId);//message
         Task<Request> GetRequest(int id);//request
         Task<PagedList<Request>> GetRequestForUser(RequestParams requestParams);//request
         Task<IEnumerable<Request>> GetRequestThread(int userId, int recipientId);//request
    }
}