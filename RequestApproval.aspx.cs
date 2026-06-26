using System;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class RequestApproval : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["fileid"] == null)
            {
                lblMsg.Text = "Invalid file request.";
                btnRequest.Enabled = false;
                return;
            }

            lblInfo.Text = "File ID: " + Request.QueryString["fileid"];
        }
    }

    protected void btnRequest_Click(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("userlogin.aspx");
            return;
        }

        string fileid = Request.QueryString["fileid"];
        string requester = Session["username"].ToString();

        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();

        // Get file owner username
        SqlCommand getOwner = new SqlCommand(
            "SELECT uploadedby FROM addfiles WHERE fileid=@f", con);
        getOwner.Parameters.AddWithValue("@f", fileid);

        string owner = getOwner.ExecuteScalar().ToString();

        // Insert request
        SqlCommand ins = new SqlCommand(
            "INSERT INTO download_requests(fileid, requester, owner, status) " +
            "VALUES(@f,@r,@o,'Pending')", con);

        ins.Parameters.AddWithValue("@f", fileid);
        ins.Parameters.AddWithValue("@r", requester);
        ins.Parameters.AddWithValue("@o", owner);
        ins.ExecuteNonQuery();

        // Get owner email
        SqlCommand getMail = new SqlCommand(
            "SELECT emailid FROM userreg WHERE username=@u", con);
        getMail.Parameters.AddWithValue("@u", owner);

        string ownerEmail = getMail.ExecuteScalar().ToString();

        // Email links (PORT UPDATED ONLY)
        string approveLink =
            "http://localhost:51431/smartfile/ApproveReject.aspx?action=approve&fileid=" + fileid;

        string rejectLink =
            "http://localhost:51431/smartfile/ApproveReject.aspx?action=reject&fileid=" + fileid;

        MailMessage msg = new MailMessage(
            "noreplymailing22@gmail.com",
            ownerEmail);

        msg.Subject = "File Download Approval Request";
        msg.IsBodyHtml = true;
        msg.Body =
            "User <b>" + requester + "</b> requested your file.<br/><br/>" +
            "<a href='" + approveLink + "'>APPROVE</a><br/><br/>" +
            "<a href='" + rejectLink + "'>REJECT</a>";

        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.EnableSsl = true;
        smtp.Credentials =
            new System.Net.NetworkCredential(
                "noreplymailing22@gmail.com",
                "ipudbyifzmcsjyhk");

        smtp.Send(msg);

        lblMsg.Text = "Approval request sent to file owner.";
        lnkVerify.Visible = true;
        btnRequest.Enabled = false;
    }
}