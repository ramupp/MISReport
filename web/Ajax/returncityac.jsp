<%-- 
    Document   : returncityac
    Created on : Jun 22, 2016, 2:41:07 PM
    Author     : VTPL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="net.ocrt.dao.ConnectDB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>



<%
    //  Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    String db="PSMS";
    con=ConnectDB.getDataSource(db);
    // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "root");
    Statement stmt = con.createStatement();
    
    String city = request.getParameter("startchar");
    String x="";
    
    String sql="select distinct a.op_id from tbl_op_creation a where binary a.op_id like '"+city+"%';";
    
    ResultSet rs=stmt.executeQuery(sql);
    
    while(rs.next())
    {
        
       x=x+rs.getString(1)+",";
 } 
     stmt.close();
    con.close();
    System.out.println(x.substring(0, x.length() - 1));
    out.println(x.substring(0, x.length() - 1));
   
%>

