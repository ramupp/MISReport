<%@page import="net.ocrt.dao.ConnectDB"%>
<%@page import="net.ocrt.dao.QrWeb"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.ocrt.dao.Qrcode"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
    <body>
        <%
         String v_no = request.getParameter("v_no");
         String s = request.getParameter("date1");
         String s2 = request.getParameter("dat2");
         String s3 = request.getParameter("name");
        %>
        
        <div id="container">
            <div id="content">
                <table cellpadding="0" cellspacing="0" width="1000px">
                    <tr>
                        <td align="left">
                            <iframe id="i1" height="590" width="1040" src="/birt-viewer/frameset?__report=emp_entry_dtl_report.rptdesign&oid=<%=v_no%>"></iframe>
                                <div style="display: none;">
                                    <div id="toNewWindow">
                                        <%
                                        String reportUrl = "emp_entry_dtl_report.rptdesign&oid="+v_no;
                                        session.setAttribute("reportUrl", reportUrl);
                                        %>
                                    </div>
                                </div>
                         </td>
                     </tr>
                </table>
                <div style="text-align: right;">
                    <img src="../images/fullscreen.png" width="22px" height="22px" title="Full Screen" onclick="OpenWindow()" id="fullScreen"/>
                    <script>
                        function OpenWindow()
			{
                            window.open("fullScreen.jsp",'popUpWindow','height=700,width=800,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no,status=yes');
                        }
                    </script>
                </div>
            </div>
        </div>       
    </body>
</html>
