using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class downloadlogs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindAudit();
        }
    }

    // ============================
    // FILE DOWNLOAD AUDIT LOG
    // ============================
    void bindAudit()
    {
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();

        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT * FROM FileAuditLog ORDER BY downloaddate DESC", con);

        DataSet ds = new DataSet();
        da.Fill(ds);

        GridView2.DataSource = ds;
        GridView2.DataBind();
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        bindAudit();
    }
}
