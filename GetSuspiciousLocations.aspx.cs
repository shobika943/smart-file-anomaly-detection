using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public partial class GetSuspiciousLocations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "application/json";

        List<object> locations = new List<object>();

        Class1 c = new Class1();
        SqlConnection con = c.connect();

        SqlCommand cmd = new SqlCommand(
        "SELECT UserName,IPAddress,Location,Latitude,Longitude,Reason FROM SuspiciousUsers WHERE Latitude IS NOT NULL", con);

        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            locations.Add(new
            {
                UserName = dr["UserName"].ToString(),
                IPAddress = dr["IPAddress"].ToString(),
                Location = dr["Location"].ToString(),
                Reason = dr["Reason"].ToString(),
                Latitude = dr["Latitude"].ToString(),
                Longitude = dr["Longitude"].ToString()
            });
        }

        con.Close();

        JavaScriptSerializer js = new JavaScriptSerializer();

        Response.Write(js.Serialize(locations));
        Response.End();
    }
}