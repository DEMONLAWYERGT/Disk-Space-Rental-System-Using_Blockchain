using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Main : System.Web.UI.MasterPage
    {
        string regno;
        protected void Page_Load(object sender, EventArgs e)
        {
            regno = Request.QueryString["RegNo"];
            if (System.Web.HttpContext.Current.Session["Login"] != null)
            {
                string login = Session["Login"].ToString();
                if (login == "Admin")
                {
                    PAdmin.Visible = true;
                    PUser.Visible = false;
                    PDefault.Visible = false;
                    //this.bodytag.Style["background-image"] = Page.ResolveUrl("~/Images/1.jpg");
                    //this.bodytag.Style["background-repeat"] = "no-repeat";
                    //this.bodytag.Style["background-size"] = "cover";
                }
                else if (login == "User")
                {
                    PAdmin.Visible = false;
                    PUser.Visible = true;
                    PDefault.Visible = false;
                    //this.bodytag.Style["background-image"] = Page.ResolveUrl("~/Images/1.jpg");
                    //this.bodytag.Style["background-repeat"] = "no-repeat";
                    //this.bodytag.Style["background-size"] = "cover";
                }
                else
                {
                    //this.bodytag.Style["background-image"] = Page.ResolveUrl("~/Images/1.jpg");
                    //this.bodytag.Style["background-repeat"] = "no-repeat";
                    //this.bodytag.Style["background-size"] = "cover";
                    PDefault.Visible = true;
                    PUser.Visible = false;
                    PAdmin.Visible = false;
                }
            }
        }

        //User module redirect

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?RegNo=" + regno);
        }

        protected void profile(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx?RegNo=" + regno);
        }

        protected void RentSpace(object sender, EventArgs e)
        {
            Response.Redirect("RentSpace.aspx?RegNo=" + regno);
        }

        protected void BuySpace(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx?RegNo=" + regno);
        }

        protected void transaction(object sender, EventArgs e)
        {
            Response.Redirect("Transactions.aspx?RegNo=" + regno);
        }

        protected void ChngPass(object sender, EventArgs e)
        {
            Response.Redirect("ChngPassword.aspx?RegNo=" + regno);
        }

    }
}