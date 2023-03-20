using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace Bookstore_Web.Model
{
    public class Book
    {
        public int Id { get; set; }
        public String ISBN { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string ReleaseDate { get; set; }
        public string Description { get; set; }
        public string Photo { get; set; }
        public decimal Price { get; set; }
    }
}