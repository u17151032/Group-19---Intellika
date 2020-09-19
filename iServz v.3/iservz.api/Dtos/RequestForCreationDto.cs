using System;

namespace iservz.api.Dtos
{
    public class RequestForCreationDto
    {
        public int SenderId { get; set; }
        public int RecipientId { get; set; }
        public DateTime MessageSent { get; set; }
        public string Description { get; set; }//content
        public string Date { get; set; }
        public string Time { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }

        public RequestForCreationDto()
        {
            MessageSent = DateTime.Now;
        }
    }
}