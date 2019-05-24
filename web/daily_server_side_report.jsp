<%-- 
    Document   : daily_server_side_report
    Created on : 7 Apr, 2019, 7:03:24 PM
    Author     : Dillip Mishra
--%>



<%@page import="java.io.OutputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.cris.MyConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.cris.FileReaderExample"%>
<!DOCTYPE html>
<html>
    <head>


        <title>MIS Report</title>
        <%@include file="includeFiles.jsp" %>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
pre {
  display: block;
  font-family: monospace;
  white-space: pre;
  margin: 1em 0;
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


        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href="css/jquery.bootgrid.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.bootgrid.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.bootgrid.js" type="text/javascript"></script>
        <script src="js/jquery.bootgrid.min.js" type="text/javascript"></script>
        
<script>
$( function() {
    //call the function on page load
	$( "#datepicker" ).datepicker({  maxDate: 0 });
    //set the date format here
    $( "#datepicker" ).datepicker("option" , "dateFormat", "dd-mm-yy");
   
	} );
 </script>
  <script type="text/javascript">
        $category = $('#zone_name');

        $category.change (
            function() {
                $.ajax({
                    type: "GET",
                    url: "GetProductName",
                    data: {category: $category.attr("selectedIndex") },
                    success: function(data){
                        $("#location_name").html(data)
                    }
                });
            }
        );
    </script>
<script>
    $(document).ready(function() {
        BindControls();
    });

    function BindControls() {
        var Countries = [
            
            'Daily', 
            'Monthly', 
           
            'Periodically'];

        $('#report_type').autocomplete({
            source: Countries,
            minLength: 0,
            scroll: true
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
    }
</script>

    </head>
    <body onload="digi()">
        <p id="tt"></p>
        <div style=" float: left"> <a style="color: #e15960; font-size: x-large; font-family: 'Marvel', sans-serif;" href="list.jsp"><img src="images/back.png"/></a> </div>

    <marquee style="color: #FFF;font-size: xx-large; font-family: 'Audiowide';"><b>Welcome to Server Side Daily Report</b></marquee>
    <div class="registration">
        <h2 style="font-family: Audiowide">Server Side Daily Report</h2>
          <div class="avtar"><img src="images/color.jpg" /></div>		
        <div class="form-info">
            <center>

                

                <%@include file="StatusPage.jsp" %><br>

                <form action="#" method="post"  name="myform" onsubmit="return check();"> 
                    <table> 

                        <tr>
                        <td><text  style="color: #FFFFFF; float: left; font-family: Allerta Stencil; font-size: larger;" class="Category">Zone:&nbsp; </text></td>
                         <td> <div class="md-form">
                        
                        <% 
                        Connection con =null;
                        Statement st = null;
                          Statement st1 = null;
                        String qry = "SELECT ZONE_CODE,ZONE_NAME FROM ZONE";
                        String db = "UTSDEV";        		
                         MyConnection ob =new MyConnection();
                         con = ob.getConnection(db);     
                         st = con.createStatement();
                          st1 = con.createStatement();
                         ResultSet rs =st.executeQuery(qry);
                        
                       %>

                      <select name="zone_name" id="zone_name" class="browser-default form-control" >
                        <option value='0'>---Select Zone---</option>
                        <% 
                        while(rs.next()){
                        %>
                        <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option> 
                        
                        <%
                        
                        } 
                        %>
                      </select>
                    
                             </div></td>
            <td><text  style="color: #FFFFFF; float: left; font-family: Allerta Stencil; font-size: larger;" class="Category">Location&nbsp; </text></td>

                           <td>  <div>
                                   <%
                           String qry1 = "SELECT LOCATION_ID,LOCATION_NAME FROM LOCATION";
                            ResultSet rs1 =st1.executeQuery(qry1);
                      %>
                       <select name="location_nm" id="location_nm" class="browser-default form-control" >
                        <option value='0'>---Select Location---</option>
                        <
                        <% 
                        while(rs1.next()){
                        %>
                        <option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option> 
                        
                        <%
                        
                        } 
                        %>
                      </select>
                               </div></td>

                           <td><text  style="color: #FFFFFF; float: left; font-family: Allerta Stencil; font-size: larger;" class="Category">Select Type:&nbsp;</text></td>

                           <td><input id="report_type" name="report_type" placeholder=" Select Reports">
                                 <!-- <option value="">Select Title</option>
                                 <!--    <option value="">Daily</option>
                                    <option value="">Monthly</option>
                                       <option value="">Periodically</option>
                               </select></td>-->
                       
                        <td><text  style="color: #FFFFFF; float: left; font-family: Allerta Stencil; font-size: larger;" class="Category">Date:</text></td>
                        <td><input type="text" placeholder="Date" maxlength="45"  class="text2" id="datepicker" name="datepicker"></td><br>
                        <td><button style=" margin-bottom: 16px;" type="button" class="btn btn-info">Open</button>
                        
                   
                            </tr>
                        
                    </table> 
                    </div>
 <%--<pre>         
 <%
       
            String jspPath = "D:\\";
            String fileName = "uts_rep.txt";
            String txtFilePath = jspPath + fileName;
             // String fileName = "MISReport\\org.cris\\Properties_file1.txt";
             // String txtFilePath =  fileName;
            BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            //BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String line;

            while((line = reader.readLine())!= null){
                sb.append(line+"\n");
            }
          out.println(sb.toString()); 

 %></pre>--%>
 <pre>
 <%
    
String fileName = "/server_file/ramu.txt";
InputStream ins = application.getResourceAsStream(fileName);
System.out.println("insssss......="+ins);
try
{
if(ins == null)
{
response.setStatus(response.SC_NOT_FOUND);
}
else
{
BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
String data;
while((data= br.readLine())!= null)
{
//out.println(data+"<br>");
    out.println(data);
}
} 
}
catch(IOException e)
{
out.println(e.getMessage());
}
%>
  </pre>
<%--<%

String str = "print me";
//always give the path from root. This way it almost always works.
String nameOfTextFile = "../file/uts_rep.txt";
try {   
    PrintWriter pw = new PrintWriter(new FileOutputStream(nameOfTextFile));
    pw.println(str);
    //clean up
    pw.close();
} catch(IOException e) {
   out.println(e.getMessage());
}
%>--%>
 


     
                    <table>
                        <tr>
<!--                        <input style="font-family: Allerta Stencil;" type="submit" id="startBtn" value="Submit" /><br><br>-->
                        </tr>
                    </table>
                          </form>            

                <div id="details"    hidden>.....</div>
            </center>
                
        </div>
    </body>
</html>
