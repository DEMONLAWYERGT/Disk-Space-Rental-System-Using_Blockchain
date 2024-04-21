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
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Login"] = "User";
            if (!IsPostBack)
            {
                setData();
            }
        }

        protected void setData()
        {
            string regno = Request.QueryString["RegNo"];
            string q = "Select * from Users where RegNo='" + regno + "'";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lbregno.Text = ds.Tables[0].Rows[0]["RegNo"].ToString();
                txtname.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtmobno.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
                string image = ds.Tables[0].Rows[0]["PrfImage"].ToString();
                if (image == "")
                {
                    
                }
                else
                {
                    imgPhoto.ImageUrl = ds.Tables[0].Rows[0]["PrfImage"].ToString();
                }
                

                txtname.ReadOnly = true;
                txtmobno.ReadOnly = true;
                txtemail.ReadOnly = true;

                lbtnedit.Visible = true;
                btnupdate.Visible = false;
            }
        }

        protected void lbtnedit_Click(object sender, EventArgs e)
        {
            txtname.ReadOnly = false;
            txtmobno.ReadOnly = false;
            txtemail.ReadOnly = false;

            lbtnedit.Visible = false;
            btnupdate.Visible = true;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "Update Users set Name='" + txtname.Text + "',MobileNo='" + txtmobno.Text + "',EmailId='" + txtemail.Text + "' where RegNo='" + lbregno.Text + "'";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Details Updated Successfully !!!');", true);
            setData();
        }

        protected void lbtnupload_Click(object sender, EventArgs e)
        {
            try
            {
                string file = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                //Save images into Images folder
                FileUpload1.SaveAs(Server.MapPath("~\\ProfilePhoto\\" + file));
                string path = Server.MapPath("~\\ProfilePhoto\\" + file);
                FileUpload1.SaveAs(path + file);

                imgPhoto.ImageUrl = "ProfilePhoto\\" + file;

                con.Open();
                string q = "Update Users set PrfImage='" + imgPhoto.ImageUrl + "' where RegNo='" + lbregno.Text + "'";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Profile Image Set Successfully !!!');", true);

            }
            catch (Exception ep)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Select Profile Photo !!!');", true);
            }


        }
    }
}