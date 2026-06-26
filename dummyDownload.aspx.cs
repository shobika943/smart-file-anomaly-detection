using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.IO;
public partial class dummyDownload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["download"] == "1")
        {
            string fn = Session["filename"].ToString() + ".xls";
            string filepath = Request.PhysicalApplicationPath + "userfiles/" + fn;

            using (StreamWriter sw = File.CreateText(filepath))
            {
                sw.WriteLine(Session["msg"].ToString());
            }


            string a = Request.PhysicalApplicationPath + "\\userfiles\\" + Session["uploadfile"].ToString();

            Context.Response.Clear();
            FileInfo file = new FileInfo(a);
            Context.Response.ContentType = "application/octet-stream";
            Context.Response.AppendHeader("Content-Disposition", "inline; filename=" + file.Name);
            Context.Response.AppendHeader("Content-Length", file.Length.ToString());


            Context.Response.WriteFile(file.FullName);
            Context.Response.End();
        }
    }
}