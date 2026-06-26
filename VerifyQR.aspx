<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="VerifyQR.aspx.cs"
    Inherits="VerifyQR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Verify Download | SFAD</title>

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

        .verify-section {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .verify-card {
            background: rgba(10,20,40,0.95);
            padding: 45px;
            border-radius: 14px;
            box-shadow: 0 0 35px rgba(0,200,255,0.18);
            max-width: 420px;
            width: 100%;
            text-align: center;
        }

        .verify-card h2 {
            margin-bottom: 25px;
            font-weight: 600;
        }

        .form-control {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.15);
            color: #ffffff;
            height: 45px;
        }

        .form-control:focus {
            background: rgba(255,255,255,0.12);
            color: #ffffff;
            box-shadow: none;
            border-color: #00c8ff;
        }

        .btn-verify {
            width: 100%;
            height: 45px;
            background: linear-gradient(135deg, #00c8ff, #007bff);
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 6px;
            margin-top: 20px;
        }

        .btn-verify:hover {
            opacity: 0.9;
        }

        .msg {
            margin-top: 15px;
            font-size: 14px;
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

    <!-- VERIFY CONTENT -->
    <section class="verify-section">
        <div class="verify-card">

            <h2>Verify Download</h2>

            <div class="form-group">
                <asp:TextBox ID="txtCode"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Enter verification code"></asp:TextBox>
            </div>

            <asp:Button ID="btnVerify"
                runat="server"
                Text="Verify & Download"
                CssClass="btn btn-verify"
                OnClick="btnVerify_Click" />

            <asp:Label ID="lblMsg"
                runat="server"
                CssClass="msg"
                ForeColor="Red"></asp:Label>

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
