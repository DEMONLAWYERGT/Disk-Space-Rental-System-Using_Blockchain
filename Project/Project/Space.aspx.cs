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
    public partial class Space : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GvBind();
            }
        }

        protected void GvBind()
        {
            string q = "Select * from HardDisks where Status != 'Accepted' order by SrNo";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                gridDiv.Visible = true;
                lbnodata.Visible = false;
            }
            else
            {
                gridDiv.Visible = false;
                lbnodata.Visible = true;
            }


            q = "Select * from Transactions  where Status = 'Pending' order by SrNo";
            da = new SqlDataAdapter(q, con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView2.DataSource = ds;
                GridView2.DataBind();
                grid2Div.Visible = true;
                lbanodata.Visible = false;
            }
            else
            {
                grid2Div.Visible = false;
                lbanodata.Visible = true;
            }

            q = "Select h.*, u.[Name] from HardDisks h, Users u where u.RegNo=h.RegNo and h.Status='Accepted'";
            da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dt.Columns.Add("Total Space");
            int c = dt.Rows.Count;
            if (c > 0)
            {
                for (int i = 0; i < c; i++)
                {
                    string storage = dt.Rows[i]["Storage"].ToString();
                    string rntspc = dt.Rows[i]["RentSpace"].ToString();
                    int totalspace = Convert.ToInt32(storage) + Convert.ToInt32(rntspc);
                    var dr = dt.Rows[i];
                    dr["Total Space"] = totalspace.ToString();

                }
                GridView3.DataSource = dt;
                GridView3.DataBind();
                GridView3.Visible = true;
                lbndata.Visible = false;
            }
            else
            {
                GridView3.Visible = false;
                lbndata.Visible = true;
            }

        }

        protected void lbtnsearch_Click(object sender, EventArgs e)
        {
            if (ddlsearch.SelectedValue == "Select" || txtsearch.Text == "")
            {
                GvBind();
            }
            else if (ddlsearch.SelectedValue == "Storage Space")
            {
                string q = "Select * from HardDisks where Status = 'Accepted' and  Storage >='" + txtsearch.Text + "' )";
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    gridDiv.Visible = true;
                    lbnodata.Visible = false;
                }
                else
                {
                    gridDiv.Visible = false;
                    lbnodata.Visible = true;
                }
            }
            else if (ddlsearch.SelectedValue == "Duration")
            {
                string q = "Select * from HardDisks where Status = 'Accepted' and (  Duration >= '" + txtsearch.Text + "')";
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    gridDiv.Visible = true;
                    lbnodata.Visible = false;
                }
                else
                {
                    gridDiv.Visible = false;
                    lbnodata.Visible = true;
                }
            }
        }        

        protected void lbtnaccept_Command(object sender, CommandEventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            GridViewRow row = lbtn.NamingContainer as GridViewRow;

            string srno = row.Cells[0].Text;
            string argument = e.CommandArgument.ToString();
            if (argument.Equals("accept"))
            {
                con.Open();
                string que = "Update HardDisks set Status = 'Accepted' where SrNo='" + srno + "' ";
                SqlCommand cmd = new SqlCommand(que, con);
                cmd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('Rent Hard Drive Request Accepted!!!')", true);
                GvBind();
            }
        }

        protected void lbtnreject_Command(object sender, CommandEventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            GridViewRow row = lbtn.NamingContainer as GridViewRow;

            string srno = row.Cells[0].Text;
            string argument = e.CommandArgument.ToString();
            if (argument.Equals("reject"))
            {
                con.Open();
                string que = "Update HardDisks set Status = 'Rejected' where SrNo='" + srno + "' ";
                SqlCommand cmd = new SqlCommand(que, con);
                cmd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('Rent Hard Drive Request Accepted!!!')", true);
                GvBind();
            }
        }

        protected void lbtnsearch1_Click(object sender, EventArgs e)
        {
            if (ddlsearch1.SelectedValue=="Select" || txtsearch1.Text == "")
            {
                GvBind();
            }
            else if(ddlsearch1.SelectedValue=="Storage Space")
            {
                string q = "Select * from HardDisks where Status = 'Accepted' and  Storage >=" + txtsearch1.Text + " ";
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView2.DataSource = ds;
                    GridView2.DataBind();
                    grid2Div.Visible = true;
                    lbanodata.Visible = false;
                }
                else
                {
                    grid2Div.Visible = false;
                    lbanodata.Visible = true;
                }
            }
            else if (ddlsearch1.SelectedValue == "Duration")
            {
                string q = "Select * from HardDisks where Status = 'Accepted' and (  Duration >= '" + txtsearch1.Text + "')";
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView2.DataSource = ds;
                    GridView2.DataBind();
                    grid2Div.Visible = true;
                    lbanodata.Visible = false;
                }
                else
                {
                    grid2Div.Visible = false;
                    lbanodata.Visible = true;
                }
            }
        }

        protected void ddlsearch1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlsearch1.SelectedValue == "Storage Space")
            {
                txtsearch1.Attributes.Add("Placeholder", "Enter the No. to search space in GB");
            }
            else if (ddlsearch1.SelectedValue == "Duration")
            {
                txtsearch1.Attributes.Add("Placeholder", "Enter the No. to search duration of Months");
            }
        }

        protected void ddlsearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlsearch.SelectedValue == "Storage Space")
            {
                txtsearch.Attributes.Add("Placeholder", "Enter the No. to search space in GB");
            }
            else if (ddlsearch.SelectedValue == "Duration")
            {
                txtsearch.Attributes.Add("Placeholder", "Enter the No. to search duration of Months");
            }
        }

        protected void lbtnassign_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            GridViewRow row = lbtn.NamingContainer as GridViewRow;

            string srno = row.Cells[0].Text;
            string regno = row.Cells[1].Text;
            string space = row.Cells[2].Text;
            Response.Redirect("AssignSpace.aspx?TrNo=" + srno + "&Space=" + space+"&RegNo="+regno);
        }

        protected void lbtnBack_Click(object sender, EventArgs e)
        {
            divgrid.Visible = true;
            hdrentDiv.Visible = false;
        }

        protected void lbtnrntdetails_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            GridViewRow row = lbtn.NamingContainer as GridViewRow;

            string hdsrno = row.Cells[0].Text;

            string q = "Select r.*, u.[Name] from RentHDDetails r, Users u where u.RegNo = r.RentUser and r.HdSrNo='" + hdsrno + "' order by SrNo";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count > 0)
            {
                GridView4.DataSource = ds;
                GridView4.DataBind();
                GridView4.Visible = true;
                lbnorent.Visible = false;
            }
            else
            {
                GridView4.Visible = false;
                lbnorent.Visible = true;
            }

            divgrid.Visible = false;
            hdrentDiv.Visible = true;
        }
    }
}