using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Project
{
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bindchart();
                gvBind();
            }
        }

        private void gvBind()
        {
            string regno = Request.QueryString["RegNo"];
            string q = "Select * from HardDisks where RegNo='" + regno + "' order by SrNo";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dt.Columns.Add("Total Space");
            int c = dt.Rows.Count;
            if (c > 0)
            {
                for(int i = 0; i < c; i++)
                {
                    string storage = dt.Rows[i]["Storage"].ToString();
                    string rntspc = dt.Rows[i]["RentSpace"].ToString();
                    int totalspace = Convert.ToInt32(storage) + Convert.ToInt32(rntspc);
                    var dr = dt.Rows[i];
                    dr["Total Space"] = totalspace.ToString();
                   
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Visible = true;
                lbnodata.Visible = false;
            }
            else
            {
                GridView1.Visible = false;
                lbnodata.Visible = true;
            }
        }


        private void Bindchart()
        {
            int space = 0,rspace=0;
            string regno = Request.QueryString["RegNo"];
            string q = "Select Storage , RentSpace from HardDisks where RegNo='" + regno + "' order by SrNo";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int c = dt.Rows.Count;
            if (c > 0)
            {
                DataTable ChartData = new DataTable();
                ChartData.Columns.Add("Storage");
                ChartData.Columns.Add("Space");
                for(int i = 0; i < c; i++)
                {
                    string ssp = dt.Rows[i]["Storage"].ToString();
                    space += Convert.ToInt32(ssp);

                    string rsp = dt.Rows[i]["RentSpace"].ToString();
                    rspace += Convert.ToInt32(rsp);
                }

                var dr = ChartData.NewRow();
                dr["Storage"] = "Unused Space";
                dr["Space"] = space;
                ChartData.Rows.Add(dr);

                var dr1 = ChartData.NewRow();
                dr1["Storage"] = "Rent Space";
                dr1["Space"] = rspace;
                ChartData.Rows.Add(dr1);

                //storing total rows count to loop on each Record  
                string[] XPointMember = new string[ChartData.Rows.Count];
                int[] YPointMember = new int[ChartData.Rows.Count];

                for (int count = 0; count < ChartData.Rows.Count; count++)
                {
                    //storing Values for X axis  
                    XPointMember[count] = ChartData.Rows[count]["Storage"].ToString();
                    //storing values for Y Axis  
                    YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Space"]);

                }
                //binding chart control  
                Chart1.Series[0].Points.DataBindXY(XPointMember, YPointMember);

                //Setting width of line  
                Chart1.Series[0].BorderWidth = 10;
                //setting Chart type   
                Chart1.Series[0].ChartType = SeriesChartType.Pie;


                foreach (Series charts in Chart1.Series)
                {
                    foreach (DataPoint point in charts.Points)
                    {
                        switch (point.AxisLabel)
                        {
                            case "Unused Space": point.Color = Color.RoyalBlue; break;
                            case "Rent Space": point.Color = Color.SaddleBrown; break;

                        }
                        point.Label = string.Format("{0:0} - {1}", point.YValues[0], point.AxisLabel);
                      
                    }
                }
                //Enabled 3D  
                 Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;  
               
            }

        }
    }
}