<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminwelcome.aspx.cs" Inherits="adminwelcome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Dashboard | SFAD</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding-top: 70px;
            background: #020617;
            color: #ffffff;
        }

        body::before {
            content: "";
            position: fixed;
            inset: 0;
            background:
                linear-gradient(rgba(2,6,23,0.80), rgba(2,6,23,0.80)),
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
            background: rgba(5,15,30,0.98);
            display: flex;
            align-items: center;
            padding: 0 20px;
            z-index: 1000;
            box-shadow: 0 5px 20px rgba(0,0,0,0.6);
        }

        .menu-btn {
            font-size: 28px;
            background: none;
            border: none;
            color: #00e5ff;
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
            left: -270px;
            width: 270px;
            height: 100%;
            background: #050f1e;
            padding-top: 90px;
            transition: 0.4s;
            z-index: 1100;
            box-shadow: 5px 0 25px rgba(0,0,0,0.5);
        }

        .sidebar a {
            display: block;
            padding: 16px 25px;
            color: #ffffff;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
            border-left: 4px solid transparent;
        }

        .sidebar a:hover {
            background: #00e5ff;
            color: #020617;
            border-left: 4px solid #ffffff;
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
            background: rgba(0,0,0,0.6);
            top: 0;
            left: 0;
            z-index: 1050;
        }

        .overlay.active {
            display: block;
        }

        /* ================= DASHBOARD ================= */
        .dashboard {
            padding: 50px 0;
        }

        .dashboard h1 {
            color: #00e5ff;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .dashboard p {
            color: #e2e8f0;
            font-size: 16px;
            max-width: 900px;
        }

        .info-card {
            background: rgba(6,14,35,0.95);
            border-radius: 12px;
            padding: 28px;
            margin-top: 30px;
            border: 1px solid rgba(0,229,255,0.25);
            box-shadow: 0 0 25px rgba(0,229,255,0.25);
            min-height: 230px;
            transition: 0.3s;
        }

        .info-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 0 40px rgba(0,229,255,0.5);
        }

        .info-card h3 {
            color: #00e5ff;
            font-size: 19px;
            margin-bottom: 12px;
        }

        .info-card ul {
            padding-left: 18px;
        }

        .info-card ul li {
            margin-bottom: 10px;
            font-size: 14.5px;
        }

        footer {
            background: rgba(5,15,30,0.98);
            color: #b6c2d1;
            padding: 22px 0;
            text-align: center;
            font-size: 13px;
            margin-top: 60px;
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
            SMART FILE ACTIVITY ANOMALY DETECTION – Admin Panel
        </div>
    </div>

    <!-- SIDEBAR -->
    <div id="sidebar" class="sidebar">
        <a href="adminwelcome.aspx">Dashboard</a>
        <a href="activateusers.aspx">User Management</a>
        <a href="adminviewfiles.aspx">File Monitoring</a>
        <a href="report.aspx">Reports</a>
        <li>
    <a href="securityanalytics.aspx">Security Analytics</a>
</li>

        <a href="downloadlogs.aspx">Download Logs</a>
        <a href="suspicioususers.aspx">Suspicious Users</a>
        
        <a href="adminlogin.aspx">Logout</a>
    </div>

    <!-- OVERLAY -->
    <div id="overlay" class="overlay" onclick="closeSidebar()"></div>

    <!-- DASHBOARD CONTENT -->
    <section class="dashboard">
        <div class="container">

            <h1>Welcome, Administrator</h1>
            <p>
                Monitor users, analyze file access behavior,
                and detect suspicious activities in real time.
            </p>

            <div class="row">

                <div class="col-md-4">
                    <div class="info-card">
                        <h3>System Overview</h3>
                        <ul>
                            <li>Continuous file monitoring</li>
                            <li>Abnormal behavior detection</li>
                            <li>Secure cloud storage</li>
                            <li>IP-based analysis</li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="info-card">
                        <h3>Administrator Controls</h3>
                        <ul>
                            <li>Approve/block users</li>
                            <li>Monitor uploaded files</li>
                            <li>Track suspicious access</li>
                            <li>Maintain system integrity</li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="info-card">
                        <h3>Security & Reports</h3>
                        <ul>
                            <li>Generate anomaly reports</li>
                            <li>Track unauthorized attempts</li>
                            <li>Identify insider threats</li>
                            <li>Maintain audit logs</li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <footer>
        © 2018 Smart File Activity Anomaly Detection | Admin Control Panel
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
