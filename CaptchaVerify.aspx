<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CaptchaVerify.aspx.cs" Inherits="CaptchaVerify" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Captcha Verification | SFAD</title>

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

    /* Separate image + darkness correctly */
    background:
        linear-gradient(
            rgba(2, 6, 23, 0.78),
            rgba(2, 6, 23, 0.78)
        ),
        url('assets/images/smarthome.png');

    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;

    /* Image clarity */
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

        .verify-section {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .verify-card {
            background: rgba(10, 20, 40, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 25px rgba(0,200,255,0.15);
            width: 100%;
            max-width: 420px;
            text-align: center;
        }

        .verify-card h2 {
            color: #00c8ff;
            margin-bottom: 25px;
            font-weight: 600;
        }

        .form-control {
            background: transparent;
            border: 2px solid #00c8ff;
            color: #ffffff;
        }

        .form-control:focus {
            border-color: #00e5ff;
            box-shadow: 0 0 6px rgba(0,200,255,0.6);
            outline: none;
        }

        .btn-main {
            background: #00c8ff;
            border: none;
            color: #000;
            font-weight: 600;
            width: 100%;
            margin-top: 15px;
        }

        .btn-main:hover {
            background: #00a8d6;
        }

        .btn-refresh {
            background: transparent;
            border: 1px solid #00c8ff;
            color: #00c8ff;
            margin-top: 10px;
        }

        .btn-refresh:hover {
            background: #00c8ff;
            color: #000;
        }

        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #00ff9c;
            font-weight: 600;
            text-decoration: none;
        }

        .back-link:hover {
            color: #7dffd1;
            text-decoration: underline;
        }

        footer {
            background: #050f1e;
            color: #9aa7b5;
            padding: 15px 0;
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
            <a class="navbar-brand" href="memberhome.aspx">
                SFAD – User Panel
            </a>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="memberhome.aspx">Home</a></li>
                <li class="active"><a href="viewfiles.aspx">View Files</a></li>
                <li><a href="useraddfile.aspx">Add Files</a></li>
                <li><a href="userlogin.aspx">Logout</a></li>
            </ul>
        </div>
    </nav>

    <!-- CAPTCHA SECTION -->
    <section class="verify-section">
        <div class="verify-card">

            

            <h2>Captcha Verification</h2>

            <!-- CAPTCHA IMAGE -->
            <asp:Image ID="imgCaptcha" runat="server"
                ImageUrl="CaptchaImage.aspx"
                Style="margin-bottom:15px;" />

            <br />

            <!-- REFRESH CAPTCHA -->
            <asp:Button ID="btnRefresh" runat="server"
                Text="Refresh Captcha"
                CssClass="btn btn-refresh"
                OnClick="btnRefresh_Click" />

            <br /><br />

            <!-- CAPTCHA INPUT -->
            <asp:TextBox ID="txtCaptcha" runat="server"
                CssClass="form-control"
                Placeholder="Enter captcha"></asp:TextBox>

            <!-- VERIFY BUTTON -->
            <asp:Button ID="btnVerify" runat="server"
                Text="Verify & Download"
                CssClass="btn btn-main"
                OnClick="btnVerify_Click" />

            <br /><br />

            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

        </div>
    </section>

    <!-- FOOTER -->
    <footer>
        © 2018 Smart File Activity Anomaly Detection | User Panel
    </footer>

</form>

<script src="assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>
