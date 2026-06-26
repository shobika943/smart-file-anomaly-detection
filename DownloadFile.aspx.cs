using System;
using System.Data.SqlClient;
using System.IO;

public partial class DownloadFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 1️⃣ User session check
        if (Session["username"] == null)
        {
            Response.Redirect("userlogin.aspx");
            return;
        }

        // 2️⃣ File id check
        if (Request.QueryString["fileid"] == null)
            return;

        string fileId = Request.QueryString["fileid"].ToString();
        string loggedUser = Session["username"].ToString();

        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();

        // 3️⃣ Get file name + owner
        SqlCommand cmd = new SqlCommand(
            "SELECT originalfile, uploadedby FROM addfiles WHERE fileid=@id", con);
        cmd.Parameters.AddWithValue("@id", fileId);

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            string fileName = dr["originalfile"].ToString();
            string fileOwner = dr["uploadedby"].ToString();

            dr.Close();

            // 4️⃣ File physical path
            string filePath = Server.MapPath("~/userfiles/" + fileName);

            if (File.Exists(filePath))
            {
                // 5️⃣ INSERT AUDIT LOG
                SqlCommand logCmd = new SqlCommand(
                    "INSERT INTO FileAuditLog (downloadedby, fileowner, filename, accesstype) " +
                    "VALUES (@downby, @owner, @fname, @access)", con);

                logCmd.Parameters.AddWithValue("@downby", loggedUser);
                logCmd.Parameters.AddWithValue("@owner", fileOwner);
                logCmd.Parameters.AddWithValue("@fname", fileName);
                logCmd.Parameters.AddWithValue("@access", "Download");

                logCmd.ExecuteNonQuery();

                // 6️⃣ Download file
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition",
                    "attachment; filename=" + fileName);
                Response.WriteFile(filePath);
                Response.End();
            }
            else
            {
                Response.Write("File not found on server");
            }
        }
        else
        {
            Response.Write("Invalid File Request");
        }
    }
}
