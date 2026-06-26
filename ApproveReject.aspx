<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApproveReject.aspx.cs" Inherits="ApproveReject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Request Status | SFAD</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
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
                linear-gradient(rgba(2,6,23,0.78), rgba(2,6,23,0.78)),
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

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav-logo {
            height: 70px;
        }

        .status-section {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .status-card {
            background: rgba(10,20,40,0.95);
            padding: 45px;
            border-radius: 14px;
            box-shadow: 0 0 35px rgba(0,200,255,0.18);
            max-width: 520px;
            width: 100%;
            text-align: center;
        }

        /* ===== SPINNER TICK ===== */
        .spinner {
            width: 100px;
            height: 100px;
            border: 8px solid rgba(255,255,255,0.15);
            border-top-color: #2ecc71;
            border-radius: 50%;
            margin: 0 auto 25px;
            position: relative;
            animation: spin 1.2s linear 1;
        }

        .spinner.reject {
            border-top-color: #ff4d4d;
        }

        .spinner::after {
            content: "✔";
            font-size: 48px;
            font-weight: bold;
            color: #2ecc71;
            position: absolute;
            inset: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            animation: showIcon 0.4s ease forwards;
            animation-delay: 1.2s;
        }

        .spinner.reject::after {
            content: "✖";
            color: #ff4d4d;
        }

        .status-card h2 {
            margin-bottom: 15px;
            font-weight: 600;
        }

        .status-card p {
            color: #d0d8e0;
            font-size: 15px;
            line-height: 1.7;
        }

        footer {
            background: #050f1e;
            color: #9aa7b5;
            padding: 20px 0;
            text-align: center;
            font-size: 13px;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        @keyframes showIcon {
            from { opacity: 0; transform: scale(0.5); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="Default.aspx">
                    <img src="assets/images/smartlogo1.png" class="nav-logo" />
                    Smart File Activity Anomaly Detection
                </a>
            </div>
        </div>
    </nav>

    <!-- STATUS CONTENT -->
    <section class="status-section">
        <div class="status-card">

            <% if (Request.QueryString["action"] == "approve") { %>

                <div class="spinner"></div>
                <h2>Request Approved</h2>
                <p>
                    The file download request has been <b>successfully approved</b>.<br />
                    A verification email with QR code has been sent to the user.
                </p>

            <% } else { %>

                <div class="spinner reject"></div>
                <h2>Request Rejected</h2>
                <p>
                    The file download request has been <b>rejected</b>.<br />
                    A rejection email notification has been sent to the user.
                </p>

            <% } %>

        </div>
    </section>

    <!-- FOOTER -->
    <footer>
        © 2018 Smart File Activity Anomaly Detection | All Rights Reserved
    </footer>

</form>
</body>
</html>
