using System;
using System.Net;
using System.IO;

public class IPLocation
{
    string token = "a1524ad8b9a156";

    public void GetLocation(string ip, out double lat, out double lon, out string location)
    {
        lat = 0;
        lon = 0;
        location = "Unknown";

        try
        {
            string url = "https://ipinfo.io/" + ip + "?token=" + token;

            WebRequest request = WebRequest.Create(url);
            WebResponse response = request.GetResponse();

            StreamReader reader = new StreamReader(response.GetResponseStream());
            string data = reader.ReadToEnd();

            reader.Close();

            int index = data.IndexOf("\"loc\":");

            if (index != -1)
            {
                string loc = data.Substring(index + 7, 20);
                loc = loc.Split('"')[0];

                string[] coords = loc.Split(',');

                lat = Convert.ToDouble(coords[0]);
                lon = Convert.ToDouble(coords[1]);
            }

            int cityIndex = data.IndexOf("\"city\":");

            if (cityIndex != -1)
            {
                string city = data.Substring(cityIndex + 8);
                city = city.Split('"')[0];
                location = city;
            }
        }
        catch
        {

        }
    }
}