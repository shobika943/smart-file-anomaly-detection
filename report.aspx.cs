using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();   // File report only
            del();    // Delete logic
        }
    }

    // ============================
    // FILE REPORT (EXISTING FILES)
    // ============================
    public void bind()
    {
        Class1 getcon = new Class1();
        SqlConnection con1 = getcon.connect();

        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT * FROM addfiles WHERE dummyfile IS NOT NULL", con1);

        DataSet ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bind();
    }

    // ============================
    // DELETE FILE
    // ============================
    public void del()
    {
        if (Request.QueryString["fileid1"] != null)
        {
            Class1 getcon2 = new Class1();
            SqlConnection con2 = getcon2.connect();

            SqlCommand cmd2 = new SqlCommand(
                "DELETE FROM addfiles WHERE fileid=@id", con2);

            cmd2.Parameters.AddWithValue("@id", Request.QueryString["fileid1"]);
            cmd2.ExecuteNonQuery();

            Response.Write("<script>alert('Record Deleted Successfully!')</script>");
            bind();
        }
    }
}
