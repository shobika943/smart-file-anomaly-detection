<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="adminlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Login | Smart File Activity Anomaly Detection</title>

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

        .navbar-brand {
    display: flex;
    align-items: center;
    gap: 10px;
}

.nav-logo {
    height: 70px;          /* adjust size if needed */
    width: auto;
}

        .navbar-nav > li.active > a,
        .navbar-nav > li > a:hover {
            color: #00c8ff !important;
            background: transparent;
        }

        /* LOGIN SECTION */
        .login-section {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: rgba(10, 20, 40, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(0, 200, 255, 0.15);
            width: 100%;
            max-width: 420px;
        }

        .login-card h2 {
            margin-bottom: 30px;
            font-weight: 600;
            color: #00c8ff;
        }

        table.login-table {
            width: 100%;
        }

        table.login-table td {
            padding: 10px 5px;
            color: #d0d8e0;
        }

        .form-control {
    background: transparent;          /* keeps background clean */
    border: 2px solid #00c8ff;         /* highlighted border */
    color: #ffffff;                   /* text color */
}

.form-control:focus {
    border-color: #00e5ff;             /* brighter on focus */
    box-shadow: 0 0 6px rgba(0,200,255,0.6);
    outline: none;
}


        .btn-login {
            background: #00c8ff;
            border: none;
            color: #000;
            font-weight: 600;
            width: 100%;
            margin-top: 20px;
        }

        .btn-login:hover {
            background: #00a8d6;
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
                <img src="assets/images/smartlogo1.png" alt="SFAD Logo" class="nav-logo" />
                    Smart File Activity Anomaly Detection
                </a>
            </div>

            <div class="collapse navbar-collapse" id="menu">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active"><a href="adminlogin.aspx">Admin Login</a></li>
                    <li><a href="userlogin.aspx">User Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- LOGIN SECTION -->
    <section class="login-section">
        <div class="login-card text-center">

            <h2>Admin Login</h2>

            <table class="login-table">
                <tr>
                    <td>Username</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Login"
                            CssClass="btn btn-login" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>

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
