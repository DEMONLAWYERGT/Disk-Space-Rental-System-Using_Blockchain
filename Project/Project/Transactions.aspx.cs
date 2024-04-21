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
    public partial class Transactions : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvBind();
            }
        }

        protected void gvBind()
        {
            string regno = Request.QueryString["RegNo"];
            string q = "Select * from Transactions where RegNo='" + regno + "' order by SrNo";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dt.Columns.Add("isManipulated");
            if (dt.Rows.Count > 0)
            {
                List<SpaceBlock> blocklist = getBlockList(regno);
                for (int z = 0; z < blocklist.Count; z++)
                {
                    
                    SpaceBlock block1 = blocklist[z];
                    DataRow row1 = dt.Rows[z];
                    if (block1.status == "Assigned")
                    {

                        Block block = new Block();
                        block.gethash(new string[] { block1.regno, block1.status, block1.asgndate }, block1.space, block1.duration, block1.cost, block1.cardno, block1.cvv, block1.datetime, block1.prevhash);
                        string block1hash = block.getFinalBlock();

                        if (block1hash == block1.block)
                        {
                            row1["isManipulated"] = "No";
                        }
                        else
                        {
                            row1["isManipulated"] = "Yes";
                        }
                    }
                    else
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        gridDiv.Visible = true;
                        lbnodata.Visible = false;
                    }
                }

                GridView1.DataSource = dt;
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

        public List<SpaceBlock> getBlockList(string id)
        {
            List<SpaceBlock> blocklist = new List<SpaceBlock>();
            DataTable ds = new DataTable();

            string q = "Select * from Transactions where RegNo='" + id + "' order by SrNo";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            ds = new DataTable();
            da.Fill(ds);
            int count = ds.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                SpaceBlock bl = new SpaceBlock();
                bl.regno = ds.Rows[i]["RegNo"].ToString();
                bl.space = ds.Rows[i]["Space"].ToString();
                bl.duration = ds.Rows[i]["Duration"].ToString();
                bl.cost = ds.Rows[i]["Cost"].ToString();
                bl.cardno = ds.Rows[i]["CardNo"].ToString();
                bl.cvv = ds.Rows[i]["CVV"].ToString();               
                bl.status = ds.Rows[i]["Status"].ToString();               
                bl.asgndate = ds.Rows[i]["AssignDate"].ToString();               
                bl.datetime = ds.Rows[i]["Datetime"].ToString();
                bl.prevhash = ds.Rows[i]["PreviousHash"].ToString();
                bl.block = ds.Rows[i]["CurrentHash"].ToString();
                blocklist.Add(bl);
            }

            return blocklist;
        }


        protected void ddlsearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlsearch.SelectedValue == "Date")
            {
                txtsearch.TextMode = TextBoxMode.Date;
            }
            else
            {
                txtsearch.TextMode = TextBoxMode.SingleLine;
                txtsearch.Text = "";
            }
        }

        protected void lbtnsearch_Click(object sender, EventArgs e)
        {
            if (txtsearch.Text == "")
            {

            }
            else if (ddlsearch.SelectedValue == "Space")
            {
                string regno = Request.QueryString["RegNo"];
                string q = "Select * from Transactions where RegNo='" + regno + "' and Space='" + txtsearch.Text + "' order by SrNo";
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    dt.Columns.Add("isManipulated");
                    List<SpaceBlock> blocklist = getSearchBlockList(regno, txtsearch.Text);
                    for (int z = 0; z < blocklist.Count; z++)
                    {
                        SpaceBlock block1 = blocklist[z];
                        DataRow row1 = dt.Rows[z];

                        Block block = new Block();
                        block.gethash(new string[] { block1.regno, block1.status, block1.asgndate }, block1.space, block1.duration, block1.cost, block1.cardno, block1.cvv, block1.datetime, block1.prevhash);
                        string block1hash = block.getFinalBlock();

                        if (block1hash == block1.block)
                        {
                            row1["isManipulated"] = "No";
                        }
                        else
                        {
                            row1["isManipulated"] = "Yes";
                        }
                    }

                    GridView1.DataSource = dt;
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
            else if (ddlsearch.SelectedValue == "Date")
            {
                string regno = Request.QueryString["RegNo"];
                string q = "Select * from Transactions where RegNo='" + regno + "' and Datetime='" + txtsearch.Text + "' order by SrNo";
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    dt.Columns.Add("isManipulated");
                    List<SpaceBlock> blocklist = getSearchBlockList(regno, txtsearch.Text);
                    for (int z = 0; z < blocklist.Count; z++)
                    {
                        SpaceBlock block1 = blocklist[z];
                        DataRow row1 = dt.Rows[z];

                        Block block = new Block();
                        block.gethash(new string[] { block1.regno, block1.status, block1.asgndate }, block1.space, block1.duration, block1.cost, block1.cardno, block1.cvv, block1.datetime, block1.prevhash);
                        string block1hash = block.getFinalBlock();

                        if (block1hash == block1.block)
                        {
                            row1["isManipulated"] = "No";
                        }
                        else
                        {
                            row1["isManipulated"] = "Yes";
                        }
                    }

                    GridView1.DataSource = dt;
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

        public List<SpaceBlock> getSearchBlockList(string id,string search)
        {
            List<SpaceBlock> blocklist = new List<SpaceBlock>();
            DataTable ds = new DataTable();
            string q = "";
            if (txtsearch.TextMode == TextBoxMode.Date)
            {
                q = "Select * from Transactions where RegNo='" + id + "' and  Datetime like '%" + search + "%' order by SrNo";
            }
            else
            {
                q = "Select * from Transactions where RegNo='" + id + "' and Space = '" + search + "' order by SrNo";
            }
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            ds = new DataTable();
            da.Fill(ds);
            int count = ds.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                SpaceBlock bl = new SpaceBlock();
                bl.regno = ds.Rows[i]["RegNo"].ToString();
                bl.hsrno = ds.Rows[i]["HSrNo"].ToString();
                bl.space = ds.Rows[i]["Space"].ToString();
                bl.duration = ds.Rows[i]["Duration"].ToString();
                bl.cost = ds.Rows[i]["Cost"].ToString();
                bl.cardno = ds.Rows[i]["CardNo"].ToString();
                bl.cvv = ds.Rows[i]["CVV"].ToString();
                bl.status = ds.Rows[i]["Status"].ToString();
                bl.asgndate = ds.Rows[i]["AssignDate"].ToString();
                bl.datetime = ds.Rows[i]["Datetime"].ToString();
                bl.prevhash = ds.Rows[i]["PreviousHash"].ToString();
                bl.block = ds.Rows[i]["CurrentHash"].ToString();
                blocklist.Add(bl);
            }

            return blocklist;
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