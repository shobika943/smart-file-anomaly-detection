<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewfiles.aspx.cs" Inherits="viewfiles" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>View Files | SFAD</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet" />

    <!-- Footable -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
          rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            padding-top: 70px;
            background: linear-gradient(135deg, #020617, #050f1e);
            color: #e6edf3;
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
        }

        .page-header h1 {
            color: #00c8ff;
            font-weight: 600;
        }

        .page-header p {
            color: #cfd8e3;
        }

        .card {
            background: rgba(10, 20, 40, 0.95);
            border-radius: 14px;
            padding: 30px;
            box-shadow: 0 0 30px rgba(0, 200, 255, 0.15);
            margin-top: 30px;
        }

        .EU_DataTable {
            width: 100%;
            background: transparent;
            color: #ffffff;
            border-collapse: collapse;
        }

        .EU_DataTable th {
            background: linear-gradient(135deg, #00c8ff, #009fd1);
            color: #020617;
            text-align: center;
            padding: 12px;
        }

        .EU_DataTable td {
            background: rgba(255,255,255,0.05);
            text-align: center;
            padding: 10px;
        }

        .EU_DataTable tr:hover td {
            background-color: #0b3c5d;
        }

        a.view-link {
            color: #00ff9c;
            font-weight: 600;
        }

        footer {
            background: #050f1e;
            color: #9aa7b5;
            text-align: center;
            padding: 15px;
            margin-top: 50px;
        }
    </style>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('[id*=GridView1]').footable();
            $('[id*=GridView2]').footable();
        });

        function activate(fileid) {
            location.href = 'accessfile.aspx?fileid=' + fileid;
        }
    </script>
</head>

<body>
<form id="form1" runat="server">

    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" href="memberhome.aspx">SFAD – User Panel</a>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="memberhome.aspx">Home</a></li>
                <li class="active"><a href="viewfiles.aspx">View Files</a></li>
               
                <li><a href="useraddfile.aspx">Add Files</a></li>
                 <li><a href="MyFileDownloadStats.aspx">Download Stats</a></li>
                <li><a href="userlogin.aspx">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">

        <div class="page-header text-center">
            <h1>View Files</h1>
            <p>Secure file access monitoring</p>
        </div>

        <!-- MY FILES (OTP) -->
        <div class="card table-responsive">
           <h3 style="color:#00c8ff; text-align:center; font-weight:700;">
    My Files </h3>


            <asp:GridView ID="GridView1" runat="server"
                CssClass="EU_DataTable footable"
                AutoGenerateColumns="False"
                AllowPaging="True"
                PageSize="5"
                OnPageIndexChanging="GridView1_PageIndexChanging">

                <Columns>
                    <asp:BoundField DataField="fileid" HeaderText="File ID" />
                    <asp:BoundField DataField="filename" HeaderText="File Name" />
                    <asp:BoundField DataField="uploadedby" HeaderText="Uploaded By" />
                    <asp:BoundField DataField="status" HeaderText="Status" />

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <a href="javascript:activate('<%# Eval("fileid") %>')" class="view-link">
                                View
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>

        <!-- OTHER USERS FILES (CAPTCHA) -->
        <div class="card table-responsive">
            <h3 style="color:#00c8ff; text-align:center; font-weight:700;">
    Other Users’ Files
</h3>


            <asp:GridView ID="GridView2" runat="server"
                CssClass="EU_DataTable footable"
                AutoGenerateColumns="False"
                AllowPaging="True"
                PageSize="5"
                OnPageIndexChanging="GridView2_PageIndexChanging">

                <Columns>
                    <asp:BoundField DataField="fileid" HeaderText="File ID" />
                    <asp:BoundField DataField="filename" HeaderText="File Name" />
                    <asp:BoundField DataField="uploadedby" HeaderText="Uploaded By" />

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <a href='CaptchaVerify.aspx?fileid=<%# Eval("fileid") %>'
                               class="view-link">
                                View / Download
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>

    </div>

    <footer>
        © 2018 Smart File Activity Anomaly Detection | User Panel
    </footer>

</form>

<script src="assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>
