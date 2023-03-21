using Bookstore_Web.Model;
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
    public partial class SingIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IsLogged();
        }

        protected void btnLogin_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            c.SingIn loginController = new c.SingIn();

            LoginResponsePayload loginInfo = loginController.SignInWithPassword(new Model.LoginResponsePayload
            {
                email = txtEmail.Value,
                password = txtPass.Value
            });

            if (loginInfo != null && loginInfo.registered)
            {
                Session["loginInfo"] = loginInfo;
                Response.Redirect("~/Views/Homepage.aspx");
            }
            else
            {
                msg = $"alert('Algo salio mal. Intenta de nuevo.')";
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
        }

        private void IsLogged()
        {
            if (Session["loginInfo"] == null)
            {
                btnLogout.Visible = false;
            }
            else
            {
                btnLogout.Visible = true;
            }
        }
    }
}