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
    public partial class RentSpace : System.Web.UI.Page
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
            string regno = Request.QueryString["RegNo"];
            string q = "Select * from HardDisks where RegNo = '" + regno + "' order by SrNo";
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


        protected void lbtnnew_Click(object sender, EventArgs e)
        {
            txthd.Text = "";
            txtstorage.Text = "";
            txtduration.Text = "";
           
            btnadd.Visible = true;
            btnupdate.Visible = false;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup", "$('#manageModal').modal({backdrop: 'static', keyboard: false},'show')", true);

        }

        protected void lbtnedit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            GridViewRow row = lbtn.NamingContainer as GridViewRow;

            lbsr.Text = row.Cells[0].Text;
            txthd.Text = row.Cells[2].Text;
            txtstorage.Text = row.Cells[3].Text;
            txtduration.Text = row.Cells[4].Text;

            btnadd.Visible = false;
            btnupdate.Visible = true;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup", "$('#manageModal').modal({backdrop: 'static', keyboard: false},'show')", true);

        }

        protected void lbtnview_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            GridViewRow row = lbtn.NamingContainer as GridViewRow;

            lbsr.Text = row.Cells[0].Text;
            txthd.Text = row.Cells[2].Text;
            txtstorage.Text = row.Cells[3].Text;
            txtduration.Text = row.Cells[4].Text;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup", "$('#manageModal').modal({backdrop: 'static', keyboard: false},'show')", true);

        }

        protected void lbtndelete_Command(object sender, CommandEventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            GridViewRow row = lbtn.NamingContainer as GridViewRow;
            string srno = row.Cells[0].Text;

            string argument = e.CommandArgument.ToString();
            if (argument.Equals("delete"))
            {
                con.Open();
                string que = "Delete from HardDisks where SrNo='" + srno + "' ";
                SqlCommand cmd = new SqlCommand(que, con);
                cmd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('Hard Drive details are deleted successfully!!!')", true);
                GvBind();
            }

        }

        protected void lbtnsearch_Click(object sender, EventArgs e)
        {
            if (txtsearch.Text == "")
            {
                GvBind();
            }
            else
            {
                string q = "Select * from HardDisks where HardDisk='" + txtsearch.Text + "' or Storage='" + txtsearch.Text + "' or Duration='" + txtsearch.Text + "'";
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

        protected void btnadd_Click(object sender, EventArgs e)
        {
            string regno = Request.QueryString["RegNo"];
            string date = DateTime.Now.ToString("yyyy/MM/dd");
            con.Open();
            string q = "Insert into HardDisks(RegNo,HardDisk,Storage,Duration,Date,Status,RentSpace) Values('" + regno + "','" + txthd.Text + "','" + txtstorage.Text + "','" + txtduration.Text + "','" + date + "','Pending','0')";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('Hard drive details added for rent successfully!!!')", true);
            GvBind();

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "Update HardDisks set HardDisk='" + txthd.Text + "',Storage='" + txtstorage.Text + "',Duration='" + txtduration.Text + "' where SrNo='" + lbsr.Text + "' ";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Page.ClientScript.RegisterStartupScript(GetType(), "msg", "alert('Hard drive details updated successfully!!!')", true);
            GvBind();
        }


    }
}