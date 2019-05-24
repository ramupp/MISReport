<%-- 
    Document   : get_op_details
    Created on : Dec 6, 2016, 12:19:50 PM
    Author     : VTPL
--%>

<%@page import="net.ocrt.dao.ConnectDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%
             Connection con2 = null;
                        String db2 = "PSMS";
                         String user_type = (String) session.getAttribute("user_type");
            String uid=(String) session.getAttribute("user_id");
            String uname=(String) session.getAttribute("user_name");
                        con2 = ConnectDB.getDataSource(db2);
                       String p="";
                          String op_id=request.getParameter("op_id");
                          System.out.println(op_id);
             Statement stmt2 = con2.createStatement();
                        ResultSet rs2 = stmt2.executeQuery("select group_concat(op_details separator ',') from tbl_op_creation a where a.op_id='"+op_id+"' group by a.op_id");              
                      
 while(rs2.next()){
    System.out.println("hahahaha");   
   p=rs2.getString(1);
 }
System.out.println(p);
 out.println(p);
        %>
