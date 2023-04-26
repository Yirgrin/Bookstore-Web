using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bookstore_Web.Model
{
    public class Purchase
    {
        public string Client { get; set; }
        public string Email { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public int PostalCode { get; set; }
        public int CardNumber{ get; set; }
        public DateTime ExpDate { get; set; }
        public int SecurityCode { get; set; }


    }
}