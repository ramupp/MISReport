<%@page import="org.cris.ConnectDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<head>

    
<title>Welcom MIS Report</title>
<!-- Meta tag Keywords -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Classic Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Meta tag Keywords -->

        <!-- css files -->
        <link rel="stylesheet" href="css/style_n1.css" type="text/css" media="all" /> <!-- Style-CSS --> 
        <link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
       
        <!-- //css files -->

        <!-- js -->
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!-- //js -->

        <!-- online-fonts -->
        <link href="//fonts.googleapis.com/css?family=Oleo+Script:400,700&amp;subset=latin-ext" rel="stylesheet">
        <!-- //online-fonts -->
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <script type="application/x-javascript"> 
            
 
      function check()
       {
           var x=document.login.unm.value;
           var z=document.login.pwd.value;
           var w=document.login.org.value;
           var a=document.login.lnm.value;
           
           if(x=="" || x=="username" )
           {
              document.getElementById("text1").style.visibility="visible"; 
               return false;     
           }
           
           else if(z==""||z=="password")
           {
              document.getElementById("text2").style.visibility="visible"; 
               return false; 
           }
           else if(w==""||w=="--organization--")
           {
              document.getElementById("text3").style.visibility="visible"; 
               return false; 
           }
           else if(a==""||a=="--location--" )
           {
              document.getElementById("text4").style.visibility="visible"; 
               return false; 
           }         
       }
</script>
<link href="https://fonts.googleapis.com/css?family=Audiowide" rel="stylesheet">

<script>
        function viewPass(str){
        var x=document.getElementById("showp").innerHTML;  
      //  alert(x);
        if(x=='Show Password')
        {
          document.getElementById("pwd").type='text';  
          document.getElementById("showp").innerHTML="Hide Password";  
        }
        else
        {
            document.getElementById("pwd").type='password';
            document.getElementById("showp").innerHTML="Show Password"; 
        }   
           }
        function getval(str) {
        var xhttp; 
        var xhttp1;
        if (str == "") {
            document.getElementById("org").innerHTML = "";
            document.getElementById("lnm").innerHTML = "";
            return;
        }
        xhttp = new XMLHttpRequest();
        xhttp1= new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("org").innerHTML = xhttp.responseText;
        }
        };
        xhttp1.onreadystatechange = function() {
        if (xhttp1.readyState == 4 && xhttp1.status == 200) {
            document.getElementById("lnm").innerHTML = xhttp1.responseText;
        }
        };
        xhttp.open("GET", "returnorg.jsp?q="+str, true);
        xhttp.send();
        xhttp1.open("GET", "returnloc.jsp?p="+str, true);
        xhttp1.send();
        }
</script>
</head>
<body>

    <%            
            String d = "" + request.getParameter("d");
            if (d.equals("yes")) 
            {
                d = "Logout successfully";
            } 
            if (d.equals("no")) 
            {
                d = "Invalid Login";
            } 
            if(d.equals("null"))
            {
                d="";
            }
            if(d.equals("reset"))
            {
                d="Your Password Has been Changed Successfully. Please Login Again";
            }
        %>
    <script src="js/jquery.vide.min.js"></script>
        <div data-vide-bg="video/Ipad.mp4">
            <div class="center-container">
                <div class="header-w3l"><h1>UTS MIS Report</h1></div>			
                <div class="main-content-agile">
                    <div class="sub-main-w3">	
                        <div class="wthree-pro"><h2>Login Here</h2></div>
                        
                        <form name="login" action="#" method="post" onsubmit="return check();">
                                <input placeholder="Username" name="unm" class="text" type="text" required="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'username';}" onchange="getval(this.value);">
                                <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span><br><br>
                                <input id="pwd"  placeholder="Password" name="pwd" class="text1" type="password" required="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}">
                                <span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span><p onclick="viewPass(this.value);" value="A"><a href="#"><text id="showp" style=" font: 100; font-family: sans-serif; font-weight: bold; color: wheat; font-style: italic;">Show Password</text></a></p><br>
                                 <div style="color: aqua;font-weight: bolder;"><b><%=d%></b></div>
                                <div class="sub-w3l">
                                    <div class="right-w3l">
					<input type="submit" value="Submit" onClick="JavaScript:window.location='list.jsp'" value="button" class="cancelbtn">
                                    </div>
				</div>
                            </form>

                    </div>
		</div>
		<div class="footer">
                    <text style="font-size: 12px; font-family: sans-serif; color: #fff">Copyright &copy; 2017 <a style=" color: #fff; text-decoration: underline;"href="http://cris.org.in/criswebsite/crissite/index.jsp">Central Railway for Information System</a></text>
		</div>			
            </div>
	</div>
</body>
</html>
