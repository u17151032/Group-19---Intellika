using System.Threading.Tasks;
using AutoMapper;
using CloudinaryDotNet;
using iservz.api.Dtos;
using iservz.api.Helpers;
using iservz.api.Properties.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Security.Claims;
using CloudinaryDotNet.Actions;
using Iservz.API.Properties.Models;
using System.Linq;

namespace iservz.api.Controllers
{
    [Authorize]
    [Route("api/users/{userId}/photos")]
    [ApiController]
    public class PhotosController : ControllerBase
    {
        private readonly IservzRepository _repo;
        private readonly IMapper _mapper;

        private readonly IOptions<CloudinarySettings> _cloudinaryConfig;
        private Cloudinary _cloudinary;

        public PhotosController(IservzRepository repo, IMapper mapper,
        
        IOptions<CloudinarySettings> cloudinaryConfig)
        {
            _cloudinaryConfig = cloudinaryConfig;
            _mapper = mapper;
            _repo = repo;

            Account acc = new Account(
                "intellika",
                "586134569684365",
                "QLKd2nSkdwWFt_v9SGmJ-aKNc8Q"
            );

            _cloudinary = new Cloudinary(acc);

        }

        [HttpGet("{id}", Name = "GetPhoto")]
        public async Task<IActionResult> GetPhoto(int id)
        {
            var photoFromRepo = await _repo.GetPhoto(id);

            var photo = _mapper.Map<PhotoForReturnDto>(photoFromRepo);

            return Ok(photo);
        }

        [HttpPost]
        [ActionName("GetPhoto")]
        public async Task<IActionResult> AddPhotoForUser(int userId,
         [FromForm]PhotoForCreationDto photoForCreationDto)
        {
               if(userId != int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value))
               return Unauthorized();

               var userFromRepo = await _repo.GetUser(userId);
               var file = photoForCreationDto.File;
               var uploadResult = new ImageUploadResult();

               if(file.Length > 0)
               {
                   using(var stream = file.OpenReadStream())
                   {
                       var uploadParams = new ImageUploadParams()
                       {
                           File = new FileDescription(file.Name, stream),
                           Transformation = new Transformation().Width(500).Height(500).Crop("fill").Gravity("face")
                       };

                       uploadResult = _cloudinary.Upload(uploadParams);
                   }
               }

               photoForCreationDto.Url = uploadResult.Uri.ToString();
               photoForCreationDto.PublicId = uploadResult.PublicId;

               var photo = _mapper.Map<Photo>(photoForCreationDto);

               if(!userFromRepo.Photos.Any(u => u.IsMain))
                photo.IsMain=true;

                userFromRepo.Photos.Add(photo);

                if(await _repo.SaveAll())
                {
                    var photoToReturn = _mapper.Map<PhotoForReturnDto>(photo);
                    return CreatedAtRoute( "GetPhoto", new {id = photo.Id}, photoToReturn);
                }

                return BadRequest("Could not add the photo");

            
        }

}
}