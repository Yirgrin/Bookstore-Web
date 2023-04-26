using Bookstore_Web.Model;
using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using c= Bookstore_Web.Controller;
using m = Bookstore_Web.Model;


namespace Bookstore_Web
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IsLogged();

            if (!IsPostBack)
            {
                c.Books bookController = new c.Books();
                repBooks.DataSource = bookController.GetBooks();
                repBooks.DataBind();
            }
        }

        private void IsLogged()
        {
            if (Session["loginInfo"] == null)
            {
                btnLogout.Visible = false;
                lblUser.Visible = true;

            }
            else
            {
                btnLogout.Visible = true;
                lblUser.Visible = false;

                m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];
                c.Books bookController = new c.Books();
                List<m.Book> books = bookController.GetShoppingCart(session);
                List<m.Book> favorites = bookController.GetFavoriteBooks(session);

                int booksCount = 0;
                int favoritesCount = 0;
            
                foreach (var item in books)
                {
                    booksCount += 1;
                }
                lblBooksCount.InnerText = booksCount.ToString();

                foreach (var item in favorites)
                {
                    favoritesCount += 1;
                }
                lblfavoritesCount.InnerText = favoritesCount.ToString();
            }
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            string search = txtSearchedBook.Value.ToString();

            c.Books booksController = new c.Books();
            repBooks.DataSource = booksController.GetSearchedBook(search); ;
            repBooks.DataBind();
        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            Session.Clear();
            IsLogged();
            msg = $"alert('¡Gracias por preferirnos!')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
        }
    }
}