using System;
using System.Data;
using System.Data.SqlClient;

public partial class MyFileDownloadStats : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("userlogin.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadDownloadStats();
        }
    }

    private void LoadDownloadStats()
    {
        Class1 getcon = new Class1();
        using (SqlConnection con = getcon.connect())
        {
            string loggedUser = Session["username"].ToString();

            SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    af.filename,
                    dr.requester,
                    dr.status,
                    ISNULL(COUNT(fa.auditid),0) AS DownloadCount
                FROM download_requests dr
                INNER JOIN addfiles af 
                    ON dr.fileid = af.fileid
                LEFT JOIN FileAuditLog fa 
                    ON fa.filename = af.originalfile
                    AND fa.downloadedby = dr.requester
                    AND fa.accesstype = 'Download'
                WHERE dr.owner = @owner
                GROUP BY 
                    af.filename,
                    dr.requester,
                    dr.status
                ORDER BY af.filename", con);

            cmd.Parameters.AddWithValue("@owner", loggedUser);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            // Create Display Column
            dt.Columns.Add("DisplayCount");

            foreach (DataRow row in dt.Rows)
            {
                string status = row["status"].ToString();
                int count = Convert.ToInt32(row["DownloadCount"]);

                if (status.Equals("Pending", StringComparison.OrdinalIgnoreCase))
                {
                    row["DisplayCount"] = "Pending";
                }
                else
                {
                    row["DisplayCount"] = count.ToString();
                }
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}