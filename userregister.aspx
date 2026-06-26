<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userregister.aspx.cs" Inherits="userregister" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Registration | Smart File Activity Anomaly Detection</title>

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

        /* REGISTER SECTION */
        .register-section {
            min-height: 85vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-card {
            background: rgba(10, 20, 40, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(0, 200, 255, 0.15);
            width: 100%;
            max-width: 520px;
        }

        .register-card h2 {
            margin-bottom: 25px;
            font-weight: 600;
            color: #00c8ff;
            text-align: center;
        }

        table.register-table {
            width: 100%;
        }

        table.register-table td {
            padding: 8px 5px;
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


        .btn-register {
            background: #00c8ff;
            border: none;
            color: #000;
            font-weight: 600;
            width: 100%;
            margin-top: 15px;
        }

        .btn-register:hover {
            background: #00a8d6;
        }

        .login-link {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }

        .login-link a {
            color: #00c8ff;
            text-decoration: none;
        }

        footer {
            background: #050f1e;
            color: #9aa7b5;
            padding: 20px 0;
            text-align: center;
            font-size: 13px;
        }

        .validator {
            color: #ff5c5c;
            font-weight: bold;
            padding-left: 5px;
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
                    <li><a href="adminlogin.aspx">Admin Login</a></li>
                    <li><a href="userlogin.aspx">User Login</a></li>
                    <li class="active"><a href="userregister.aspx">Register</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- REGISTER SECTION -->
    <section class="register-section">
        <div class="register-card">

            <h2>User Registration</h2>

            <table class="register-table">
                <tr>
                    <td>Username</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                    </td>
                    <td class="validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ControlToValidate="TextBox1" ErrorMessage="*" />
                    </td>
                </tr>

                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"
                            TextMode="Password" CssClass="form-control" />
                    </td>
                    <td class="validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="TextBox2" ErrorMessage="*" />
                    </td>
                </tr>

                <tr>
                    <td>Confirm Password</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"
                            TextMode="Password" CssClass="form-control" />
                    </td>
                    <td class="validator">
                        <asp:CompareValidator ID="CompareValidator1"
                            runat="server" ControlToCompare="TextBox2"
                            ControlToValidate="TextBox3" ErrorMessage="*" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" ControlToValidate="TextBox3" ErrorMessage="*" />
                    </td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"
                            TextMode="MultiLine" CssClass="form-control" />
                    </td>
                    <td class="validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            runat="server" ControlToValidate="TextBox6" ErrorMessage="*" />
                    </td>
                </tr>

                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" />
                    </td>
                    <td class="validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            runat="server" ControlToValidate="TextBox4" ErrorMessage="*" />
                    </td>
                </tr>

                <tr>
                    <td>Phone No</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" />
                    </td>
                    <td class="validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                            runat="server" ControlToValidate="TextBox5" ErrorMessage="*" />
                    </td>
                </tr>

                <tr>
                    <td colspan="3">
                        <asp:Button ID="Button1" runat="server"
                            Text="Register" CssClass="btn btn-register"
                            OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>

            <div class="login-link">
                Already have an account?
                <a href="userlogin.aspx">Login here</a>
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
