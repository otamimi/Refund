//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication16.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Request
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Request()
        {
            this.UploadedDocemuent = new HashSet<UploadedDocemuent>();
        }
    
        public int Id { get; set; }
        public RequestStatus Status { get; set; }
        public int TypeId { get; set; }
        public string CitizenUserId { get; set; }
        public Nullable<int> PayrollId { get; set; }
        public decimal Amount { get; set; }
        public System.Guid ReferenceNumber { get; set; }
        public string EmployeeUserId { get; set; }
        public string Note { get; set; }
        public int CountryId { get; set; }
        public Nullable<int> FromBankAccount { get; set; }
        public int ToBankAccount { get; set; }
    
        public virtual BankAccount BankAccount { get; set; }
        public virtual BankAccount BankAccount1 { get; set; }
        public virtual Country Country { get; set; }
        public virtual PayRoll PayRoll { get; set; }
        public virtual RequestType RequestType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UploadedDocemuent> UploadedDocemuent { get; set; }
    }
}
