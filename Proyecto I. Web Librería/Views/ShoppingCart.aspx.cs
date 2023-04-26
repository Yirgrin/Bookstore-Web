using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;
using c = Bookstore_Web.Controller;
using m = Bookstore_Web.Model;

namespace Bookstore_Web.Views
{
    public partial class ShoppingCart : System.Web.UI.Page
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
                IsLogged();
                LoadCartPage();
                CalculateBill();

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

            }
        }

        public void LoadCartPage()
        {
            m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];
            c.Books bookController = new c.Books();
            repCart.DataSource = bookController.GetShoppingCart(session);
            repCart.DataBind();

        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            Session.Clear();
            IsLogged();
            msg = $"alert('¡Gracias por preferirnos!')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
        }

        public void CalculateBill()
        {
            m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];
            c.Books bookController = new c.Books();
            List<m.Book> books = bookController.GetShoppingCart(session);
            List<m.Book> favorites = bookController.GetFavoriteBooks(session);
            decimal unit;
            decimal total = 0;
            int booksCount = 0;
            int favoritesCount = 0;

            foreach (var item in books)
            {
                unit = item.Price;
                total += unit;
                booksCount += 1;
            }

            lblbooksCount.InnerText = booksCount.ToString();
            lblsubTotal.InnerText = "₡ " + total.ToString();
            lblTotal.InnerText = "₡ " + total.ToString();

            foreach (var item in favorites)
            {
                favoritesCount += 1;
            }
            lblfavoritesCount.InnerText = favoritesCount.ToString();

        }

        protected void btnDeleteCart_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            var button = (HtmlButton)sender;
            Session["bookId"] = Convert.ToInt16(button.Attributes["dataId"]);

            int bookId = Convert.ToInt16(Session["bookId"]);
            m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];

            c.Books bookController = new c.Books();
            bookController.DeleteCartBook(session.email, bookId);
            msg = $"alert('Libro eliminado de favoritos.')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
            LoadCartPage();
        }
    }
}