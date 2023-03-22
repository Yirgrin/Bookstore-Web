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
    public partial class Favorites : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["loginInfo"] == null)
                {
                    string msg = string.Empty;
                    msg = $"alert('Necesitas tener una cuenta para acceder a favoritos')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
                    Response.Redirect("~/Views/Homepage.aspx");
                }

                m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];
                c.Books bookController = new c.Books();
                repFavorites.DataSource = bookController.GetFavoriteBooks(session);
                repFavorites.DataBind();

            }
        }
    }
}