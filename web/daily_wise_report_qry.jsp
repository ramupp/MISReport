<%-- 
    Document   : daily_wise_report_qry
    Created on : 19 Feb, 2019, 12:18:53 PM
    Author     : Dillip Mishra
--%>


<%@page import="org.cris.ConnectDB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*,java.util.*,javax.mail.*"%>
<%@page import="javax.mail.internet.*,javax.activation.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<%
   
//   // Class.forName("com.mysql.jdbc.Driver");
//    Connection con = null;
//   // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "root");
//     String db="real_marketing";
//    con=ConnectDB.getDataSource(db);
//    Statement stmt = con.createStatement();
 // Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
   // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "root");
     String db="UTSDEV";
   // con=ConnectDB.getDataSource(db);
    Statement stmt = con.createStatement();
    
    Integer id = (Integer) request.getAttribute("id");
    String ZONE = request.getParameter("ZONE");
    String EARNING=(String) request.getParameter("EARNING");
      String TICKET=(String) request.getParameter("TICKET");
    String PASSANGER=(String) request.getParameter("PASSANGER");
      String LOCATION=(String) request.getParameter("LOCATION");
    String TERMINAL=(String) request.getParameter("TERMINAL");
     String NEW_LOCATION = request.getParameter("NEW_LOCATION");
    String EMP_ID=(String) request.getParameter("EMP_ID");
     String MIS_DATE = request.getParameter("MIS_DATE");
    String TXN_TIME=(String) request.getParameter("TXN_TIME");
      String UNSYNC_COUNT=(String) request.getParameter("UNSYNC_COUNT");
    String UNSYNC_LOC=(String) request.getParameter("UNSYNC_LOC");
      String MIS_FLAG=(String) request.getParameter("MIS_FLAG");
   
   
   try{ 
    String sql="INSERT INTO MIS_EARNING(ZONE,EARNING,TICKET,PASSANGER, LOCATION, TERMINAL, NEW_LOCATION, EMP_ID, MIS_DATE, TXN_TIME, UNSYNC_COUNT, UNSYNC_LOC,MIS_FLAG)VALUES('"+ZONE+"','"+EARNING+"',"+TICKET+"','"+PASSANGER+"','"+LOCATION+"','"+TERMINAL+"','"+NEW_LOCATION+"','"+EMP_ID+"','"+MIS_DATE+"','"+TXN_TIME+"','"+UNSYNC_COUNT+"','"+UNSYNC_LOC+"','"+MIS_FLAG+"')";
    System.out.println("hello");
   
   
   int i=stmt.executeUpdate(sql);
   
    if(i>0)
    {
         session.setAttribute("m","yes");
        response.sendRedirect("daily_wise_report.jsp");
        
    }
    else
    {
         session.setAttribute("m","no");
        response.sendRedirect("daily_wise_report.jsp");
    }
  }catch(Exception e)
   {
       System.out.println(e);
       session.setAttribute("m","no");
        response.sendRedirect("daily_wise_report.jsp");}
   finally{

     stmt.close();
     con.close();

   }

  



%>
