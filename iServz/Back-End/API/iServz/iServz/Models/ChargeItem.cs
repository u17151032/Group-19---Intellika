//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace iServz.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ChargeItem
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ChargeItem()
        {
            this.SQ_Line = new HashSet<SQ_Line>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public int ItemTypeID { get; set; }
    
        public virtual ItemType ItemType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SQ_Line> SQ_Line { get; set; }
    }
}
