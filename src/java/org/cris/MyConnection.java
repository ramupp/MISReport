package org.cris;

import java.sql.*;

import java.sql.SQLException;

public class MyConnection {
	public Connection con=null;
	
	public Connection getConnection(String db)
	{
		try{
		  Class.forName("com.sybase.jdbc3.jdbc.SybDriver");
     // con = DriverManager.getConnection("jdbc:mysql://192.168.1.232:3306/"+db, "root", "root");
		 con = DriverManager.getConnection("jdbc:sybase:Tds:10.193.0.145:5000/UTSDEV","sa", "");
		 System.out.println("connection is"+con);
       return con;
		}catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("error");
			return null;
		}

		
	}
	
	public void disconnect()
	{
		
		try {
			this.con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ResultSet getResultSet(String qry,String db)
	{
		ResultSet resultSet=null;
	try {
		Statement st= this.getConnection(db).createStatement();
		resultSet=st.executeQuery(qry);
		//this.disconnect();
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	return resultSet;	
	
	}
	
	public static void main(String a[])
	{
		System.out.println("inside main");
		MyConnection ob =new MyConnection();
		Connection con=null;
		con=ob.getConnection("db");
		try {
			Statement st = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("connection" +con);
	}
	
//	public String getPath()
//	{
//		ResultSet resultSet=null;
//	try {
//		Statement st= this.getConnection("adm_retail").createStatement();
//		resultSet=st.executeQuery("select * from tbl_master_setup where property_name='upload' and active='Y'");
//		//this.disconnect();
//		resultSet.next();
//		return resultSet.getString(3);	
//		
//	} catch (SQLException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//		return null;
//	}	
//
//	
//	}
//	public String getBarcodePath()
//	{
//		ResultSet resultSet=null;
//	try {
//		Statement st= this.getConnection("adm_retail").createStatement();
//		resultSet=st.executeQuery("select * from tbl_master_setup where property_name='barcode' and active='Y'");
//		//this.disconnect();
//		resultSet.next();
//		return resultSet.getString(3);	
//		
//	} catch (SQLException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//		return null;
//	}	
//
//	
//	}

}
