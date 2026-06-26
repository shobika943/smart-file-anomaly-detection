<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Smart File Activity Anomaly Detection</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            padding-top: 70px;
            background: #000;
        }

        /* NAVBAR */
        .navbar {
            background: rgba(5,15,30,0.95);
            border: none;
        }

        .navbar-brand {
    display: flex;
    align-items: center;
    gap: 10px;
}

.nav-logo {
    height: 70px;          /* adjust size if needed */
    width: auto;
}

        .navbar-nav > li > a {
            color: #ffffff !important;
            font-weight: 500;
        }

        .navbar-nav > li.active > a,
        .navbar-nav > li > a:hover {
            color: #00c8ff !important;
            background: transparent;
        }

        /* HERO SECTION */
        .hero {
            min-height: 100vh;
            background:
                linear-gradient(rgba(0,0,0,0.65), rgba(0,0,0,0.65)),
                url('assets/images/smarthome.png') no-repeat center center;
            background-size: cover;
            color: #ffffff;
            display: flex;
            align-items: center;
        }

        .hero-content {
            width: 100%;
            text-align: center;
        }

        .hero h1 {
            font-size: 40px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .hero h2 {
            font-size: 20px;
            font-weight: 300;
            margin-bottom: 50px;
            color: #d0d8e0;
        }

        /* CENTER IMAGE */
        .hero-image img {
            max-width: 80%;
            margin: auto;
        }

        /* FEATURES */
        .features {
            margin-top: 40px;
        }

        .feature-item {
            color: #d0d8e0;
            font-size: 14px;
        }

        /* FOOTER */
        footer {
            background: #050f1e;
            color: #9aa7b5;
            padding: 25px 0;
            text-align: center;
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
                <a class="navbar-brand" href="Default.aspx">
                <img src="assets/images/smartlogo1.png" alt="SFAD Logo" class="nav-logo" />
                    Smart File Activity Anomaly Detection
                </a>
            </div>

            <div class="collapse navbar-collapse" id="menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="Default.aspx">Home</a></li>
                    <li><a href="adminlogin.aspx">Admin Login</a></li>
                    <li><a href="userlogin.aspx">User Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- HERO SECTION -->
    <section class="hero">
        <div class="container hero-content">

            <h1>Advanced Security for Monitoring Suspicious File Activities</h1>
            <h2>Smart detection of anomalous file behavior using IP analytics</h2>

            <!-- CENTER IMAGE -->
            <div class="hero-image">
                <img src="assets/images/center-dashboard.png" class="img-responsive center-block" />
            </div>

            <!-- FEATURES -->
            <div class="row features">
                <div class="col-md-4 feature-item">
                    <strong>Real-Time Monitoring</strong><br />
                    Track file activities live and detect anomalies instantly
                </div>
                <div class="col-md-4 feature-item">
                    <strong>Threat Analysis</strong><br />
                    Identify suspicious behavior and potential threats
                </div>
                <div class="col-md-4 feature-item">
                    <strong>Data Protection</strong><br />
                    Safeguard sensitive information from breaches
                </div>
            </div>

        </div>
    </section>

    <!-- FOOTER -->
    <footer>
        © 2018 Smart File Activity Anomaly Detection | All Rights Reserved
    </footer>

</form>

<script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>
