using System;
using System.Data;
using System.Data.SqlClient;

public partial class suspicioususers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSuspiciousUsers();
        }
    }

    private void LoadSuspiciousUsers()
    {
        try
        {
            Class1 c = new Class1();
            SqlConnection con = c.connect();

            SqlCommand cmd = new SqlCommand(
               "SELECT UserName, IPAddress, AttemptTime, Reason FROM SuspiciousUsers ORDER BY AttemptTime DESC"

               ,con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            con.Close();
        }
        catch
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "err",
                "<script>alert('Unable to load suspicious user data');</script>");
        }
    }

    protected void GridView1_PageIndexChanging(object sender,
        System.Web.UI.WebControls.GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadSuspiciousUsers();
    }
}
