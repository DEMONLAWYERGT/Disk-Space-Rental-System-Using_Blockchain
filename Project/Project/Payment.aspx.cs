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
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }        
    
        protected void txtspace_TextChanged(object sender, EventArgs e)
        {
            if (txtspace.Text == "") { }
            else
            {
                int dur = Convert.ToInt32(txtspace.Text);              
                int cost = dur * 50;
                txtcost.Text = cost.ToString();
            }
        }

        protected void btnpay_Click(object sender, EventArgs e)
        {
            string date = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            date = date.Replace('-', '/');
            string hsrno = Request.QueryString["HSrNo"];
            string regno = Request.QueryString["RegNo"];


            con.Open();
            string qu = "Insert into Transactions(RegNo,Space,Duration,Cost,CardNo,CVV,Datetime,Status) values('" + regno + "','" + txtspace.Text + "','" + txtduration.Text + "','" + txtcost.Text + "','" + txtcardno.Text + "','" + txtcvv.Text + "','" + date + "','Pending')";
            SqlCommand cmd = new SqlCommand(qu, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Payment done succesfully!!!')", true);

            txtspace.Text = "";
            txtduration.Text = "";
            txtcost.Text = "";
            txtcardno.Text = "";
            txtcvv.Text = "";
            
        }

        



    }
}