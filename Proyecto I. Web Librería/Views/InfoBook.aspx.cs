﻿using Bookstore_Web.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
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
            IsLogged();
            if (!IsPostBack)
            {
                int Id = Convert.ToInt16(Request.QueryString["Id"]);

                c.Books booksController = new c.Books();
                List<m.Book> book = booksController.GetInfoBook(Id);
                Session["book"] = book;
                repInfoBook.DataSource = book;
                repInfoBook.DataBind();
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

        protected void userEmail()
        {
            string msg = string.Empty;
            if (Session["loginInfo"] == null)
            {
                msg = $"alert('Necesitas tener una cuenta para añadir libros a favoritos')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
            }

            m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];
            string email= session.email.ToString();

            List<m.Book> books = (List<m.Book>)Session["book"];

            m.Book book = new m.Book()
            {
                Id = books[0].Id,
                email = email,
            };
            Session["book"] = book;

        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            Session.Clear();
            IsLogged();
            msg = $"alert('¡Gracias por preferirnos!')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
        }

        protected void btnFavorite_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            if (Session["loginInfo"] == null)
            {
                msg = $"alert('Necesitas tener una cuenta para añadir libros a favoritos')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
            }

            userEmail();
            m.Book book = (m.Book)Session["Book"];

            c.Books bookController = new c.Books();

            if (bookController.SaveFavoriteBook(book))
            {
                msg = $"alert('¡Libro añadido a tu lista de favoritos!')";
                Page.ClientScript.RegisterStartupScript(this.GetType(),"Mensaje", msg , true);
            }
            else
            {
                msg = $"alert('Ocurrió un error al añadir el libro a favoritos.')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
            }

            
        }
    }
}
