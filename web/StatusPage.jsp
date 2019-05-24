<%-- 
    Document   : StatusPage
    Created on : Jun 13, 2016, 11:48:43 AM
    Author     : VTPL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title></title>
        <script>
         function myFunction()
          {
              var str= document.getElementById("flip3").innerHTML;
              if(str!=="")
              {
                 // alert(str);
                  $.notify(str, {class:"my-class", delay:0, align:"center", verticalAlign:"middle", blur: 0.8, animationType:"scale"});
              }
               
    } </script>
        
        <style type="text/css">
		
		.my-class{
                    
			background: #FCED8F;
			background: -webkit-linear-gradient(left, #FCED8F 0%, #9F3762 100%);
			background: -ms-linear-gradient(left, #FCED8F 0%, #9F3762 100%);
			background: linear-gradient(to right, #FCED8F 0%, #9F3762 100%);
			color: #fff;
			font-size: 25px;
                        padding-top: 35px; 
                        padding-bottom: 35px;
			text-align: center;
                        border-radius: 10px;
                       
                       
                       
		}
    </style>
    </head>
    <body onload="myFunction()">
       <%
            String m = "" + session.getAttribute("m");// request.getParameter("m");
            if (m.equals("yes")) 
            {  m="Data Submitted Successfully "; %>
         <div id="flip3" style="background-color: #68FCC2; display: none; border-radius: 500px; border-color: #FF1493;border-width: 8px; border-style: ridge; text-align: center; "><%=m%></div>
       <%     } 
            if (m.equals("no"))
            {  m="Data Submission was Unsuccessful  "; %> 
    <div id="flip3" style=" background-color: #68FCC2;display: none; border-radius: 500px; border-color: #FF1493;border-width: 8px; border-style: ridge; text-align: center; "><%=m%></div>
       <%     }
            if (m.equals("null")) 
            {
                m = "";
            } %>
        <% session.setAttribute("m","");%>
     
    </body>
</html>
