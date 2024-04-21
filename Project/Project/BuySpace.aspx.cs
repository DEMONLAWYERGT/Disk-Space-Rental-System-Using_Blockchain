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
    public partial class BuySpace : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            string html = "";
            string regno = Request.QueryString["RegNo"];
            string qu = "Select * from HardDisks where Status='Accepted' and RegNo !='" + regno + "' Order by SrNo";
            SqlDataAdapter da = new SqlDataAdapter(qu, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int c = dt.Rows.Count;
            if (c > 0)
            {
                for (int i = 0; i < c; i++)
                {
                    html += "<div class='card col-lg-3 ml-4 mt-2' style='height:auto;border:ridge;margin: 1%;width:22%'><div class='card-body'><br><img class='img-responsive' style='width: 350px; height: 200px;' src='Images/8.jpg' /><div class='pt-2 text-center' style='width:105%;margin-top:5px'><asp:Label ID = 'Label9' Style='font-size: x-large;' runat='server' Text=''>Space : " + dt.Rows[i][2].ToString() + " GB</asp:Label><br><asp:Label ID = 'Label10' Style='font-size: x-large;' runat='server' Text=''>Duration : " + dt.Rows[i][3].ToString() + " Months</asp:Label><br></div><hr style='width:98%;border:ridge'/><button id='btnbuy' type='button' class='btn btn-primary btn-lg btn-block' onclick='buy(" + dt.Rows[i][0].ToString() + ")'>Buy</button><br/></div></div>";
                }
                contentDiv.InnerHtml = html;
                lbnodata.Visible = false;
            }
            else
            {
                lbnodata.Visible = true;
                contentDiv.Visible = false;
            }

            
        }

        protected void lbtnbuy_Click(object sender, EventArgs e)
        {
            string regno = Request.QueryString["RegNo"];
            string value = hdf_Srno.Value;
            Response.Redirect("Payment.aspx?RegNo="+regno+"&HsrNo="+value);
           // Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('" + value + "')", true);
        }
    }
}