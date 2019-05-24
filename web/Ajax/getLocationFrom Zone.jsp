<%-- 
    Document   : getLocationFrom Zone
    Created on : 11 Apr, 2019, 10:48:23 PM
    Author     : Dillip Mishra
--%>

<%@page import="org.cris.MyConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

                        Connection con =null;
                        Statement st = null;
                        String qry = "SELECT ZONE_CODE,ZONE_NAME FROM ZONE";
                        String db = "UTSDEV";        		
                        MyConnection ob =new MyConnection();
                        con = ob.getConnection(db);     
                        st = con.createStatement();
                        ResultSet rs =st.executeQuery(qry);
                        
                        //  ResultSet rs = st.executeQuery("SELECT ZONE_CODE,ZONE_NAME FROM ZONE");              
%>

<%--<%
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
%>--%>
