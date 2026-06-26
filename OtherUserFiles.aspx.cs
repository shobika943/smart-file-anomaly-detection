using System;
using System.Data;
using System.Data.SqlClient;

namespace DCOICLOUD
{
    public partial class OtherUserFiles : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            "Data Source=.;Initial Catalog=DCOICLOUD;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOtherFiles();
            }
        }

        void LoadOtherFiles()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT fileid, filename, uploadedby FROM addfiles WHERE status='Active'",
                con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}
