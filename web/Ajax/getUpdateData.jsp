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
             int updated=0;
                        String db2 = "PSMS";
                         String user_type = (String) session.getAttribute("user_type");
            String uid=(String) session.getAttribute("user_id");
            String uname=(String) session.getAttribute("user_name");
                        con2 = ConnectDB.getDataSource(db2);
                    String qry="";   
                          String op_id=request.getParameter("op_id");
                          String flg=request.getParameter("flag");
                          if(flg.equals("show")){
                          qry="select op_id, cust_name, group_concat(concat(manager_first_name,concat(' ',concat(ifnull(manager_middle_name,''),concat(' ',manager_last_name)))) separator '-') , ifnull(op_details,'---'),ifnull(d.customer_name,'---'),group_concat( c.uname separator '-'),ifnull(max(ord_date),'---'), ifnull(a.remarks,'---') from tbl_op_creation a left join tbl_master_manager b on(a.manager=b.manager_code) left join tbl_master_login c on(a.ps_engg=c.uid) left join vareli_sms.tbl_master_customer d on(a.oem=d.id) where a.op_id='"+op_id+"' and a.flag='Y' group by a.op_id";
                          }else if(flg.equals("add")){
                           qry="select op_id, cust_name, group_concat( concat(manager_first_name,concat(' ',concat(ifnull(manager_middle_name,''),concat(' ',manager_last_name)))) separator '-'),op_details,d.customer_name, group_concat( c.uname separator '-'),ifnull(max(a.ord_date),'---'),a.remarks,d.id from tbl_op_creation a left join tbl_master_manager b on(a.manager=b.manager_code) left join tbl_master_login c on(a.ps_engg=c.uid) left join vareli_sms.tbl_master_customer d on(a.oem=d.id) where a.op_id='"+op_id+"' and a.flag='Y' group by a.op_id";   
                          }else if(flg.equals("del")){
                           qry="select op_id, cust_name, group_concat( concat(manager_first_name,concat(' ',concat(ifnull(manager_middle_name,''),concat(' ',manager_last_name)))) separator '-'), ifnull(op_details,'---'),ifnull(d.customer_name,'---'), group_concat( c.uname separator '-'),ifnull(a.ord_date,'---'), ifnull(a.remarks,'---') from tbl_op_creation a left join tbl_master_manager b on(a.manager=b.manager_code) left join tbl_master_login c on(a.ps_engg=c.uid) left join vareli_sms.tbl_master_customer d on(a.oem=d.id) where a.op_id='"+op_id+"' and a.flag='Y' group by a.op_id";   
                          }
                          
                        String dt="";   
                          System.out.println("op id is:"+op_id);
             Statement stmt2 = con2.createStatement();
             Statement stmt3 = con2.createStatement();
             
                        ResultSet rs2 = stmt2.executeQuery(qry);   
                           ResultSet rs3 = stmt3.executeQuery("select manager_code,concat(concat(concat(manager_first_name,' '),concat(concat(concat(ifnull(manager_middle_name,' '),' '),manager_last_name),' '))) from tbl_master_manager where flag='Y'");
                      
 System.out.println(qry);
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%if(flg.equals("show")){%>
       
        <text style=" color: black; padding: 10px;"> Details Of <%=op_id%><text>

        <table id="smallTable" class="smallTable">
              <%while(rs2.next()){ System.out.println("i am here");%>
            <tr>
                <th> Opportunity I.D: <td><%=rs2.getString(1)%>
            </tr>  
            <tr><th>Customer Name: <td><%=rs2.getString(2)%>
            </tr>
            <tr><th>Manager: <td><%=rs2.getString(3)%>
            </tr>
            <tr><th>Opportunity Details: <td><%=rs2.getString(4)%>
            </tr> 
            <tr><th>OEM: <td><%=rs2.getString(5)%>
            </tr> 
            <tr><th>Engineer Name: <td><%=rs2.getString(6)%>
            </tr>
            <tr><th>Order Date: <td><%=rs2.getString(7)%>
            </tr>
            <tr><th>Remarks(if any): <td><%=rs2.getString(8)%>
            </tr>
            </table>
          
                <%}%>
      
                <%}else if(flg.equals("add")){%>
         <text style=" color: black; padding: 10px;"> Modify <%=op_id%><text>
         <form name="pq" action="ps_op_creation_qry.jsp" method="post" onsubmit="return checkS()"> 
        <table id="smallTable" class="smallTable">
              <%while(rs2.next()){ System.out.println("i am here111");
             %>
            <tr>
                <th> Opportunity I.D: <td><input type="text" style=" background: none;" id="op_id" name="op_id" value="<%=rs2.getString(1)%>" readonly />
            </tr>  
            <tr><th>Customer Name: <td> <input type="text" style=" background: none;" id="cust_name" name="cust_name" value="<%=rs2.getString(2)%>" readonly />
            </tr>
         
            <tr><th>Existing Manager: <td><%=rs2.getString(3)%>
                   
            </tr>
            <tr><th>Newly Added Manager: <td><select name="manager" >
                        <option style="color: black;" value="">--Select a Manager--</option>
                        <%while (rs3.next()) {%>
                        <option style="color: black;" value="<%=rs3.getString(1)%>"><%=rs3.getString(2)%></option>
                        <% }
                            rs3.close();
                            stmt3.close();
                           // con2.close();
                        %>
                             </select>
                   
            </tr>
             
            <tr><td colspan="2"><text style=" text-align: center;font-size: medium; font-weight: bolder; color: wheat; alignment-adjust: middle;">Opportunity Details:</text><br> <textarea cols="80" rows="2" style=" background: none; border: none; float: left;" id="op_details" name="op_details" readonly ><%=rs2.getString(4)%></textarea>
            </tr>
            <tr><th>OEM Name: <td> <input type="text" style=" background: none;" value="<%=rs2.getString(5)%>" readonly />
           <input type="text" style=" background: none; display: none;" id="oem" name="oem" value="<%=rs2.getInt(9)%>" readonly />
            </tr>
            <tr><th>Existing Engineer Name: <td><%=rs2.getString(6)%>
            </tr>
            <%
            Statement stmt4 = con2.createStatement();
             ResultSet rs4 = stmt4.executeQuery("SELECT uid,uname FROM tbl_master_login t where flag='Y'");
            %>
              <tr><th>New Added Engineer Name: <td>
                      <select name="ps_engg" class="text2">
                        <option style="color: black;" value="">--select a Engineer--</option>
                       <%while (rs4.next()) {%>
                        <option style="color: black;" value="<%=rs4.getString(1)%>"><%=rs4.getString(2)%></option>
                        <% }
                            rs4.close();
                            stmt4.close();
                            //con2.close();
                           
                           
                        %>
                             </select>
            </tr>
            <tr><th>Order Date: <td><input type="text" style=" background: none;" name="ord_date" id="ord_date" value="<%=rs2.getString(7)%>" readonly>
            </tr>
            <tr><td colspan="2"><text style=" text-align: center;font-size: medium; font-weight: bolder; color: wheat; alignment-adjust: middle;">Remarks (If Any):</text><br><textarea  style=" background: none; border: none;" id="remarks" name="remarks" readonly ><%=rs2.getString(8)%></textarea>
            </tr>
   <tr><input type="text" name="del_flag" id="del_flag" value="0" style=" display: none;"></tr>
          <tr>
                       <td colspan="2"><input type="submit" id="startBtn" value="submit" /></td>
                   </tr>
             </table>
                   
                <%}%>
     
             </form>  
                <%}else if(flg.equals("del")){%>
     <text style=" color: black; padding: 10px;">  Delete Details of : <%=op_id%><text>
 <form name="pqr" action="ps_op_creation_qry.jsp" method="post" onsubmit="return checkS()"> 
        <table id="smallTable" class="smallTable">
              <%while(rs2.next()){ System.out.println("i am here");%>
            <tr>
                <th> Opportunity I.D: <td><input type="text" style=" background: none;" id="op_id" name="op_id" value="<%=rs2.getString(1)%>" readonly />
            </tr>  
            <tr><th>Customer Name: <td><%=rs2.getString(2)%>
            </tr>
            <tr><th>Manager: <td><%=rs2.getString(3)%>
            </tr>
            <tr><th>Opportunity Details: <td><%=rs2.getString(4)%>
            </tr> 
            <tr><th>OEM: <td><%=rs2.getString(5)%>
            </tr> 
            <tr><th>Engineer Name: <td><%=rs2.getString(6)%>
            </tr>
            <tr><th>Order Date: <td><%=rs2.getString(7)%>
            </tr>
            <tr><th>Remarks(if any): <td><%=rs2.getString(8)%>
            </tr>
            <tr><input type="text" name="del_flag" id="del_flag" value="1" style=" display: none;"></tr>
            <tr>
                <td colspan="2"><input type="submit" id="startBtn" value="Delete" /></td>
            </tr>
            </table>
          
                <%}%>
 </form>
                <%}%>
    </body>
</html>
