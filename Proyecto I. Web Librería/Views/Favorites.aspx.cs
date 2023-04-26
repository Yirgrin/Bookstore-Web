using Bookstore_Web.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using c = Bookstore_Web.Controller;
using m = Bookstore_Web.Model;

namespace Bookstore_Web.Views
{
    public partial class Favorites : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginInfo"] == null)
            {
                string msg = string.Empty;
                msg = $"alert('Necesitas tener una cuenta para acceder a favoritos')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
                Response.Redirect("~/Views/Homepage.aspx");

            }
            else
            {
                LoadFavoritePage();
                IsLogged();

            }
        }

        public void LoadFavoritePage()
        {
            m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];
            c.Books bookController = new c.Books();
            repFavorites.DataSource = bookController.GetFavoriteBooks(session);
            repFavorites.DataBind();

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

        protected void btnDeleteFavorite_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            var button = (HtmlButton)sender;
            Session["bookId"] = Convert.ToInt16(button.Attributes["dataId"]);

            int bookId = Convert.ToInt16(Session["bookId"]);
            m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];

            c.Books bookController = new c.Books();
            bookController.DeleteFavoriteBook(session.email, bookId);
            msg = $"alert('Libro eliminado de favoritos.')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
            LoadFavoritePage();
        }
    }
}