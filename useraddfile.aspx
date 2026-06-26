<%@ Page Language="C#" AutoEventWireup="true" CodeFile="useraddfile.aspx.cs" Inherits="useraddfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Add Files | SFAD</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- Google Font -->
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
            background: rgba(5, 15, 30, 0.95);
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
        }

        /* CARD */
        .card {
            background: rgba(10, 20, 40, 0.95);
            border-radius: 14px;
            padding: 30px;
            box-shadow: 0 0 30px rgba(0, 200, 255, 0.15);
            margin-top: 30px;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
        }

        /* FORM */
        label {
            color: #cfd8e3;
            font-weight: 500;
        }

        .form-control,
        input[type=file] {
            border: 2px solid #00c8ff;
            border-radius: 6px;
            height: 42px;
        }

        .form-control:focus {
            box-shadow: 0 0 8px rgba(0, 200, 255, 0.6);
            border-color: #00c8ff;
        }

        /* BUTTONS */
        .btn-primary {
            background: #00c8ff;
            border: none;
            font-weight: 600;
        }

        .btn-primary:hover {
            background: #009ecb;
        }

        .btn-default {
            background: transparent;
            color: #ffffff;
            border: 1px solid #ffffff;
        }

        footer {
            background: #050f1e;
            color: #9aa7b5;
            text-align: center;
            padding: 15px 0;
            margin-top: 50px;
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
                <a class="navbar-brand" href="memberhome.aspx">
                    SFAD – User Panel
                </a>
            </div>

            <div class="collapse navbar-collapse" id="menu">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="memberhome.aspx">Home</a></li>
                    <li><a href="viewfiles.aspx">View Files</a></li>
                    <li class="active"><a href="useraddfile.aspx">Add Files</a></li>
                    <li><a href="MyFileDownloadStats.aspx">Download Stats</a></li>
                    <li><a href="userlogin.aspx">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- CONTENT -->
    <div class="container">

        <div class="page-header text-center">
            <h1>Add New File</h1>
            <p>
                Upload files securely for monitoring and anomaly detection.
            </p>
        </div>

        <div class="card">

            <div class="form-group">
                <label>File Name</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Select File</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control"></asp:FileUpload>
            </div>

            <div class="text-center">
                <asp:Button ID="Button1" runat="server" Text="Upload File"
                    CssClass="btn btn-primary"
                    OnClick="Button1_Click" />

                &nbsp;&nbsp;

                <asp:Button ID="Button2" runat="server" Text="Cancel"
                    CssClass="btn btn-default" />
            </div>

        </div>

    </div>

    <!-- FOOTER -->
    <footer>
        © 2018 Smart File Activity Anomaly Detection | User Panel
    </footer>

</form>

<script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>
