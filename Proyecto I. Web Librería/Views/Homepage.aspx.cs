using Bookstore_Web.Model;
using System;
using System.Collections.Generic;
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
            if (!IsPostBack)
            {
                IsLogged();
                c.Books bookController = new c.Books();
                repBooks.DataSource = bookController.GetBooks();
                repBooks.DataBind();
            }
        }

        protected void btnLogin_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            c.Login loginController = new c.Login();

            LoginResponsePayload loginInfo = loginController.SignInWithPassword(new Model.LoginResponsePayload
            {
                email = txtEmail.Value,
                password = txtPass.Value
            });

            if (loginInfo != null && loginInfo.registered)
            {
                Session["loginInfo"] = loginInfo;
                msg = "Bienvenido " + txtEmail.Value;
                IsLogged();


            }
            else
            {
                msg = "Tus datos son incorrectos";
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('Login','" + msg + "')", true);
        }

        private void IsLogged()
        {
            if (Session["loginInfo"] != null)
            { 
                cardUser.Attributes.Remove("hidden");
            }
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            string SearchBook = txtSearchedBook.Value.ToString();

            c.Books booksController = new c.Books();
            List<m.Book> book = booksController.GetSearchedBook(SearchBook);
            repSearch.DataSource = book;
            repSearch.DataBind();
        }
    }
}