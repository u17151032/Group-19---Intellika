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
    
    public partial class SQ_Line
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SQ_Line()
        {
            this.ServiceOrderLines = new HashSet<ServiceOrderLine>();
        }
    
        public int ID { get; set; }
        public int ServiceID { get; set; }
        public int SQ_ID { get; set; }
        public double Price { get; set; }
        public int ChargeItem_ID { get; set; }
        public Nullable<int> SRL_ID { get; set; }
    
        public virtual ChargeItem ChargeItem { get; set; }
        public virtual Service Service { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiceOrderLine> ServiceOrderLines { get; set; }
        public virtual ServiceQuote ServiceQuote { get; set; }
        public virtual ServiceQuote ServiceQuote1 { get; set; }
        public virtual SR_Line SR_Line { get; set; }
    }
}
