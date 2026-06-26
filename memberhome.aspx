<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memberhome.aspx.cs" Inherits="memberhome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Dashboard | SFAD</title>

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
            margin: 0;
        }

        body::before {
            content: "";
            position: fixed;
            inset: 0;
            background:
                linear-gradient(rgba(2,6,23,0.78), rgba(2,6,23,0.78)),
                url('assets/images/smarthome.png');
            background-size: cover;
            background-position: center;
            z-index: -1;
        }

        /* ================= HEADER ================= */
        .top-header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 70px;
            background: rgba(5, 15, 30, 0.95);
            display: flex;
            align-items: center;
            padding: 0 20px;
            z-index: 1000;
        }

        .menu-btn {
            font-size: 28px;
            background: none;
            border: none;
            color: #00c8ff;
            margin-right: 20px;
            cursor: pointer;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 600;
            font-size: 18px;
        }

        .brand img {
            height: 45px;
        }

        /* ================= SIDEBAR ================= */
        .sidebar {
            position: fixed;
            top: 0;
            left: -260px;
            width: 260px;
            height: 100%;
            background: #050f1e;
            padding-top: 90px;
            transition: 0.4s;
            z-index: 1100;
            box-shadow: 5px 0 25px rgba(0,0,0,0.5);
        }

        .sidebar a {
            display: block;
            padding: 15px 25px;
            color: #ffffff;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: #00c8ff;
            color: #020617;
        }

        .sidebar.active {
            left: 0;
        }

        /* Overlay */
        .overlay {
            position: fixed;
            display: none;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            top: 0;
            left: 0;
            z-index: 1050;
        }

        .overlay.active {
            display: block;
        }

        /* ================= CONTENT ================= */
        .container {
            margin-top: 40px;
        }

        .page-header h1 {
            color: #00c8ff;
            font-weight: 600;
        }

        .dashboard-card {
            background: rgba(10, 20, 40, 0.95);
            border-radius: 14px;
            padding: 30px;
            box-shadow: 0 0 30px rgba(0,200,255,0.15);
            margin-top: 40px;
        }

        .quick-actions a {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: 500;
            text-decoration: none;
            color: #020617;
            background: #00c8ff;
            transition: 0.3s;
        }

        .quick-actions a:hover {
            background: #00a8d6;
            transform: translateY(-2px);
        }

        footer {
            background: #050f1e;
            color: #9aa7b5;
            text-align: center;
            padding: 15px 0;
            margin-top: 60px;
            font-size: 13px;
        }
    </style>
</head>

<body>
<form id="Form1" runat="server">

    <!-- HEADER -->
    <div class="top-header">
        <button type="button" class="menu-btn" onclick="openSidebar()">☰</button>

        <div class="brand">
            <img src="assets/images/smartlogo1.png" />
            SFAD – User Panel
        </div>
    </div>

    <!-- SIDEBAR -->
    <div id="sidebar" class="sidebar">
        <a href="memberhome.aspx">Home</a>
        <a href="viewfiles.aspx">View Files</a>
        <li><a href="MyFileDownloadStats.aspx">Download Stats</a></li>
        <a href="useraddfile.aspx">Add Files</a>

        <a href="userlogin.aspx">Logout</a>
    </div>

    <!-- OVERLAY -->
    <div id="overlay" class="overlay" onclick="closeSidebar()"></div>

    <!-- CONTENT -->
    <div class="container text-center">

        <div class="page-header">
            <h1>Welcome to Smart File Activity Anomaly Detection</h1>
            <p>Securely manage your files and monitor activity with advanced anomaly detection.</p>
        </div>

        <div class="dashboard-card">

            <h3>
                Hello,
                <% = Session["username"] != null ? Session["username"].ToString() : "User" %>
            </h3>

            <p>
                This dashboard allows you to upload files, view stored documents,
                and ensure secure file access through intelligent anomaly detection.
                All activities are continuously monitored to protect your data.
            </p>

            <div class="quick-actions">
                <a href="useraddfile.aspx">Upload New File</a>
                <a href="viewfiles.aspx">View My Files</a>
            </div>

        </div>

    </div>

    <!-- FOOTER -->
    <footer>
        © 2018 Smart File Activity Anomaly Detection | User Dashboard
    </footer>

</form>

<script>
    function openSidebar() {
        document.getElementById("sidebar").classList.add("active");
        document.getElementById("overlay").classList.add("active");
    }

    function closeSidebar() {
        document.getElementById("sidebar").classList.remove("active");
        document.getElementById("overlay").classList.remove("active");
    }
</script>

</body>
</html>
