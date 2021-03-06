using System.Collections.Generic;
using System.Threading.Tasks;
using Iservz.API.Properties.Models;
using Microsoft.EntityFrameworkCore;

namespace iservz.api.Properties.Data
{
    public class iservzRepository : IiservzRepository
    {
        private readonly DataContext _context;
        public iservzRepository(DataContext context)
        {
            _context = context;

        }
        public void Add<T>(T entity) where T : class
        {
            _context.Add(entity);
        }

        public void Delete<T>(T entity) where T : class
        {
            _context.Remove(entity);
        }

        public Task<User> GetUser(int id)
        {
           var user = _context.Users.Include(p => p.Photos).FirstOrDefaultAsync(u => u.Id == id);
           return user;
        }

      
        public async Task<IEnumerable<User>> GetUsers()
        {
            var users = await _context.Users.Include(p=>p.Photos).ToListAsync();
            return users;
          
        }

        public async Task<bool> SaveAll()
        {
            return await _context.SaveChangesAsync() > 0;
        }
    }
}