using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web.UI;

public partial class CaptchaImage : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string captchaText = GenerateCaptchaText();
        Session["captcha"] = captchaText;

        using (Bitmap bmp = new Bitmap(150, 50))
        using (Graphics g = Graphics.FromImage(bmp))
        using (Font font = new Font("Arial", 22, FontStyle.Bold))
        {
            g.Clear(Color.Black);
            g.DrawString(captchaText, font, Brushes.Cyan, 10, 8);

            Response.Clear();
            Response.ContentType = "image/png";
            bmp.Save(Response.OutputStream, ImageFormat.Png);
            Response.End();
        }
    }

    private string GenerateCaptchaText()
    {
        string chars = "abcdefghijklmnopqrstuvwxyz123456789";
        Random rnd = new Random();
        char[] captcha = new char[5];

        for (int i = 0; i < captcha.Length; i++)
        {
            captcha[i] = chars[rnd.Next(chars.Length)];
        }

        return new string(captcha);
    }
}
