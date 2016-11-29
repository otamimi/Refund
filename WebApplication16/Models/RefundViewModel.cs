using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WebApplication16.Models
{
    public class RequestViewModel
    {
        [Required]
        [Display(Name = "Request Type")]
        public IEnumerable<RequestType> Types { get; set; }

        [Required]
        [Display(Name = "Amount")]
        public decimal Amount { get; set; }

        [Required]
        [Display(Name = "Country")]
        public IEnumerable<Country> Countries { get; set; }

        [Display(Name = "From Bank Account")]
        public BankAccount FromBankAccount { get; set; }

        public BankAccount ToBankAccount { get; set; }
       
    }
}