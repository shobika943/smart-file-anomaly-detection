<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="RequestApproval.aspx.cs"
    Inherits="RequestApproval" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Request File Approval | Smart File Activity Anomaly Detection</title>

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
                linear-gradient(rgba(2, 6, 23, 0.78), rgba(2, 6, 23, 0.78)),
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

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav-logo {
            height: 70px;
            width: auto;
        }

        .navbar-nav > li.active > a,
        .navbar-nav > li > a:hover {
            color: #00c8ff !important;
            background: transparent;
        }

        /* REQUEST SECTION */
        .request-section {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .request-card {
            background: rgba(10, 20, 40, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(0, 200, 255, 0.15);
            width: 100%;
            max-width: 480px;
            text-align: center;
        }

        .request-card h2 {
            margin-bottom: 20px;
            font-weight: 600;
            color: #00c8ff;
        }

        .info-label {
            color: #9adfff;
            font-weight: 500;
            display: block;
            margin-bottom: 20px;
        }

        .btn-request {
            background: #00c8ff;
            border: none;
            color: #000;
            font-weight: 600;
            width: 100%;
            padding: 12px;
            margin-top: 10px;
        }

        .btn-request:hover {
            background: #00a8d6;
        }

        .msg-success {
            color: #7CFF9E;
            margin-top: 20px;
            font-weight: 500;
        }

        .msg-error {
            color: #ff7c7c;
            margin-top: 20px;
            font-weight: 500;
        }

        .verify-link {
            display: block;
            margin-top: 25px;
            color: #00c8ff;
            font-weight: 600;
            text-decoration: none;
        }

        .verify-link:hover {
            text-decoration: underline;
        }

        footer {
            background: #050f1e;
            color: #9aa7b5;
            padding: 20px 0;
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
                    <img src="assets/images/smartlogo1.png" class="nav-logo" />
                    Smart File Activity Anomaly Detection
                </a>
            </div>

            <div class="collapse navbar-collapse" id="menu">
                <ul class="nav navbar-nav navbar-right">
                     <li><a href="memberhome.aspx">Home</a></li>
                <li class="active"><a href="viewfiles.aspx">View Files</a></li>
                <li><a href="useraddfile.aspx">Add Files</a></li>
                <li><a href="userlogin.aspx">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- REQUEST SECTION -->
    <section class="request-section">
        <div class="request-card">

            <h2>Request File Download</h2>

            <asp:Label ID="lblInfo" runat="server" CssClass="info-label"></asp:Label>

            <asp:Button ID="btnRequest"
                runat="server"
                Text="Request Approval"
                CssClass="btn btn-request"
                OnClick="btnRequest_Click" />

            <asp:Label ID="lblMsg"
                runat="server"
                CssClass="msg-success"></asp:Label>

            <asp:HyperLink ID="lnkVerify"
                runat="server"
                CssClass="verify-link"
                NavigateUrl="VerifyQR.aspx"
                Visible="false">
                Go to QR Verification Page
            </asp:HyperLink>

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
