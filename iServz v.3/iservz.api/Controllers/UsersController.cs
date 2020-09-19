using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using iservz.api.Dtos;
using iservz.api.Properties.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using iservz.api.Helpers;
using System;
using Iservz.API.Helpers;

namespace iservz.api.Controllers
{
    [ServiceFilter(typeof(LogUserActvity))]
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IservzRepository _repo;
        private readonly IMapper _mapper;
        public UsersController(IservzRepository repo, IMapper mapper)
        {
            _mapper = mapper;
            _repo = repo;

        }

        [HttpGet]
        public async Task<IActionResult> GetUsers([FromQuery]UserParams userParams)
        {
            var currentUserId =int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var userFromRepo = await _repo.GetUser(currentUserId);
            userParams.UserId = currentUserId;

            if (string.IsNullOrEmpty(userParams.Role))
            {
                userParams.Role = userFromRepo.Role == "consumer" ? "serviceProvider" : "serviceProvider";
            }

            if (string.IsNullOrEmpty(userParams.FirstName))//remove
            {
                userParams.FirstName = userFromRepo.FirstName == " " ? "houseKeeping" : "gardening";
            }
            

            var users = await _repo.GetUsers(userParams);

            var usersToReturn = _mapper.Map<IEnumerable<UserForListDto>>(users);

            Response.AddPagination(users.CurrentPage, users.PageSize,
                users.TotalCount, users.TotalPages);

            return Ok(usersToReturn);
        }

        [HttpGet("{id}", Name="GetUser")]
        public async Task<IActionResult> GetUser(int id)
        {
            var user = await _repo.GetUser(id);

            var userToReturn =  _mapper.Map<UserForDetailedDto>(user);

            return Ok(userToReturn);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateUser(int id, UserForUpdateDto userForUpdateDto)
        {
            if(id != int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value))
               return Unauthorized();

               var userFromRepo = await _repo.GetUser(id);

               _mapper.Map(userForUpdateDto, userFromRepo);

               if(await _repo.SaveAll())
               return NoContent();
               
               throw new Exception($"Updating User {id} failed on save");
        }


    }
}