using System;
using System.Web.UI;

public partial class CaptchaVerify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["CaptchaAttempts"] = 0;
        }
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        imgCaptcha.ImageUrl = "CaptchaImage.aspx?" + DateTime.Now.Ticks;
    }

    protected void btnVerify_Click(object sender, EventArgs e)
    {
        if (Session["captcha"] == null)
        {
            lblMsg.Text = "Captcha expired. Please refresh.";
            return;
        }

        int attempts = Convert.ToInt32(Session["CaptchaAttempts"]);

        if (attempts >= 2)
        {
            lblMsg.Text = "Access denied. Too many wrong attempts.";
            btnVerify.Enabled = false;
            return;
        }

        if (txtCaptcha.Text.Trim() == Session["captcha"].ToString())
        {
            // ✅ Captcha success
            Session.Remove("CaptchaAttempts");

            // ✅ REDIRECT TO REQUEST APPROVAL (NOT DOWNLOAD)
            Response.Redirect(
                "RequestApproval.aspx?fileid=" +
                Request.QueryString["fileid"],
                false
            );
        }
        else
        {
            attempts++;
            Session["CaptchaAttempts"] = attempts;

            lblMsg.Text = "Invalid captcha. Attempts left: " + (2 - attempts);
            imgCaptcha.ImageUrl = "CaptchaImage.aspx?" + DateTime.Now.Ticks;
        }
    }
}
