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
    public partial class Create_Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IsLogged();
        }

        protected void btnSingUp_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            c.SingUp SignUpController = new c.SingUp();

            LoginResponsePayload loginInfo = SignUpController.SignUpWithPassword(new Model.LoginResponsePayload
            {
                email = email.Value,
                password = password.Value,
                
            });


            if (loginInfo.registered == false)
            {
                Session["loginInfo"] = loginInfo;
                Response.Redirect("~/Views/Homepage.aspx");

            }
            else if (loginInfo == null)
            {
                msg = $"alert('Algo salio mal. Intenta de nuevo.')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
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

        
    }
}