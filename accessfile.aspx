<%@ Page Language="C#" AutoEventWireup="true" CodeFile="accessfile.aspx.cs" Inherits="accessfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Access Files | SFAD</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet" />

    <!-- jQuery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#TextBox2').bind('copy paste cut', function (e) {
                e.preventDefault();
            });
        });

        function activate(fileid) {
            location.href = 'accessfile.aspx?fileid=' + fileid;
        }
    </script>

    <!-- 🔹 ADMIN TEMPLATE STYLE -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            padding-top: 70px;
            background: linear-gradient(135deg, #020617, #050f1e);
            color: #ffffff;
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

        .navbar-nav > li > a:hover,
        .navbar-nav > li.active > a {
            color: #00c8ff !important;
            background: transparent;
        }

        /* PAGE HEADER */
        .page-header h1 {
            color: #00c8ff;
            font-weight: 600;
        }

        .page-header p {
            color: #cfd8e3;
            font-size: 14px;
        }

        /* CARD */
        .card {
            background: rgba(10, 20, 40, 0.95);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 25px rgba(0,200,255,0.15);
            margin-top: 25px;
        }

        /* FORM ELEMENTS */
        input, textarea, button {
            color: #000;
        }

        /* CIPHER TEXT BOX FIX */
        #TextBox2 {
            background: #ffffff !important;
            color: #000000 !important;
            border: 2px solid #00c8ff;
            padding: 12px;
            font-family: Consolas, monospace;
            font-size: 14px;
            border-radius: 6px;
            resize: none;
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
                <a class="navbar-brand" href="#">
                    Smart File Activity Anomaly Detection
                </a>
            </div>

            <div class="collapse navbar-collapse" id="menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="viewfiles.aspx">Home</a></li>
                    <li><a href="viewfiles.aspx">View Files</a></li>
                    <li><a href="useraddfile.aspx">Add Files</a></li>
                    <li><a href="userlogin.aspx">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- CONTENT -->
    <div class="container">

        <div class="page-header">
            <h1>Access Secure File</h1>
            <p>Verify OTP and view encrypted file content securely.</p>
        </div>

        <div class="card">

            <!-- OTP SECTION -->
            <table class="table">
                <tr>
                    <td style="width:150px;">Type OTP</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server"
                            Text="Download File"
                            CssClass="btn btn-success"
                            OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button3" runat="server"
                            Text="Get OTP"
                            CssClass="btn btn-info"
                            OnClick="Button3_Click" />
                    </td>
                </tr>
            </table>

            <br />

            <!-- CIPHER TEXT -->
            <asp:TextBox ID="TextBox2" runat="server"
                TextMode="MultiLine"
                Height="350px"
                Width="100%"
                oncopy="return false"
                onpaste="return false"
                oncut="return false">
            </asp:TextBox>

        </div>
    </div>
    <audio id="audioAlert" runat="server" preload="auto">
        <source src="voice.mp3" type="audio/mpeg" />
    </audio>
    <!-- FOOTER -->
    <footer>
        © 2018 Smart File Activity Anomaly Detection | User Panel
    </footer>

</form>

<script src="assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>
