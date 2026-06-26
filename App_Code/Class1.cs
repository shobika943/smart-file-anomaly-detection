using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
    public Class1()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public SqlConnection connect()
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-13NF5V1\\SQLEXPRESS;Initial Catalog=DCOICLOUD;Integrated Security=true;");
        con.Open();
        return con;
    }
}