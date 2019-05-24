<%-- 
    Document   : submited
    Created on : 28 Feb, 2019, 10:51:54 AM
    Author     : Dillip Mishra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.cris.ConnectDB"%>
<%@page import="org.cris.QrWeb"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@page import="org.cris.Qrcode"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
             Connection con2 = null;
                        String db2 = "cal_amount";
            String user_type = (String) session.getAttribute("user_type");
            String uid=(String) session.getAttribute("user_id");
            String uname=(String) session.getAttribute("user_name");
            String pwd=(String) session.getAttribute("pwd");
            
            String opid=request.getParameter("opid");
                     String pass=request.getParameter("pass");
                              String pass1=request.getParameter("pass1");
            String pass2=request.getParameter("pass2");
                        con2 = ConnectDB.getDataSource(db2);
                          Statement stmts = con2.createStatement();
                         
                    Statement stmt2 = con2.createStatement();
                         //ResultSet rs2 = stmt2.executeQuery("select op_id, cust_name, concat(manager_first_name,concat(' ',concat(ifnull(manager_middle_name,''),concat(' ',manager_last_name)))), op_details,d.customer_name, c.uname, ord_date, a.remarks from tbl_op_creation a left join tbl_master_manager b on(a.manager=b.manager_code) left join tbl_master_login c on(a.ps_engg=c.uid) left join vareli_sms.tbl_master_customer d on(a.oem=d.id) where a.ps_engg='"+uid+"' order by a.created_on desc");  
                       String sql = "UPDATE tbl_master_login SET pwd='"+pass1+"',modified_by='"+uid+"',modified_on=now() WHERE uid='"+opid+"' and flag='Y'";
                         int i=stmt2.executeUpdate(sql);
                         System.out.println("Updated :"+i);
                       response.sendRedirect("login.jsp?d=reset");

 
        

  %>
