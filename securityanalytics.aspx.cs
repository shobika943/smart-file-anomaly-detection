using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class securityanalytics : System.Web.UI.Page
{
    public string OwnerLabels, OwnerData;
    public string DownloaderLabels, DownloaderData;
    public string SuspicionLabels, SuspicionData;

    public string ThreatLevel = "LOW";
    public string AlertClass = "alert-low";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAnalytics();
        }
    }

    void LoadAnalytics()
    {
        SqlConnection con = new Class1().connect();

        // 1️⃣ OWNER RISK
        SqlDataAdapter da1 = new SqlDataAdapter(
            "SELECT owner, COUNT(DISTINCT requester) as Downloaders " +
            "FROM download_requests GROUP BY owner", con);

        DataTable dt1 = new DataTable();
        da1.Fill(dt1);

        OwnerLabels = ConvertToLabels(dt1, "owner");
        OwnerData = ConvertToData(dt1, "Downloaders");

        // 2️⃣ DOWNLOADER BEHAVIOR
        SqlDataAdapter da2 = new SqlDataAdapter(
            "SELECT requester, COUNT(DISTINCT fileid) as FilesDownloaded " +
            "FROM download_requests GROUP BY requester", con);

        DataTable dt2 = new DataTable();
        da2.Fill(dt2);

        DownloaderLabels = ConvertToLabels(dt2, "requester");
        DownloaderData = ConvertToData(dt2, "FilesDownloaded");

        // 3️⃣ SUSPICIOUS FREQUENCY
        SqlDataAdapter da3 = new SqlDataAdapter(
            "SELECT requester, COUNT(*) as Attempts " +
            "FROM download_requests WHERE requester != owner GROUP BY requester", con);

        DataTable dt3 = new DataTable();
        da3.Fill(dt3);

        SuspicionLabels = ConvertToLabels(dt3, "requester");
        SuspicionData = ConvertToData(dt3, "Attempts");

        // THREAT LEVEL CALCULATION
        int totalSuspicious = dt3.Rows.Count;

        if (totalSuspicious > 10)
        {
            ThreatLevel = "HIGH";
            AlertClass = "alert-high";
        }
        else if (totalSuspicious > 5)
        {
            ThreatLevel = "MEDIUM";
            AlertClass = "alert-medium";
        }
        else
        {
            ThreatLevel = "LOW";
            AlertClass = "alert-low";
        }

        con.Close();
    }

    string ConvertToLabels(DataTable dt, string column)
    {
        StringBuilder sb = new StringBuilder("[");
        foreach (DataRow row in dt.Rows)
        {
            sb.Append("'" + row[column].ToString() + "',");
        }
        sb.Append("]");
        return sb.ToString().Replace(",]", "]");
    }

    string ConvertToData(DataTable dt, string column)
    {
        StringBuilder sb = new StringBuilder("[");
        foreach (DataRow row in dt.Rows)
        {
            sb.Append(row[column].ToString() + ",");
        }
        sb.Append("]");
        return sb.ToString().Replace(",]", "]");
    }
}
