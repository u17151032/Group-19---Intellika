using System.Linq;
using AutoMapper;
using iservz.api.Dtos;

using Iservz.API.Properties.Models;

namespace iservz.api.Helpers
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<User, UserForListDto>()
            .ForMember(dest => dest.PhotoUrl, opt =>{
                opt.MapFrom(src => src.Photos.FirstOrDefault(p => p.IsMain).Url);
            });
            CreateMap<User, UserForDetailedDto>();
            CreateMap<Photo, PhotoForDetailedDto>();
        }

        
    }
}