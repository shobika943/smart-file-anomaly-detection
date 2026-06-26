using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class useraddfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

  

    public static string CreateRandomPassword(int PasswordLength)
    {
        string _allowedChars = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ@#@%";
        Random randNum = new Random();
        char[] chars = new char[PasswordLength];
        int allowedCharCount = _allowedChars.Length;
        for (int i = 0; i < PasswordLength; i++)
        {
            chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
        }
        return new string(chars);
    }


    public void clear()
    {
        TextBox1.Text = "";
   
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        String aa1 = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
        String SaveLocationsa1 = Server.MapPath("~/userfiles/") + aa1;
        FileUpload1.PostedFile.SaveAs(SaveLocationsa1);
        String s = CreateRandomPassword(8);
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        string b = "null";
        string g = "Not Approve";

        SqlCommand cmd = new SqlCommand("insert into addfiles values('" + TextBox1.Text + "','" + aa1 + "','" + s + "','" + b + "','" + g + "','" + Session["username"].ToString() + "')", con);
        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('File Details Added Successfully!!!!')</script>");
    }
}