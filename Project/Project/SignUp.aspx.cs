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
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Login"] = "Login";
        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "Insert into Users(Name,MobileNo,EmailId,Password) Values('" + txtname.Text + "','" + txtmobno.Text + "','" + txtemail.Text + "','" + txtpassword.Text + "')";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('User Registered Successfully!!!')", true);
            txtname.Text = "";
            txtmobno.Text = "";
            txtemail.Text = "";           
            txtpassword.Text = "";
        }

    }
}