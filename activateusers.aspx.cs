using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using System.Net.Mime;
using System.Net.Mail;
public partial class activateusers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            activate();
            deactivate();
        }
        bin();
    }


    public void bin()
    {
      
        Class1 getcon = new Class1();
        SqlConnection con1 = getcon.connect();
        SqlCommand cmd2 = new SqlCommand("select * from userreg", con1);
        SqlDataAdapter da = new SqlDataAdapter(cmd2);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            //DetailsView1.DataSource = ds;
            //DetailsView1.DataBind();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bin();
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
    }


    public void activate()
    {
        if (Request.QueryString["id"] == null)
            return;

        Class1 getcon1 = new Class1();
        SqlConnection con1 = getcon1.connect();

        SqlCommand cmd1 = new SqlCommand(
            "SELECT username, emailid, phoneno FROM userreg WHERE userid=@uid", con1);
        cmd1.Parameters.AddWithValue("@uid", Request.QueryString["id"].ToString());

        SqlDataReader dr1 = cmd1.ExecuteReader();

        if (dr1.Read())
        {
            string username = dr1["username"].ToString();
            string email = dr1["emailid"].ToString();
            dr1.Close();

            SqlCommand cmd = new SqlCommand(
                "UPDATE userreg SET status='Activated' WHERE userid=@uid", con1);
            cmd.Parameters.AddWithValue("@uid", Request.QueryString["id"].ToString());
            cmd.ExecuteNonQuery();

            // 📧 SEND PROFESSIONAL ACTIVATION MAIL
            MailMessage msg = new MailMessage(
                "noreplymailing22@gmail.com",
                email);

            msg.Subject = "Account Activation Confirmation";
            msg.IsBodyHtml = true;
            msg.Body =
                "<p>Dear <b>" + username + "</b>,</p>" +
                "<p>Your account has been <b>successfully activated</b>.</p>" +
                "<p>You can now log in and access the system features.</p>" +
                "<br/>" +
                "<p>Regards,<br/>" +
                "<b>System Administrator</b><br/>" +
                "Secure File Access System</p>";

            SmtpClient smclient = new SmtpClient("smtp.gmail.com", 587);
            smclient.EnableSsl = true;
            smclient.UseDefaultCredentials = false;
            smclient.Credentials = new NetworkCredential(
                "noreplymailing22@gmail.com",
                "ipudbyifzmcsjyhk");

            smclient.Send(msg);

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "act",
                "<script>alert('User activated and mail sent successfully');</script>");
        }

        con1.Close();
    }

    public void deactivate()
    {
        if (Request.QueryString["id1"] == null)
            return;

        Class1 getcon1 = new Class1();
        SqlConnection con1 = getcon1.connect();

        SqlCommand cmd1 = new SqlCommand(
            "SELECT username, emailid FROM userreg WHERE userid=@uid", con1);
        cmd1.Parameters.AddWithValue("@uid", Request.QueryString["id1"].ToString());

        SqlDataReader dr1 = cmd1.ExecuteReader();

        if (dr1.Read())
        {
            string username = dr1["username"].ToString();
            string email = dr1["emailid"].ToString();
            dr1.Close();

            SqlCommand cmd = new SqlCommand(
                "UPDATE userreg SET status='De Activated' WHERE userid=@uid", con1);
            cmd.Parameters.AddWithValue("@uid", Request.QueryString["id1"].ToString());
            cmd.ExecuteNonQuery();

            // 📧 SEND PROFESSIONAL DEACTIVATION MAIL
            MailMessage msg = new MailMessage(
                "noreplymailing22@gmail.com",
                email);

            msg.Subject = "Account Deactivation Notice";
            msg.IsBodyHtml = true;
            msg.Body =
                "<p>Dear <b>" + username + "</b>,</p>" +
                "<p>Your account has been <b>deactivated</b> by the administrator.</p>" +
                "<p>Please contact support if you require further assistance.</p>" +
                "<br/>" +
                "<p>Regards,<br/>" +
                "<b>System Administrator</b><br/>" +
                "Secure File Access System</p>";

            SmtpClient smclient = new SmtpClient("smtp.gmail.com", 587);
            smclient.EnableSsl = true;
            smclient.UseDefaultCredentials = false;
            smclient.Credentials = new NetworkCredential(
                "noreplymailing22@gmail.com",
                "ipudbyifzmcsjyhk");

            smclient.Send(msg);

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "deact",
                "<script>alert('User deactivated and mail sent successfully');</script>");
        }

        con1.Close();
    }

  
}