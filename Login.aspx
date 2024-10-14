<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default2" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Login</title>
   
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>

    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
  
    <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css"/>
 
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css"/>
  
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css"/>
   
    <link rel="stylesheet" href="bower_components/morris.js/morris.css"/>
  
    <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css"/>
  
    <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"/>
   
    <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css"/>
    
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>

   
    <script type="text/javascript">
        function validation() {
            debugger;
            if (document.getElementById("selectuser").value == "usertype") {
                alert("please select user type!!");
                document.getElementById("selectuser").value.focus();
                return false;
            }
            else if (document.getElementById("userid").value == "") {
                alert("please enter usreid!!");
                document.getElementById("userid").value.focus();
                return false;
            }
            else if (document.getElementById("password").value == "") {
                alert("please enter password!!");
                document.getElementById("password").value.focus();
                return false;
            }
        }
    </script>
    <style>
        body
        {
            background-image:url('images/vote_for_india.jpg'),url('images/Art-of-Living-Blog-vote-for-a-better-India.jpg');
            background-position:left top,right bottom;
            background-repeat:no-repeat;
        }
    </style>
</head>
<body class="hold-transition skin-blue layout-top-nav">
   <header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="" class="navbar-brand"><b>Admin/Voter</b>Login</a>
          
        </div>

        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
     
            <!-- User Account Menu -->
              <li class="dropdown user user-menu">
              <!-- Menu Toggle Button -->
              <a href="../Home.aspx" >Home</a>
             
            </li>
               <li class="dropdown user user-menu">
              <!-- Menu Toggle Button -->
             <a href="../Process.aspx" >Process</a>
             
            </li>
              
            <li class="dropdown user user-menu">
              <!-- Menu Toggle Button -->
              <a href="../Home.aspx" > Logout </a>
             
            </li>
          </ul>
        </div>
        <!-- /.navbar-custom-menu -->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>
    <form id="form1" runat="server">
      
        <div class="login-box">
            <div class="login-logo">
                <a href=""><b>Login</b></a>
            </div>
           
            <div class="login-box-body">
                <p class="login-box-msg">Sign in to start your session</p>

                <form>

                    <div class="form-group">
                        <select class="form-control" name="user" id="selectuser" runat="server">
                            <option value="usertype">Select</option>
                            <option value="ADMIN">ADMIN</option>
                            <option value="VOTER">VOTER</option>

                        </select>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="text" id="userid" class="form-control" placeholder="UserID" runat="server" />

                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" id="password" class="form-control" placeholder="Password" runat="server"/>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>

                    <div class="row">
                      
                         <div class="col-xs-4">

                           </div>
                         <div class="col-xs-4" style="margin-left:100px">
                     
                            <asp:Button ID="btnsignin" runat="server" Text="Sign In" class="btn btn-primary btn-block btn-flat" OnClick="btnsignin_Click" OnClientClick="validation();" />
                        </div>

                        <div class="form-group has-feedback">
                            <label for="msg" id="lblmsg" runat="server"></label>
                        </div>
                      
                    </div>
                </form>

            </div>
          
        </div>
       
         <script src="bower_components/jquery/dist/jquery.min.js"></script>

            <script src="bower_components/jquery-ui/jquery-ui.min.js"></script>
           
            <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
           
            <script src="bower_components/raphael/raphael.min.js"></script>
            <script src="bower_components/morris.js/morris.min.js"></script>
          
            <script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
           
            <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
            <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
          
            <script src="bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
          
            <script src="bower_components/moment/min/moment.min.js"></script>
            <script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
            
            <script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
           
            <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
           
            <script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
           
            <script src="bower_components/fastclick/lib/fastclick.js"></script>
          
            <script src="dist/js/adminlte.min.js"></script>
          
            <script src="dist/js/pages/dashboard.js"></script>
           
            <script src="dist/js/demo.js"></script>
      
            </form>
     
</body>
</html>
