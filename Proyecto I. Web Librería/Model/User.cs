using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bookstore_Web.Model
{
    public class LoginResponsePayload
    {
        public string email { get; set; }
        public string password { get; set; }
        public bool registered { get; set; }
    }
}
