using System;
using Iservz.API.Properties.Models;

namespace iservz.api.Properties.Models
{
    public class Request
    {
        public int Id { get; set; }
        public int SenderId { get; set; }
        public User Sender { get; set; }
        public int RecipientId { get; set; }
        public User Recipient { get; set; }
        public string Description { get; set; } //only similarity(called content on message)
        public string Date { get; set; }//new
        public string Time { get; set; }//new
        public string Address1 { get; set; }//city
        public string Address2 { get; set; }//surburb
        public string Address3 { get; set; }//street
        public bool IsRead { get; set; }
        public DateTime? DateRead { get; set; }
        public DateTime MessageSent { get; set; }
        public bool SenderDeleted { get; set; }
        public bool RecipientDeleted { get; set; }
    }
}