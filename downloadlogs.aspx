<%@ Page Language="C#" AutoEventWireup="true" CodeFile="downloadlogs.aspx.cs" Inherits="downloadlogs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Download Logs | SFAD</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            padding-top: 70px;
            background: linear-gradient(135deg, #020617, #050f1e);
            color: #ffffff;
        }

        body::before {
            content: "";
            position: fixed;
            inset: 0;
            background:
                linear-gradient(
                    rgba(2, 6, 23, 0.78),
                    rgba(2, 6, 23, 0.78)
                ),
                url('assets/images/smarthome.png');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            filter: brightness(1.1) contrast(1.15);
            z-index: -1;
        }

        .navbar {
            background: rgba(5,15,30,0.95);
            border: none;
        }

        .navbar-brand,
        .navbar-nav > li > a {
            color: #ffffff !important;
            font-weight: 500;
        }

        .navbar-nav > li.active > a,
        .navbar-nav > li > a:hover {
            color: #00c8ff !important;
        }

        .page-header h1 {
            color: #00c8ff;
            font-weight: 600;
        }

        .card {
            background: rgba(10, 20, 40, 0.95);
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 25px rgba(0,200,255,0.15);
            margin-top: 25px;
        }

        .EU_DataTable {
            width: 100%;
            background: transparent;
            color: #ffffff;
        }

        .EU_DataTable th {
            background: #00c8ff;
            color: #020617;
            text-align: center;
            font-weight: 600;
            padding: 12px;
        }

        .EU_DataTable td {
            background: rgba(255,255,255,0.05);
            text-align: center;
            padding: 10px;
        }

        .EU_DataTable tr:hover td {
            background-color: #0b3c5d;
        }

        footer {
            background: #050f1e;
            color: #9aa7b5;
            padding: 15px 0;
            text-align: center;
            font-size: 13px;
            margin-top: 40px;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" href="adminwelcome.aspx">
            
                Smart File Activity Anomaly Detection
            </a>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="adminwelcome.aspx">Dashboard</a></li>
                <li><a href="activateusers.aspx">User Management</a></li>
                <li><a href="adminviewfiles.aspx">File Monitoring</a></li>
                <li><a href="report.aspx">Reports</a></li>
                 <li>
    <a href="securityanalytics.aspx">Security Analytics</a>
</li>
                <li class="active"><a href="downloadlogs.aspx">Download Logs</a></li>
                 <li><a href="suspicioususers.aspx">Suspicious Users</a></li>
                <li><a href="adminlogin.aspx">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">

        <div class="page-header text-center">
            <h1>File Download Audit Logs</h1>
            <p>Complete monitoring of file download activities</p>
        </div>

        <div class="card">

            <asp:GridView ID="GridView2" runat="server"
                CssClass="EU_DataTable"
                AutoGenerateColumns="False"
                AllowPaging="True"
                PageSize="6"
                GridLines="None"
                OnPageIndexChanging="GridView2_PageIndexChanging">

                <Columns>
                    <asp:BoundField DataField="auditid" HeaderText="Audit ID" />
                    <asp:BoundField DataField="downloadedby" HeaderText="Downloaded By" />
                    <asp:BoundField DataField="fileowner" HeaderText="File Owner" />
                    <asp:BoundField DataField="filename" HeaderText="File Name" />
                    <asp:BoundField DataField="accesstype" HeaderText="Access Type" />
                    <asp:BoundField DataField="downloaddate" HeaderText="Date & Time" />
                </Columns>

            </asp:GridView>

        </div>

    </div>

    <footer>
        © 2018 Smart File Activity Anomaly Detection | Admin Panel
    </footer>

</form>

<script src="assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>
