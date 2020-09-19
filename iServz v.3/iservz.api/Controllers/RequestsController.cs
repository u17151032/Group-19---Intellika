using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using AutoMapper;
using iservz.api.Dtos;
using iservz.api.Helpers;
using iservz.api.Properties.Data;
using iservz.api.Properties.Models;
using Iservz.API.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace iservz.api.Controllers
{
    [ServiceFilter(typeof(LogUserActvity))]
    [Authorize]
    [Route("api/users/{userId}/[controller]")]
    [ApiController]
    public class RequestsController : ControllerBase
    {
        private readonly IservzRepository _repo;
        private readonly IMapper _mapper;

        public RequestsController(IservzRepository repo, IMapper mapper)
        {
            _mapper = mapper;
            _repo = repo;

        }

        [HttpGet("{id}", Name = "GetRequest")]
        public async Task<IActionResult> GetRequest(int userId, int id)
        {
            if (userId != int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value))
                return Unauthorized();

            var requestFromRepo = await _repo.GetRequest(id);

            if (requestFromRepo == null)
                return NotFound();

            return Ok(requestFromRepo);
        }

        [HttpGet]
        public async Task<IActionResult> GetRequestsForUser(int userId, 
            [FromQuery]RequestParams requestParams)
        {
            if (userId != int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value))
                return Unauthorized();

            requestParams.UserId = userId;

            var requestsFromRepo = await _repo.GetRequestForUser(requestParams);

            var requests = _mapper.Map<IEnumerable<RequestToReturnDto>>(requestsFromRepo);

            Response.AddPagination(requestsFromRepo.CurrentPage, requestsFromRepo.PageSize, 
                requestsFromRepo.TotalCount, requestsFromRepo.TotalPages);
            
            return Ok(requests);
        }

        [HttpGet("thread/{recipientId}")]
        public async Task<IActionResult> GetRequestThread(int userId, int recipientId)
        {
            if (userId != int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value))
                return Unauthorized();

            var requestsFromRepo = await _repo.GetRequestThread(userId, recipientId);

            var requestThread = _mapper.Map<IEnumerable<RequestToReturnDto>>(requestsFromRepo);

            return Ok(requestThread);
        }

        

        [HttpPost]
        [ActionName("GetRequest")]
        public async Task<IActionResult> CreateRequest(int userId, RequestForCreationDto requestForCreationDto)
        {
            //var sender = await _repo.GetUser(userId);

            if (userId != int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value))
                return Unauthorized();

            requestForCreationDto.SenderId = userId;

            var recipient = await _repo.GetUser(requestForCreationDto.RecipientId);

            if (recipient == null)
                return BadRequest("Could not find user");

            var request = _mapper.Map<Request>(requestForCreationDto);//stopped here

            _repo.Add(request);

            var requestToReturn = _mapper.Map<RequestForCreationDto>(request);

            if (await _repo.SaveAll())
            //{
                //var messageToReturn = _mapper.Map<MessageToReturnDto>(message);
                return CreatedAtRoute("GetRequest", new { id = request.Id }, requestToReturn);
            //}

            throw new Exception("Creating the request failed on save");
        }

        
    }
}