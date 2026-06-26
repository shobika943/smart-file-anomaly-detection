using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;
using System.IO;
using System.Data.SqlClient;

public partial class adminviewfiles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bin();

        if (!IsPostBack)
        {

            del();
        }
        if (Request.QueryString["fileid"] != null)
        {
            Class1 getcon2 = new Class1();
            SqlConnection con2 = getcon2.connect();
            SqlCommand cmd2 = new SqlCommand("select * from addfiles where fileid='" + Request.QueryString["fileid"].ToString() + "'", con2);
            SqlDataReader dr2 = cmd2.ExecuteReader();
            if (dr2.Read())
            {
                Class1 con1 = new Class1();
                SqlConnection con = con1.connect();
                SqlCommand cmd = new SqlCommand("update addfiles set status='Approve' where fileid='" + Request.QueryString["fileid"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Status Updated')</script>");
                bin();
               
            
            }
        }
    }

    public void bin()
    {
        Class1 getcon = new Class1();
        SqlConnection con1 = getcon.connect();
        SqlCommand cmd2 = new SqlCommand("select * from addfiles", con1);
        SqlDataAdapter da = new SqlDataAdapter(cmd2);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bin();
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
    }


    protected void Button1_Click(object sender, EventArgs e)
    {


    }


    public void del()
    {
        if (Request.QueryString["fileid1"] != null)
        {
            Class1 getcon2 = new Class1();
            SqlConnection con2 = getcon2.connect();
            SqlCommand cmd2 = new SqlCommand("delete  from addfiles where fileid='" + Request.QueryString["fileid1"].ToString() + "'", con2);
            cmd2.ExecuteNonQuery();
            Response.Write("<script>alert('Records Deleted Successfully!')</script>");
        }


    }
}