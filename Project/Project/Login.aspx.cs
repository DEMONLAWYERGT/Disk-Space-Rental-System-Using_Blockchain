using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient; 


namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Login"] = "Login";
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string q = "Select * from Admin where Username='" + txtemail.Text + "' and Password='" + txtpass.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Login"] = "Admin";

                Response.Redirect("Space.aspx");
            }
            else
            {
                q = "Select * from Users where EmailId='" + txtemail.Text + "' and Password='" + txtpass.Text + "'";
                da = new SqlDataAdapter(q, con);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string regno = dt.Rows[0][0].ToString();
                    Session["Login"] = "User";

                    Response.Redirect("Home.aspx?RegNo=" + regno);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('Invalid Login Credentials!!!')", true);
                }
            }
        }


    }
}