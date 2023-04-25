using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bookstore_Web.Model
{
    public class Ticket
    {
        public string Cliente { get; set; }
        public string Producto { get; set; }
        public decimal Precio { get; set; }
        public int Cantidad { get; set; }
    }
}