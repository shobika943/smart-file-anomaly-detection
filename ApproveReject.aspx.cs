using System;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class ApproveReject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Prevent double execution
        if (IsPostBack) return;

        string action = Request.QueryString["action"];
        string fileid = Request.QueryString["fileid"];

        if (string.IsNullOrEmpty(action) || string.IsNullOrEmpty(fileid))
            return;

        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();

        string status = (action == "approve") ? "Approved" : "Rejected";

        // =========================
        // UPDATE REQUEST STATUS
        // =========================
        SqlCommand upd = new SqlCommand(
            "UPDATE download_requests SET status=@s WHERE fileid=@f", con);
        upd.Parameters.AddWithValue("@s", status);
        upd.Parameters.AddWithValue("@f", fileid);
        upd.ExecuteNonQuery();

        // =========================
        // GET REQUESTER
        // =========================
        SqlCommand getReq = new SqlCommand(
            "SELECT requester FROM download_requests WHERE fileid=@f", con);
        getReq.Parameters.AddWithValue("@f", fileid);
        string requester = Convert.ToString(getReq.ExecuteScalar());

        // =========================
        // GET EMAIL
        // =========================
        SqlCommand getMail = new SqlCommand(
            "SELECT emailid FROM userreg WHERE username=@u", con);
        getMail.Parameters.AddWithValue("@u", requester);
        string userEmail = Convert.ToString(getMail.ExecuteScalar());

        // =========================
        // APPROVED CASE
        // =========================
        if (status == "Approved")
        {
            string verifyCode = new Random().Next(100000, 999999).ToString();

            SqlCommand ins = new SqlCommand(
                "INSERT INTO qr_verification(fileid, requester, verifycode) VALUES(@f,@r,@v)", con);
            ins.Parameters.AddWithValue("@f", fileid);
            ins.Parameters.AddWithValue("@r", requester);
            ins.Parameters.AddWithValue("@v", verifyCode);
            ins.ExecuteNonQuery();

            string qrImage =
                "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=" + verifyCode;

            MailMessage msg = new MailMessage(
                "noreplymailing22@gmail.com", userEmail);
            msg.Subject = "File Download Approved";
            msg.IsBodyHtml = true;
            msg.Body =
                "Your download request has been approved.<br/><br/>" +
                "<b>Scan this QR code to get your verification code:</b><br/><br/>" +
                "<img src='" + qrImage + "' /><br/><br/>" +
                "Enter the code on the VerifyQR page.";

            SendMail(msg);
        }
        else
        {
            // =========================
            // REJECTED CASE
            // =========================
            MailMessage msg = new MailMessage(
                "noreplymailing22@gmail.com", userEmail);
            msg.Subject = "File Download Rejected";
            msg.Body =
                "Your request to download the file has been rejected by the file owner.";

            SendMail(msg);
        }
    }

    private void SendMail(MailMessage msg)
    {
        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.EnableSsl = true;
        smtp.Credentials =
            new System.Net.NetworkCredential(
                "noreplymailing22@gmail.com",
                "ipudbyifzmcsjyhk");

        smtp.Send(msg);
    }
}
