<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyFileDownloadStats.aspx.cs" Inherits="MyFileDownloadStats" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Download Statistics | SFAD</title>

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

        /* NAVBAR */
        .navbar {
            background: rgba(5, 15, 30, 0.95);
            border: none;
        }

        .navbar-brand,
        .navbar-nav > li > a {
            color: #ffffff !important;
            font-weight: 500;
        }

        .navbar-nav > li > a:hover,
        .navbar-nav > li.active > a {
            color: #00c8ff !important;
            background: transparent;
        }

        /* PAGE HEADER */
        .page-header h1 {
            color: #00c8ff;
            font-weight: 600;
        }

        .page-header p {
            color: #cfd8e3;
        }

        /* CARD */
        .card {
            background: rgba(10, 20, 40, 0.95);
            border-radius: 14px;
            padding: 30px;
            box-shadow: 0 0 30px rgba(0, 200, 255, 0.15);
            margin-top: 30px;
        }

        /* GRIDVIEW STYLE */
        .table {
            color: white;
        }

        .table th {
            background-color: #00c8ff;
            color: #000;
            text-align: center;
        }

        .table td {
            text-align: center;
            background-color: rgba(255,255,255,0.05);
        }

        footer {
            background: #050f1e;
            color: #9aa7b5;
            text-align: center;
            padding: 15px 0;
            margin-top: 50px;
            font-size: 13px;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed"
                        data-toggle="collapse" data-target="#menu">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="memberhome.aspx">
                    SFAD – User Panel
                </a>
            </div>

            <div class="collapse navbar-collapse" id="menu">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="memberhome.aspx">Home</a></li>
                    <li><a href="viewfiles.aspx">View Files</a></li>
                    <li><a href="useraddfile.aspx">Add Files</a></li>
                    <li class="active"><a href="MyFileDownloadStats.aspx">Download Stats</a></li>
                    <li><a href="userlogin.aspx">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- CONTENT -->
    <div class="container">

        <div class="page-header text-center">
            <h1>Download Statistics</h1>
            <p>Track how many times your files were downloaded.</p>
        </div>

        <div class="card">

            <asp:GridView ID="GridView1"
                runat="server"
                AutoGenerateColumns="false"
                CssClass="table table-bordered">

                <Columns>
                    <asp:BoundField DataField="filename" HeaderText="File Name" />
                    <asp:BoundField DataField="requester" HeaderText="Requested By" />
                    <asp:BoundField DataField="DisplayCount" HeaderText="Download Count" />
                </Columns>

            </asp:GridView>

        </div>

    </div>

    <!-- FOOTER -->
    <footer>
        © 2018 Smart File Activity Anomaly Detection | User Panel
    </footer>

</form>

<script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="assets/js/vendor/bootstrap.min.js"></script>

</body>
</html>