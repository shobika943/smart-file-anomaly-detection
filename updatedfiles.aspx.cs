using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Data;
using System.IO;

public partial class updatedfiles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bin();
         if (Request.QueryString["fileid"] != null)
        {
            Class1 getcon2 = new Class1();
            SqlConnection con2 = getcon2.connect();
            SqlCommand cmd2 = new SqlCommand("select * from updatefiles where fileid='" + Request.QueryString["fileid"].ToString() + "'", con2);
            SqlDataReader dr2 = cmd2.ExecuteReader();
            if (dr2.Read())
            {
                string appPath = Request.PhysicalApplicationPath.ToString();
                Session["uploadfile"] = dr2["filename"].ToString();

                String a = appPath + "\\adminfiles\\" + Session["uploadfile"].ToString();
                Context.Response.Clear();
                FileInfo file = new FileInfo(a);
                Context.Response.ContentType = "application/octet-stream";
                Context.Response.AppendHeader("Content-Disposition", "inline; filename=" + a);
                Context.Response.AppendHeader("Content-Length", file.Length.ToString());
                Context.Response.WriteFile(file.FullName);
                Context.Response.End();
            }
         }
    }

    public void bin()
    {
        Class1 getcon = new Class1();
        SqlConnection con1 = getcon.connect();
        SqlCommand cmd2 = new SqlCommand("select * from updatefiles", con1);
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
}