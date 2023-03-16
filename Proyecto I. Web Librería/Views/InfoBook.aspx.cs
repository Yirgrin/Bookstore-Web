using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using c = Bookstore_Web.Controller;
using m = Bookstore_Web.Model;

namespace Bookstore_Web.Views
{
    public partial class InfoBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int Id = Convert.ToInt16(Request.QueryString["Id"]);

                c.Books booksController = new c.Books();
                List<m.Book> book = booksController.GetInfoBook(Id);
                repInfoBook.DataSource = book;
                repInfoBook.DataBind();
            }
                
        }
    }
}
