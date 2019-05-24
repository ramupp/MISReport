<%-- 
    Document   : daily_wise_report
    Created on : 19 Feb, 2019, 12:05:27 PM
    Author     : Dillip Mishra
--%>
<%@page import="org.cris.MyConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sybase.jdbc3.jdbc.SybDataSource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html>
    <head>


        <title>MIS Report</title>
        <%@include file="includeFiles.jsp" %>


        <meta name="keywords" content="Glossy_Textured Contact Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
        <link href="css/style.css" rel='stylesheet' type='text/css' />

        <!--webfonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,300,600,800,400' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Marvel:400,700' rel='stylesheet' type='text/css'>

        <style>
            p.groove {border-style: groove;}


            table.smallTable{
                border-width: 15px;
                border-color: #fff;
                border-collapse: separate;
                margin-top: 5px;
                color: #fff;
                box-shadow: 10px 10px 10px #000;
                background-image: url('images/ner.jpg');
            }  
            table.smallTable td {
                border-width: 2px;
                border-style: solid;
                border-color: #fff;
                font-size: small;
                color: white;
                text-align: left;
                background-image: url('../images/ner.jpg');
            }  
            table.smallTable th {
                border-width: 2px;
                padding: 4px;
                font-size: medium;
                border-style: solid;
                border-color:  #fff;
                background-image: url('../images/ner.jpg');
                color: wheat;
                width: 300px;
                text-align: left;
            } 
            table.smallTable input[type="text"]{
                border: none;

            }
            table.smallTable select{
                border: none;
                background: none;
            }
            table.smallTable textarea:hover{ color: #fff;}

        </style>
        <style>
            input.text1 {
                outline: none;
                background: none;
                background-image: linear-gradient(#232526,#414345);
                color: #fff;
                width: 50%;
                padding: 10px 10px;
                border: 2px solid#fff;
                font-size: 1em;
                font-weight: 100;
                margin-bottom: 1em;
                float: left;
                border-radius: 10px;
                box-shadow: 5px 5px 5px #000;
            }
            input.text1:hover {
                background: #fff;
                color: #3E4E95;
                transition: 2s all;
                -webkit-transition: 2s all;
                -moz-transition: 2s all;
                -o-transition: 2s all;
            }
            input.text2 {
                outline: none;
                background: none;
                background-image: linear-gradient(#232526,#414345);
                color: #fff;
                padding: 5px 5px;
                border: 2px solid#fff;
                font-size: 1em;
                font-weight: 50;
                margin-bottom: 1em;
                border-radius: 10px;
                box-shadow: 5px 5px 5px #000;
            }
            input.text2:hover {
                background: #fff;
                color: #3E4E95;
                transition: 2s all;
                -webkit-transition: 2s all;
                -moz-transition: 2s all;
                -o-transition: 2s all;
            }
            textarea.text2 {
                outline: none;
                background: none;
                background-image: linear-gradient(#232526,#414345);
                color: #fff;
                width: 100%;
                padding: 10px 10px;
                border: 2px solid#fff;
                font-size: 1em;
                font-weight: 100;
                margin-bottom: 1em;
                float: right;
                border-radius: 10px;
                box-shadow: 5px 5px 5px #000;
            }
            textarea.text2:hover {
                background: none;
                color: #000;
                transition: 2s all;
                -webkit-transition: 2s all;
                -moz-transition: 2s all;
                -o-transition: 2s all;
            }


        </style>
          <script >
            $(function () {
                $(".text").datepicker({dateFormat: 'yy-mm-dd'});
            });
            $(function () {
                var grid = $("#grid-selection").bootgrid({
                    ajax: false,
                    rowCount: [10, 15, -1],
                    columnSelection: false,
                    formatters: {
                        "link": function (column, row)
                        {
                           // return return "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-trash-o\"></span></button> " +
                                                   // "<button type=\"button\" class=\"btn btn-xs btn-default command-show\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-caret-square-o-right\"></span></button>&nbsp &nbsp &nbsp &nbsp " +

                            return   "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-plus-square\"></span></button>&nbsp &nbsp &nbsp &nbsp  " +
                          "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-eye\"></span></button> " ;

                        }
                    }
                }).on("loaded.rs.jquery.bootgrid", function ()
                {
                    /* Executes after data is loaded and rendered */
                    grid.find(".command-edit").on("click", function (e)
                    {
                        var x = $(this).data("row-id").trim();
                        var flg = "add";
                        $.get('Ajax/getUpdateData.jsp', {op_id: x, flag: flg}, function (response) {
                            //alert(response); 
                            document.getElementById("details").style.display = "block";
                            document.getElementById("details").innerHTML = response;
                            $("#details").dialog({
                                open: function (event, ui) {
                                    $(".ui-dialog-titlebar-close", ui.dialog | ui).removeClass("ui-button-icon-only");
                                    $(".ui-button-text", ui.dialog | ui).hide();
                                    $(".ui-widget-header", ui.dialog | ui).css('background-color', '#d34836');
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("margin","0px");
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("text-align","central");
                                }, closeOnEscape: true, modal: true,
                                height: 600, width: 600,
                                show: {
                                    effect: "fold",
                                    //   direction: "up", 
                                    duration: 1000
                                },
                                hide: {
                                    effect: "blast",
                                    primary: "ui-icon-heart",
                                    duration: 1000
                                }});

                        });



                    }).end().find(".command-delete").on("click", function (e)
                   {
                        var x = $(this).data("row-id").trim();
                        var flg = "spec";
                        $.get('Ajax/getUpdateData.jsp', {op_id: x, flag: flg}, function (response) {
                            //alert(response); 
                            document.getElementById("details").style.display = "block";
                            document.getElementById("details").innerHTML = response;
                            $("#details").dialog({
                                open: function (event, ui) {
                                    $(".ui-dialog-titlebar-close", ui.dialog | ui).removeClass("ui-button-icon-only");
                                    $(".ui-button-text", ui.dialog | ui).hide();
                                    $(".ui-widget-header", ui.dialog | ui).css('background-color', '#d34836');
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("margin","0px");
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("text-align","central");
                                }, closeOnEscape: true, modal: true,
                                height: 600, width: 600,
                                show: {
                                    effect: "fold",
                                    //   direction: "up", 
                                    duration: 1000
                                },
                                hide: {
                                    effect: "blast",
                                    primary: "ui-icon-heart",
                                    duration: 1000
                                }});

                        });
                    }).end().find(".command-show").on("click", function (e)
                    {
                        //alert("heyyy");
                        var z = $(this).data("row-id").trim();
                        // alert(z);
                        var flg = "show";
                        //alert("You pressed show on row: " + $(this).data("row-id"));
                        $.get('Ajax/getUpdateData.jsp', {op_id: z, flag: flg}, function (response) {
                            //alert(response); 
                            document.getElementById("details").style.display = "block";
                            document.getElementById("details").innerHTML = response;
                            $("#details").dialog({
                                open: function (event, ui) {
                                    $(".ui-dialog-titlebar-close", ui.dialog | ui).removeClass("ui-button-icon-only");
                                    $(".ui-button-text", ui.dialog | ui).hide();
                                    $(".ui-widget-header", ui.dialog | ui).css('background-color', '#d34836');
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("margin","0px");
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("text-align","central");
                                }, closeOnEscape: true, modal: true,
                                height: 600, width: 600,
                                show: {
                                    effect: "fold",
                                    //   direction: "up", 
                                    duration: 1000
                                },
                                hide: {
                                    effect: "blast",
                                    primary: "ui-icon-heart",
                                    duration: 1000
                                }});

                        });




                    });
                });
            });
        </script>
<!--        <script>
            function digi() {
  var date = new Date(),
      hour = date.getHours(),
      minute = checkTime(date.getMinutes()),
      ss = checkTime(date.getSeconds());

  function checkTime(i) {
    if( i < 10 ) {
      i = "0" + i;
    }
    return i;
  }

if ( hour > 12 ) {
  hour = hour - 12;
  if ( hour == 12 ) {
    hour = checkTime(hour);
  document.getElementById("tt").innerHTML = hour+":"+minute+":"+ss+" AM";
  }
  else {
    hour = checkTime(hour);
    document.getElementById("tt").innerHTML = hour+":"+minute+":"+ss+" PM";
  }
}
else {
  document.getElementById("tt").innerHTML = hour+":"+minute+":"+ss+" AM";;
}
var time = setTimeout(digi,1000);
}
            </script>-->
   <!--Digital Clock-->  
        <style>
 
        #tt {
  font-size:20px;
  font-family: "Raleway";
}
</style>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href="css/jquery.bootgrid.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.bootgrid.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.bootgrid.js" type="text/javascript"></script>
        <script src="js/jquery.bootgrid.min.js" type="text/javascript"></script>
      


    </head>
    <body onload="digi()">
        <p id="tt"></p>
        <div style=" float: left"> <a style="color: #e15960; font-size: x-large; font-family: 'Marvel', sans-serif;" href="list.jsp"><img src="images/back.png"/></a> </div>

    <marquee style="color: #FFF;font-size: xx-large; font-family: 'Audiowide';"><b>Welcome to Daily Report</b></marquee>
    <div class="registration">
        <h2 style="font-family: Audiowide">Daily Report</h2>
        <div class="avtar"><img src="images/color.jpg" /></div>	
        
        
        <div class="form-info">
            <center>

               
        <%
               
                        Connection con =null;
                        Statement st = null;
                       // String qry = "SELECT ZONE_CODE,ZONE_NAME FROM ZONE";
                        String db = "UTSDEV";        		
                         MyConnection ob =new MyConnection();
                         con = ob.getConnection(db);     
                         st = con.createStatement();
                    
                       Statement stmt = con.createStatement();
                    String MIS_DATE = request.getParameter("MIS_DATE");
                    String EARNING = request.getParameter("EARNING");
                    String TICKET = request.getParameter("TICKET");
                    String PASSENGER = request.getParameter("PASSENGER");
                    String LOCATION = request.getParameter("LOCATION");
                    String TERMINAL = request.getParameter("TERMINAL");
                     

                   ResultSet rs = stmt.executeQuery("SELECT convert(varchar(11),MIS_DATE,111) 'DATE', EARNING, TICKET,PASSENGER,LOCATION,TERMINAL  FROM MIS_EARNING ORDER BY MIS_DATE");
                   System.out.println("result is "+rs);
                    %>
                
                <table id="grid-selection" class="table table-condensed table-hover table-striped">

                    <thead>

                        <tr>
<!--                            <td>'<span style="display: none;">' + millisecond + "</span>" + date + </td>-->
<!--                            <th data-column-id="id" data-type="string" data-visible="false">ID</th>-->
                            <th data-column-id="MIS_DATE" data-order="desc" date-formate="YYYY/DD/MM" display="none">DATE</th>
                              <th data-column-id="EARNING" data-order="desc">EARNING</th>
                            <th data-column-id="TICKET" data-order="desc">TICKET</th>
                            <th data-column-id="PASSENGER" data-order="desc">PASSENGER</th>
                            <th data-column-id="LOCATION" data-order="desc">LOCATION</th>
                            <th data-column-id="TERMINAL" data-order="desc">TERMINAL</th>
                          
                            

                        </tr>
                    </thead>
        <tbody>


                        <%while (rs.next()) {
                        %>
                        <tr id="normal_tr">

                            <td><%=rs.getString(1)%>

                            <td><%=rs.getString(2)%>
                                  <td><%=rs.getString(3)%>
                                        <td><%=rs.getString(4)%>
                                              <td><%=rs.getString(5)%>
                                                   <td><%=rs.getString(6)%>
                                                       
                                                   

                        </tr>          
                        <%}%>
                    </tbody>
                   <tbody>
                   
                       </tbody>

                </table>



                <%@include file="StatusPage.jsp" %><br>

                <form action="daily_wise_report_qry.jsp" method="post"  name="myform" onsubmit="return check();"> 
                    <table> 

<!--                        <tr>
                        <td><text  style="color: #FFF; float: left; font-family: Allerta Stencil; font-size: larger;" class="Category">Daily Report:&nbsp;</text></td>
                        <td><input type="text" placeholder="Daily Report" maxlength="45"  class="text2" id="city_name" name="city_name"></td>                         
                        </tr>-->
                    </table> 
                    </div>
<!--                    <table>
                        <tr>
                        <input style="font-family: Allerta Stencil;" type="submit" id="startBtn" value="Submit" /><br><br>
                        </tr>
                    </table>-->
                          </form>            

                <div id="details"    hidden>.....</div>
            </center>
                
        </div>
    </body>
</html>
