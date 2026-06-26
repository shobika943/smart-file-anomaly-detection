using System;
using System.Data.SqlClient;

public partial class VerifyQR : System.Web.UI.Page
{
    protected void btnVerify_Click(object sender, EventArgs e)
    {
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();

        SqlCommand cmd = new SqlCommand(
            "SELECT fileid FROM qr_verification " +
            "WHERE verifycode=@v AND isused=0", con);

        cmd.Parameters.AddWithValue("@v", txtCode.Text.Trim());

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            string fileid = dr["fileid"].ToString();
            dr.Close();

            // Mark as used (ONE TIME)
            SqlCommand upd = new SqlCommand(
                "UPDATE qr_verification SET isused=1 WHERE verifycode=@v", con);
            upd.Parameters.AddWithValue("@v", txtCode.Text.Trim());
            upd.ExecuteNonQuery();

            Response.Redirect("DownloadFile.aspx?fileid=" + fileid);
        }
        else
        {
            lblMsg.Text = "Invalid or already used verification code.";
        }
    }
}
