<%@ Page Language="C#" AutoEventWireup="true" CodeFile="securityanalytics.aspx.cs" Inherits="securityanalytics" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Security Analytics | SFAD Admin</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- BOOTSTRAP -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- GOOGLE FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet" />

    <!-- CHART JS -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
                linear-gradient(rgba(2,6,23,0.78), rgba(2,6,23,0.78)),
                url('assets/images/smarthome.png');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            filter: brightness(1.1) contrast(1.15);
            z-index: -1;
        }

        /* NAVBAR */
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
            background: transparent;
        }

        /* PAGE HEADER */
        .page-header h1 {
            color: #00c8ff;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .page-header p {
            color: #cfd8e3;
            font-size: 14px;
        }

        /* CARD */
        .card {
            background: rgba(10, 20, 40, 0.95);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,200,255,0.12);
            margin-top: 25px;
        }

        canvas {
            background: #0b1b33;
            padding: 15px;
            border-radius: 10px;
        }

        /* ALERTS */
        .alert-high {
            background: #ff1744;
            padding: 15px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            animation: blink 1s infinite;
        }

        .alert-medium {
            background: #ff9800;
            padding: 15px;
            border-radius: 8px;
            font-weight: bold;
            text-align: center;
        }

        .alert-low {
            background: #00c853;
            padding: 15px;
            border-radius: 8px;
            font-weight: bold;
            text-align: center;
        }

        @keyframes blink {
            0% { opacity: 1; }
            50% { opacity: 0.4; }
            100% { opacity: 1; }
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
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#menu">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="adminwelcome.aspx">
                Smart File Activity Anomaly Detection
            </a>
        </div>

        <div class="collapse navbar-collapse" id="menu">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="adminwelcome.aspx">Dashboard</a></li>
                <li><a href="activateusers.aspx">User Management</a></li>
                <li><a href="adminviewfiles.aspx">File Monitoring</a></li>
                
                <li><a href="report.aspx">Reports</a></li>
                <li class="active"><a href="securityanalytics.aspx">Security Analytics</a></li>
                <li><a href="downloadlogs.aspx">Download Logs</a></li>
                <li><a href="suspicioususers.aspx">Suspicious Users</a></li>
                <li><a href="adminlogin.aspx">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- CONTENT -->
<div class="container">

    <div class="page-header">
        <h1>Security Analytics Dashboard</h1>
        <p>
            Visualize file risks, downloader behavior, suspicious activities,
            and system threat levels in real time.
        </p>
    </div>

    <!-- FILE OWNER RISK -->
    <div class="card">
        <h4>File Owner Risk Analysis</h4>
        <canvas id="ownerRiskChart"></canvas>
    </div>

    <!-- DOWNLOADER BEHAVIOR -->
    <div class="card">
        <h4>Downloader Behavior Analysis</h4>
        <canvas id="downloaderChart"></canvas>
    </div>

    <!-- SUSPICIOUS ACTIVITY -->
    <div class="card">
        <h4>Suspicious Activity Frequency</h4>
        <canvas id="suspicionChart"></canvas>
    </div>

    <!-- SYSTEM THREAT -->
    <div class="card">
        <h4>System Threat Status</h4>
        <div class="<%= AlertClass %>">
            SYSTEM THREAT LEVEL : <%= ThreatLevel %>
        </div>
    </div>

</div>

<!-- FOOTER -->
<footer>
    © 2018 Smart File Activity Anomaly Detection | Admin Panel
</footer>

<script src="assets/js/vendor/bootstrap.min.js"></script>

<script>
    new Chart(document.getElementById('ownerRiskChart'), {
        type: 'bar',
        data: {
            labels: <%= OwnerLabels %>,
            datasets: [{
                label: 'Users Downloaded Their Files',
                data: <%= OwnerData %>,
                backgroundColor: '#00c8ff'
            }]
        }
    });

    new Chart(document.getElementById('downloaderChart'), {
        type: 'bar',
        data: {
            labels: <%= DownloaderLabels %>,
            datasets: [{
                label: 'Files Downloaded',
                data: <%= DownloaderData %>,
                backgroundColor: '#ff9800'
            }]
        }
    });

    new Chart(document.getElementById('suspicionChart'), {
        type: 'line',
        data: {
            labels: <%= SuspicionLabels %>,
            datasets: [{
                label: 'Suspicious Attempts',
                data: <%= SuspicionData %>,
                borderColor: '#ff1744',
                fill: false
            }]
        }
    });
</script>

</form>
</body>
</html>
