<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updatedfiles.aspx.cs" Inherits="updatedfiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta name="viewport" content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0, user-scalable = no" />
   <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=GridView1]').footable();
        });
    </script>
     <script language="javascript" type="text/javascript">
         function activate(fileid) {
             location.href = 'updatedfiles.aspx?fileid=' + fileid;
         }
       
</script>
    <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">-->

        <link rel=Stylesheet href=responsive.css />

        <!--For Plugins external css-->
        <link rel="stylesheet" href="assets/css/plugins.css" />

        <!--Theme custom css -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="assets/css/responsive.css" />

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <style type="text/css">
        .style1
        {
            width: 45%;
        }
        .style2
        {
            width: 10px;
        }
    </style>

     <script language="javascript" type="text/javascript">
         function activate(fileid) {
             location.href = 'updatedfiles.aspx?fileid=' + fileid;
         }
       
</script>
</head>
<body data-spy="scroll" data-target="#main-navbar">
    <form id="form1" runat="server">
    <div>
    <div class='preloader'><div class='loaded'>&nbsp;</div></div>
        <div id="menubar" class="main-menu">	
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.html"></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                              <li class="active"><a href="adminwelcome.aspx">Home</a></li>
                            <li><a href="activateusers.aspx">User Details<span class="sr-only">(current)</span></a></li>
                            <li><a href="addfiles.aspx">Add Files</a></li>
                            <li><a href="updatedfiles.aspx">Updated Files</a></li>
                            <li><a href="authorizedusers.aspx">Authorized Files</a></li>
                            <li><a href="report.aspx">Report</a></li>
                            <li><a href="adminlogin.aspx">Logout</a></li>
                           
                            <div class="contact-number text-right"> 
                                <ul><li class=""></li></ul>
                                 
                            </div>

                        </ul>
                        <asp:Label ID="Label4" runat="server" Text="Smart File Activity Anomaly Detection" Font-Size=XX-Large></asp:Label>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
        <!--Home page style-->
        <header id="home" class="sections">
            <div class="container">

                <div class="row">
                    <div class="homepage-style">

                        <div class="top-arrow hidden-xs text-center"><img src="assets/images/top-arrow.png" alt="" /></div>

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="unique-apps">
                                <h2>An Efficient Security Model <br>In Health Care</h2>
                                <p>
                                    Designing an effective and secure group-oriented access control for mobilecloud storage services is an area of active research
                                    For example, such schemes should provide user-friendly features that allow group members to be conveniently added or removed, privileges of group members to be assigned
                                </p>

                                <div class="home-btn"><button class="btn btn-primary">View More <span><i class="fa fa-paper-plane"></i></span></button></div>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="slider-area">

                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000">
                                    <!-- Indicators -->
                                    <ol class="carousel-indicators">
                                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>

                                    </ol>

                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner" role="listbox">

                                        <div class="item active">
                                            <img src="assets/images/slider-img.png" alt="" />
                                        </div>

                                        <div class="item">
                                            <img src="assets/images/slider-img.png" alt="" />
                                        </div>

                                        <div class="item">
                                            <img src="assets/images/slider-img.png" alt="" />
                                        </div>

                                        <div class="item">
                                            <img src="assets/images/slider-img.png" alt="" />
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>	
                </div>

            </div>

        </header>

        <!-- Sections -->
       

        <section id="works-area" class="sections">
            <div class="container text-center">
            <asp:Label ID="Label1" runat="server" Text="File Updated Users" Font-Bold="True" 
                    Font-Names="Arial" Font-Size="13px" style=" text-align:justify" ></asp:Label>


                <br />
               
                <br />
                <div class="EU_TableScroll" id="showData" style="display: block">
                 <asp:GridView ID="GridView1" runat="server" CssClass="EU_DataTable" Style="max-width: 500px" BackColor="White" AutoGenerateColumns="False"
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="662px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged1" Height="148px" 
                    OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" 
       PageSize="3" GridLines="Vertical" >
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                     <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="fileid" HeaderText=" File ID" />
                <asp:BoundField DataField="filename" HeaderText="File Name" />
                  <asp:BoundField DataField="updateduser" HeaderText="Updated User" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="DateofUpdation" HeaderText="Date Of Updation" />
       <asp:TemplateField HeaderText="Download">
                 <ItemTemplate>
                    <a href="javascript:activate('<%# DataBinder.Eval(Container.DataItem,  "fileid")%>')" >Download</a>
                      </ItemTemplate>
             </asp:TemplateField>
             </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#0000A9" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        </div>
      <%--  <asp:DetailsView ID="DetailsView1" runat="server" Width="125px" Height="50px"></asp:DetailsView>--%>
               <%-- <div class="heading">
                    <div class="title text-center arrow-left">
                        <img class="hidden-xs" src="assets/images/left-arrow.png" alt="" />

                        <h4 class="">HOW WE WORKS </h4>
                    </div>
                </div>	

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="main-works">
                            <img src="assets/images/map.png" alt="" />
                        </div>
                    </div>
                </div>	
            </div>--%>
        </section>

    


  

       

        <!--Footer-->
      <%--  <footer id="footer" class="footer">
            <div class="container">

                <div class="row">
                    <div class="main-footer">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2></h2>
                                <ul>
                                    <li><a href="#">Admin Login</a></li>
                                    <li><a href="#">User Login</a></li>
                                   
                                </ul>
                            </div>
                        </div>

                                             

                      
                    <div class="socio-copyright">

                        <div class="social">
                            <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                            <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                            <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                            <a target="_blank" href="#"><i class="fa fa-linkedin"></i></a>
                        </div>

                        <p>Made with <i class="fa fa-heart"></i> by <a target="_blank" href="#">copyrights </a>2018. All rights reserved.</p>
                    </div>

                </div>	
            </div>

        </footer>--%>


        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>

        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
    </div>
    </form>
</body>
</html>
