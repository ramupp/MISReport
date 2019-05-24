<%-- 
    Document   : get_op_details
    Created on : Dec 6, 2016, 12:19:50 PM
    Author     : VTPL
--%>

<%@page import="net.ocrt.dao.ConnectDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
             Connection con2 = null;
                        String db2 = "PSMS";
                         String user_type = (String) session.getAttribute("user_type");
            String uid=(String) session.getAttribute("user_id");
            String uname=(String) session.getAttribute("user_name");
                        con2 = ConnectDB.getDataSource(db2);
                       
                          String op_id=request.getParameter("op_id");
             Statement stmt2 = con2.createStatement();
                        ResultSet rs2 = stmt2.executeQuery("select op_id, cust_name, concat(manager_first_name,concat(' ',concat(ifnull(manager_middle_name,''),concat(' ',manager_last_name)))), op_details, c.uname, ord_date, remarks from tbl_op_creation a left join tbl_master_manager b on(a.manager=b.manager_code) left join tbl_master_login c on(a.ps_engg=c.uid) where a.op_id='"+op_id+"'");              
                      
 
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <table id="smallTable" class="smallTable">
            <tr>
                <th> Opportunity I.D
                    <th>Customer Name
                        <th>Manager
                            <th>Opportunity Details
                                <th>Engineer Name
                                    <th>Order Date
                                        <th>Remarks(if any)
            </tr>
            <%while(rs2.next()){%>
            <tr>
                <td><%=rs2.getString(1)%>
                    <td><%=rs2.getString(2)%>
                        <td><%=rs2.getString(3)%>
                            <td><%=rs2.getString(4)%>
                                <td><%=rs2.getString(5)%>
                                    <td><%=rs2.getString(6)%>
                                        <td><%=rs2.getString(7)%>
                                            
                                        
                                    
                </tr>
                <%}%>
        </table>
    </body>
</html>
