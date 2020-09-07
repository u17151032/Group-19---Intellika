using System.Threading.Tasks;
using AutoMapper;
using iservz.api.Dtos;
using iservz.api.Properties.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace iservz.api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UsersCotroller : ControllerBase
    {
        private readonly IiservzRepository _repo;
        private readonly IMapper _mapper;
        public UsersCotroller(IiservzRepository repo, IMapper mapper)
        {
            _mapper = mapper;
            _repo = repo;

        }

        [HttpGet]
        public async Task<IActionResult> GetUsers()
        {
            var users = await _repo.GetUsers();
            var  usersToReturn = _mapper.Map<UserForDetailedDto>(users);
            return Ok(usersToReturn);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetUser(int id)
        {
            var user = await _repo.GetUser(id);

            var  userToReturn = _mapper.Map<UserForDetailedDto>(user);
            return Ok(userToReturn);
        }

    }
}