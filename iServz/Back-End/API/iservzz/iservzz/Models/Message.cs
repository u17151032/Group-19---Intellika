//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace iservzz.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Message
    {
        public int ID { get; set; }
        public string Message1 { get; set; }
        public Nullable<System.DateTime> Time { get; set; }
        public Nullable<int> SO_ID { get; set; }
    
        public virtual ServiceOrder ServiceOrder { get; set; }
    }
}
