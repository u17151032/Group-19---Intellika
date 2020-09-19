using System;

namespace iservz.api.Dtos
{
    public class RequestToReturnDto
    {
        public int Id { get; set; }
        public int SenderId { get; set; }
        public string SenderKnownAs { get; set; }
        public string SenderPhotoUrl { get; set; }
        public int RecipientId { get; set; }
        public string RecipientKnownAs { get; set; }
        public string RecipientPhotoUrl { get; set; }
        public string Description { get; set; }//new
        public string Date { get; set; }//new
        public string Time { get; set; }//new
        public string Address1 { get; set; }//new
        public string Address2 { get; set; }//new
        public string Address3 { get; set; }//new
        public bool IsRead { get; set; }
        public DateTime? DateRead { get; set; }
        public DateTime MessageSent { get; set; }
    }
}
