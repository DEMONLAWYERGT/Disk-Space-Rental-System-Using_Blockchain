using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Security.Cryptography;

namespace Project
{
    public partial class AssignSpace : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);
        int space = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbreqspace.Text = Request.QueryString["Space"];
            if (!IsPostBack)
            {
                gvBind();
            }
            
        }

        protected void gvBind()
        {
            string q = "Select * from HardDisks where Status = 'Accepted' order by SrNo";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                
            }
           
        }

        protected void btngetspace_Click(object sender, EventArgs e)
        {            
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
               
                var checkbox = gvrow.FindControl("chkbSelect") as CheckBox;
                if (checkbox.Checked)
                {
                    hdfspace.Value = (Convert.ToInt32(hdfspace.Value) + Convert.ToInt32(txtspace.Text)).ToString();
                    space = Convert.ToInt32(hdfspace.Value);
                    if (space == Convert.ToInt32(lbreqspace.Text))
                    {
                        btnassign.Visible = true;
                    }
                    else
                    {
                        btnassign.Visible = false;
                    }
                    lbgetspace.Text += gvrow.Cells[0].Text + "-" + txtspace.Text + ",";
                    lbasgnsp.Text = hdfspace.Value;
                    txtspace.Text = "";
                }
            }

        }

        protected void btnassign_Click(object sender, EventArgs e)
        {
            string date = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            date = date.Replace('-', '/');
            string endDate = DateTime.Now.AddMonths(2).ToString("yyyy/MM/dd HH:mm:ss");
            endDate = endDate.Replace('-', '/');

            string prevHash = "", currhash = "", rentspc = "0", str = "";

            string regno = "", rntdur = "";
            string trno = Request.QueryString["TrNo"];

            string sel = "Select Duration, RegNo from Transactions where SrNo = '" + trno + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sel, con);
            DataTable dst = new DataTable();
            sda.Fill(dst);
            if(dst.Rows.Count > 0)
            {                
                rntdur = dst.Rows[0][0].ToString();
                regno = dst.Rows[0][1].ToString();
            }

            string[] sp = lbgetspace.Text.Split(',');
            sp = sp.Where(x => !string.IsNullOrEmpty(x)).ToArray();
            foreach (var values in sp)
            {
                string[] v1 = values.Split('-');
                v1 = v1.Where(x => !string.IsNullOrEmpty(x)).ToArray();

                string query = "Select Storage,RentSpace from hardDisks where SrNo='" + v1[0] + "'";
                SqlDataAdapter daa = new SqlDataAdapter(query, con);
                DataSet dss = new DataSet();
                daa.Fill(dss);
                if(dss.Tables[0].Rows.Count > 0)
                {
                    str = dss.Tables[0].Rows[0][0].ToString();
                    rentspc = dss.Tables[0].Rows[0][1].ToString();
                    int availspc = Convert.ToInt32(str);
                    if (Convert.ToInt32(availspc) > Convert.ToInt32(v1[1]))
                    {
                        int rspace = Convert.ToInt32(rentspc) + Convert.ToInt32(v1[1]);
                        availspc = Convert.ToInt32(str) - Convert.ToInt32(v1[1]);

                        con.Open();
                        string que = "Update HardDisks set RentSpace='" + rspace.ToString() + "', Storage='" + availspc.ToString() + "' where SrNo = '" + v1[0] + "'";
                        SqlCommand cmd1 = new SqlCommand(que, con);
                        cmd1.ExecuteNonQuery();


                        que = "Insert into RentHDDetails(HdsrNo,RentSpace,RentDuration,RentUser,StartDate,EndDate) values('" + v1[0] + "','" + v1[1] + "','" + rntdur + "','" + regno + "','" + date + "','" + endDate + "')";
                        cmd1 = new SqlCommand(que, con);
                        cmd1.ExecuteNonQuery();

                        con.Close();


                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('This much space is not avaialable!!!')", true);
                    }                    
                }
            }
            string q = "Select * from Transactions where RegNo='" + regno + "' and Status='Assigned' Order by SrNo Desc";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                prevHash = ds.Tables[0].Rows[0]["CurrentHash"].ToString();
            }
            else
            {
                prevHash = "Genesis";
            }

            q = "Select * from Transactions where RegNo='" + regno + "' and SrNo='" + trno + "' Order by SrNo Desc";
            da = new SqlDataAdapter(q, con);
            ds = new DataSet();
            da.Fill(ds);

            SpaceBlock bl = new SpaceBlock();
            bl.regno = ds.Tables[0].Rows[0]["RegNo"].ToString();            
            bl.space = ds.Tables[0].Rows[0]["Space"].ToString();
            bl.duration = ds.Tables[0].Rows[0]["Duration"].ToString();
            bl.cost = ds.Tables[0].Rows[0]["Cost"].ToString();
            bl.cardno = ds.Tables[0].Rows[0]["CardNo"].ToString();
            bl.cvv = ds.Tables[0].Rows[0]["CVV"].ToString();
            bl.status = "Assigned";
            bl.asgndate = date;
            bl.datetime = ds.Tables[0].Rows[0]["Datetime"].ToString();
            bl.prevhash = prevHash;

            Block block = new Block();
            block.gethash(new string[] { bl.regno, bl.status, bl.asgndate }, bl.space, bl.duration, bl.cost, bl.cardno, bl.cvv, bl.datetime, bl.prevhash);
            currhash = block.getFinalBlock();
            bl.block = currhash;


            con.Open();
            string qu = "Update Transactions set PreviousHash='" + prevHash + "',CurrentHash='" + currhash + "',Status = 'Assigned', AssignDate = '" + date + "' where SrNo = '" + trno + "'";
            SqlCommand cmd = new SqlCommand(qu, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Space Assign succesfully!!!')", true);


        }


        public class Block
        {
            byte[] Entities;
            byte[] prevhash;
            byte[] Datetime;
            byte[] Space;
            byte[] Duration;
            byte[] Cost;
            byte[] cardNo;
            byte[] CVV;
            byte[] Finalhashblock = null;

            public byte[] gethash(string[] entities, string spc, string dur, string cst, string cno, string cvv, string datetime, string prevhashblock)
            {
                string finaldata = "";
                foreach (string s in entities)
                {
                    finaldata += s;
                }

                Entities = Encoding.Default.GetBytes(finaldata);
                Space = Encoding.Default.GetBytes(spc);
                Duration = Encoding.Default.GetBytes(dur);
                Cost = Encoding.Default.GetBytes(cst);
                cardNo = Encoding.Default.GetBytes(cno);
                CVV = Encoding.Default.GetBytes(cvv);
                prevhash = Encoding.Default.GetBytes(prevhashblock);
                Datetime = Encoding.Default.GetBytes(datetime);


                using (SHA512 sha = new SHA512Managed())
                using (MemoryStream st = new MemoryStream())
                using (BinaryWriter bw = new BinaryWriter(st))
                {
                    bw.Write(Entities);
                    bw.Write(prevhash);
                    bw.Write(Datetime);
                    bw.Write(Space);
                    bw.Write(Duration);
                    bw.Write(Cost);
                    bw.Write(cardNo);
                    bw.Write(CVV);
                    var finalblock = st.ToArray();
                    Finalhashblock = sha.ComputeHash(finalblock);
                    return Finalhashblock;
                }
            }

            public string getFinalBlock()
            {
                if (Finalhashblock != null)
                {
                    return BitConverter.ToString(Finalhashblock).Replace("-", "");
                }
                else
                {
                    return "Not Defined";
                }
            }
        }



    }
}