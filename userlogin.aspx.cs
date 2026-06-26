using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class userlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        SqlCommand cmd = new SqlCommand("select * from userreg where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "' and status='Activated'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["username"] = dr["username"].ToString();
            Session["emailid"] = dr["emailid"].ToString();
            Session["phoneno"] = dr["phoneno"].ToString();
            Response.Redirect("memberhome.aspx");
        }
        else
        {
            Response.Write("<script>alert('Wait for admin activation')</script>");
        }
    }
}