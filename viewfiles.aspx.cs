using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewfiles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // SESSION CHECK
        if (Session["username"] == null)
        {
            Response.Redirect("userlogin.aspx");
            return;
        }

        if (!IsPostBack)
        {
            bin();                 // MY FILES (OTP)
            bindOtherUsersFiles(); // OTHER USERS (CAPTCHA)
            activate();            // OTP ACTIVATION (UNCHANGED)
        }
    }

    // =========================
    // MY FILES (OTP PROTECTED)
    // =========================
    public void bin()
    {
        Class1 getcon = new Class1();
        SqlConnection con1 = getcon.connect();

        string username = Session["username"].ToString();

        SqlCommand cmd2 = new SqlCommand(
            "SELECT * FROM addfiles WHERE uploadedby=@user", con1);
        cmd2.Parameters.AddWithValue("@user", username);

        SqlDataAdapter da = new SqlDataAdapter(cmd2);
        DataSet ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bin();
    }

    // =========================
    // OTHER USERS FILES (CAPTCHA)
    // =========================
    public void bindOtherUsersFiles()
    {
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();

        string username = Session["username"].ToString();

        SqlCommand cmd = new SqlCommand(
            "SELECT fileid, filename, uploadedby FROM addfiles WHERE uploadedby <> @user AND status='Approve'",
            con);

        cmd.Parameters.AddWithValue("@user", username);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        GridView2.DataSource = ds;
        GridView2.DataBind();
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        bindOtherUsersFiles();
    }

    // =========================
    // OTP ACTIVATION (DO NOT TOUCH)
    // =========================
    public void activate()
    {
        if (Request.QueryString["fileid"] != null)
        {
            Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();

            SqlCommand cmd1 = new SqlCommand(
                "SELECT * FROM addfiles WHERE fileid=@fileid", con1);
            cmd1.Parameters.AddWithValue("@fileid", Request.QueryString["fileid"].ToString());

            SqlDataReader dr1 = cmd1.ExecuteReader();

            if (dr1.Read())
            {
                Session["filename"] = dr1["filename"].ToString();
                Session["otp"] = dr1["fileotp"].ToString();

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "otp",
                    "<script>alert('OTP Sent Successfully');</script>");

                if (Session["emailid"] != null)
                {
                    MailMessage msg = new MailMessage(
                        new MailAddress("noreplymailing22@gmail.com"),
                        new MailAddress(Session["emailid"].ToString())
                    );

                    msg.Subject = "OTP Mail for " + Session["filename"].ToString();
                    msg.IsBodyHtml = true;
                    msg.Body = "Hai, Your OTP is <b>" + Session["otp"].ToString() + "</b>";

                    System.Net.NetworkCredential nwcred =
                        new System.Net.NetworkCredential(
                            "noreplymailing22@gmail.com",
                            "ipudbyifzmcsjyhk");

                    SmtpClient smclient = new SmtpClient();
                    smclient.EnableSsl = true;
                    smclient.UseDefaultCredentials = false;
                    smclient.Credentials = nwcred;
                    smclient.Host = "smtp.gmail.com";
                    smclient.Port = 587;

                    smclient.Send(msg);

                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "mail",
                        "<script>alert('Activation Mail Sent Successfully');</script>");
                }

                Response.Redirect("accessfile.aspx?fileid=" +
                    Request.QueryString["fileid"].ToString());
            }
        }
    }
}
