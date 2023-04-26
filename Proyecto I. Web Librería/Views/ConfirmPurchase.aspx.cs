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
    public partial class ConfirmPurchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IsLogged();
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

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            Session.Clear();
            IsLogged();
            msg = $"alert('¡Gracias por preferirnos!')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
        }

        protected void btnConfirm_ServerClick(object sender, EventArgs e)
        {
            m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];
            c.Books bookController = new c.Books();
            List<m.Book> books = bookController.GetShoppingCart(session);
            decimal unit;
            decimal total = 0; 

            foreach (var item in books)
            {
                unit = item.Price;
                total += unit;
                HtmlGenericControl bookLabel = new HtmlGenericControl("label");
                bookLabel.InnerText = item.Title + " ............................................................................. ₡ " + item.Price;
                lblBooks.Controls.Add(bookLabel);
            }

            lblClient.InnerHtml = "Correo Electrónico: .................................................................................... " + session.email;

            lblName.InnerHtml = "Nombre: ...................................................................................................... " + first_name.Value + " " + last_name.Value;
            lblTotal.InnerHtml = "Total de la compra: .................................................................................... ₡ " + total; 
            lblCard.InnerHtml = "Cargado a la tarjeta: .................................................................................. " + inputCardNumber.Value;
            lblAddress.InnerHtml = "Se envía a la dirección: ............................................................................. " + textAddress.Value;

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction",
               "showModal()", true);
           
        }
    }
}