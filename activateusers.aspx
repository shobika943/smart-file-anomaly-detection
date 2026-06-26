<%@ Page Language="C#" AutoEventWireup="true" CodeFile="activateusers.aspx.cs" Inherits="activateusers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Management | SFAD Admin</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet" />

    <!-- Footable -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('[id*=GridView1]').footable();
        });

        function activate(id) {
            location.href = 'activateusers.aspx?id=' + id;
        }
        function deactivate(id) {
            location.href = 'activateusers.aspx?id1=' + id;
        }
    </script>

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

        /* PAGE HEADER */
        .page-header h1 {
            color: #00c8ff;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .page-header p {
            color: #cfd8e3;
            font-size: 14px;
        }

        /* CARD */
        .card {
            background: rgba(10, 20, 40, 0.95);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,200,255,0.12);
            margin-top: 25px;
        }

        /* GRIDVIEW */
        .EU_DataTable {
            width: 100%;
            background: transparent;
            color: #ffffff;
        }

        .EU_DataTable th {
            background: #00c8ff;
            color: #020617;
            text-align: center;
            font-weight: 600;
        }

        .EU_DataTable td {
            background: rgba(255,255,255,0.05);
            color: #ffffff;
            text-align: center;
        }

        .EU_DataTable tr:hover td,
.EU_DataTable tr:active td {
    background-color: #0b3c5d;
    color: #ffffff;
}

        /* ACTION LINKS */
        a.action-activate {
            color: #00ff9c;
            font-weight: 600;
        }

        a.action-deactivate {
            color: #ff6b6b;
            font-weight: 600;
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
                <a class="navbar-brand" href="adminwelcome.aspx">
                
                    Smart File Activity Anomaly Detection
                </a>
            </div>

            <div class="collapse navbar-collapse" id="menu">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="adminwelcome.aspx">Dashboard</a></li>
                    <li class="active"><a href="activateusers.aspx">User Management</a></li>
                    <li><a href="adminviewfiles.aspx">File Monitoring</a></li>
                    <li><a href="report.aspx">Reports</a></li>
                     <li>
    <a href="securityanalytics.aspx">Security Analytics</a>
</li>
                    <li><a href="downloadlogs.aspx">Download Logs</a></li>
                     <li><a href="suspicioususers.aspx">Suspicious Users</a></li>
                    <li><a href="adminlogin.aspx">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- CONTENT -->
    <div class="container">

        <div class="page-header">
            <h1>User Activation & Control</h1>
            <p>
                Manage registered users, control access permissions,
                and prevent unauthorized activity within the SFAD system.
            </p>
        </div>

        <div class="card">

            <asp:GridView ID="GridView1" runat="server"
                CssClass="EU_DataTable footable"
                AutoGenerateColumns="False"
                AllowPaging="True"
                PageSize="6"
                GridLines="None"
                OnPageIndexChanging="GridView1_PageIndexChanging">

                <Columns>
                    <asp:BoundField DataField="userid" HeaderText="User ID" />
                    <asp:BoundField DataField="username" HeaderText="User Name" />
                    <asp:BoundField DataField="address" HeaderText="Address" />
                    <asp:BoundField DataField="phoneno" HeaderText="Phone No" />
                    <asp:BoundField DataField="emailid" HeaderText="Email ID" />
                    <asp:BoundField DataField="status" HeaderText="Status" />

                    <asp:TemplateField HeaderText="Activate">
                        <ItemTemplate>
                            <a href="javascript:activate('<%# Eval("userid") %>')" class="action-activate">
                                Activate
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Deactivate">
                        <ItemTemplate>
                            <a href="javascript:deactivate('<%# Eval("userid") %>')" class="action-deactivate">
                                Deactivate
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

        </div>

    </div>

    <!-- FOOTER -->
    <footer>
        © 2018 Smart File Activity Anomaly Detection | Admin Panel
    </footer>

</form>

<script src="assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>
