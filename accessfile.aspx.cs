using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Data;
using System.Net.Mail;
using System.Collections;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.Net.Mime;

public partial class accessfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["fileid"] != null)
        {
            Class1 getcon2 = new Class1();
            SqlConnection con2 = getcon2.connect();
            SqlCommand cmd2 = new SqlCommand(
                "select * from addfiles where fileid='" +
                Request.QueryString["fileid"].ToString() +
                "' and status='Approve'", con2);

            SqlDataReader dr2 = cmd2.ExecuteReader();
            if (dr2.Read())
            {
                Session["filename"] = dr2["originalfile"].ToString();
                string appPath = Request.PhysicalApplicationPath.ToString();
                string path = appPath + "\\userfiles\\" + Session["filename"].ToString();

                if (!string.IsNullOrEmpty(path))
                {
                    string[] readText = File.ReadAllLines(path);
                    StringBuilder strbuild = new StringBuilder();
                    foreach (string s in readText)
                    {
                        strbuild.Append(s);
                        strbuild.AppendLine();
                    }
                    TextBox2.Text = strbuild.ToString();
                    TextBox2.Enabled = false;
                    TextBox2.ReadOnly = true;

                    string encrypt1 = encryptdata(TextBox2.Text);
                    TextBox2.Text = encrypt1;
                }
            }
            else
            {
                Response.Write("<script>alert('Pls Wait For Admin Approval')</script>");
            }
        }
    }

    private string encryptdata(string data)
    {
        byte[] encode = Encoding.UTF8.GetBytes(data);
        return Convert.ToBase64String(encode);
    }

    public static string CreateRandomPassword(int PasswordLength)
    {
        string _allowedChars = "0123456789";
        Random randNum = new Random();
        char[] chars = new char[PasswordLength];
        for (int i = 0; i < PasswordLength; i++)
        {
            chars[i] = _allowedChars[randNum.Next(_allowedChars.Length)];
        }
        return new string(chars);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["otp"].ToString() == TextBox1.Text)
        {
            string appPath = Request.PhysicalApplicationPath.ToString();
            Session["uploadfile"] = Session["ofilename"].ToString();

            string a = appPath + "\\userfiles\\" + Session["uploadfile"].ToString();
            Context.Response.Clear();
            FileInfo file = new FileInfo(a);
            Context.Response.ContentType = "application/octet-stream";
            Context.Response.AppendHeader("Content-Disposition", "inline; filename=" + file.Name);
            Context.Response.AppendHeader("Content-Length", file.Length.ToString());
            Context.Response.WriteFile(file.FullName);
            Context.Response.End();
        }
        else
        {
            Session["msg"] = TextBox2.Text;
            string fn = Session["filename"].ToString() + ".xls";


            Class1 con1 = new Class1();
            SqlConnection con = con1.connect();

            // Update dummy file in addfiles
            SqlCommand cmd = new SqlCommand(
                "update addfiles set dummyfile='" + fn +
                "',filekey='" + Session["otp"].ToString() +
                "' where fileid='" + Request.QueryString["fileid"].ToString() + "'", con);
            cmd.ExecuteNonQuery();


            // ================= LOG SUSPICIOUS =================
            try
            {
                string ip = Request.UserHostAddress;
                string browser = Request.UserAgent;
                string location = "Unknown";
                string latitude = "";
                string longitude = "";

                if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
                    ip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                else if (Request.ServerVariables["REMOTE_ADDR"] != null)
                    ip = Request.ServerVariables["REMOTE_ADDR"];

                try
                {
                    string apiUrl = "http://ip-api.com/json/" + ip;
                    WebClient wc = new WebClient();
                    string json = wc.DownloadString(apiUrl);

                    // Simple manual JSON parsing (NO external library)
                    location = GetJsonValue(json, "city") + ", " +
                               GetJsonValue(json, "regionName") + ", " +
                               GetJsonValue(json, "country");

                    latitude = GetJsonValue(json, "lat");
                    longitude = GetJsonValue(json, "lon");
                }
                catch
                {
                    location = "Location Not Found";
                }

                int fileId = 0;
                int.TryParse(Request.QueryString["fileid"], out fileId);

                SqlCommand logcmd = new SqlCommand(
                    "INSERT INTO SuspiciousUsers " +
                    "(UserName, FileId, IPAddress, BrowserInfo, Location, Latitude, Longitude, AttemptTime, Reason, FailedAttempts) " +
                    "VALUES (@user, @fid, @ip, @browser, @loc, @lat, @lon, @time, @reason, @fail)", con);

                logcmd.Parameters.AddWithValue("@user", Session["username"] ?? "Unknown");
                logcmd.Parameters.AddWithValue("@fid", fileId);
                logcmd.Parameters.AddWithValue("@ip", ip);
                logcmd.Parameters.AddWithValue("@browser", browser);
                logcmd.Parameters.AddWithValue("@loc", location);
                logcmd.Parameters.AddWithValue("@lat", latitude);
                logcmd.Parameters.AddWithValue("@lon", longitude);
                logcmd.Parameters.AddWithValue("@time", DateTime.Now);
                logcmd.Parameters.AddWithValue("@reason", "Wrong OTP - Dummy File Downloaded");
                logcmd.Parameters.AddWithValue("@fail", 1);

                logcmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Log Error: " + ex.Message + "');</script>");
            }



            // ================= SEND ADMIN MAIL BEFORE DOWNLOAD =================
            try
            {

                MailMessage msg = new MailMessage(
                    new MailAddress("noreplymailing22@gmail.com"),
                    new MailAddress("futuriktechnologies@gmail.com"));

                msg.Subject = "Dummy File Creation Alert";
                msg.IsBodyHtml = false;
                msg.Body =
                    "Dear Administrator,\n\n" +
                    "Wrong OTP Attempt Detected.\n\n" +
                    "User: " + Session["username"].ToString() + "\n" +
                    "File Name: " + fn + "\n" +
                    "Time: " + DateTime.Now.ToString() + "\n\n" +
                    "Secure File Access System";

                SmtpClient smclient = new SmtpClient("smtp.gmail.com", 587);
                smclient.EnableSsl = true;
                smclient.Credentials =
                    new NetworkCredential("noreplymailing22@gmail.com", "ipudbyifzmcsjyhk");
                smclient.Send(msg);
                ClientScript.RegisterStartupScript(this.GetType(), "play",
            "setTimeout(function(){document.getElementById('audioAlert').play();},300);", true);

            }
            catch { }

            // ================= DOWNLOAD DUMMY FILE =================
            string audioScript = "<script>" +
"setTimeout(function(){ var a=new Audio('audio/voice.mp3'); a.play(); },500);" +
"</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "alertAudio", audioScript);
            Session["uploadfile"] = fn;
            Response.Redirect("dummyDownload.aspx");
        }
    }
    private string GetJsonValue(string json, string key)
    {
        try
        {
            string pattern = "\"" + key + "\":";
            int startIndex = json.IndexOf(pattern) + pattern.Length;

            if (startIndex < pattern.Length)
                return "";

            int endIndex;

            if (json[startIndex] == '\"')
            {
                startIndex++;
                endIndex = json.IndexOf("\"", startIndex);
            }
            else
            {
                endIndex = json.IndexOf(",", startIndex);
                if (endIndex == -1)
                    endIndex = json.IndexOf("}", startIndex);
            }

            return json.Substring(startIndex, endIndex - startIndex);
        }
        catch
        {
            return "";
        }
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["fileid"] != null)
        {
            Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();
            SqlCommand cmd1 = new SqlCommand(
                "select * from addfiles where fileid='" +
                Request.QueryString["fileid"].ToString() + "'", con1);

            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
            {
                Session["ofilename"] = dr1["originalfile"].ToString();
                Session["dfilename"] = dr1["dummyfile"].ToString();
                Session["otp"] = CreateRandomPassword(8);

                MailMessage msg = new MailMessage(
                    new MailAddress("noreplymailing22@gmail.com"),
                    new MailAddress(Session["emailid"].ToString()));

                msg.Subject = "One-Time Password (OTP) for Secure File Access";
                msg.IsBodyHtml = false;
                msg.Body =
                    "Your OTP is: " + Session["otp"].ToString();

                SmtpClient smclient = new SmtpClient("smtp.gmail.com", 587);
                smclient.EnableSsl = true;
                smclient.Credentials =
                    new NetworkCredential("noreplymailing22@gmail.com", "ipudbyifzmcsjyhk");
                smclient.Send(msg);

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "ele",
                    "<script>alert('OTP Mail Sent Successfully');</script>");
            }
        }
    }
}
