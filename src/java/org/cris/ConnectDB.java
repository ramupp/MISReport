/*
 * Created on Mar 5, 2017
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package org.cris;

/**
 * @author Ramu
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import com.sybase.jdbc3.jdbc.SybDataSource;


/**
 *
 * @author shibaji
 */
public class ConnectDB {
    
    private static ConnectDB _INSTANCE =null;
    
    public static ConnectDB getInstance() {
        if (_INSTANCE == null) {
            synchronized (ConnectDB.class) {
                if (_INSTANCE == null) {
                    _INSTANCE = new ConnectDB();
                } // endif
            } // endsyncblock
        }
        return _INSTANCE;
    }
    
    
    
    public Connection getConnectDB() throws Exception{
    	Connection con=null;
    	    	   	
    	try{
            
    		System.out.println("Before Driver loaded");
    		Class.forName("com.sybase.jdbc3.jdbc.SybDriver").newInstance();
                System.out.println("Driver loaded");
                con = DriverManager.getConnection("jdbc:sybase:Tds:10.193.0.145:5000/UTSDEV","sa", "");
                
                
               Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT getdate()");
            while(rs.next()) {
                System.out.println(rs.getObject(1));
            }
                  
           
         }
    	catch(Exception e){
            System.out.println("error");
    		e.printStackTrace();
    		throw e;
    	}



//  try {
//        Class.forName("com.sybase.jdbc3.jdbc.SybDriver").newInstance();
//        String url = "jdbc:sybase:Tds:10.193.0.145:000/UTSDEV";
//        Properties sysProps = System.getProperties();
//        sysProps.put("user", "sa");
//        sysProps.put("password", " ");
//        Connection conn = DriverManager.getConnection(url, sysProps);
//        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
//        //String sql = "select id,name,crdate from dbo.sysobjects where type='U'";
//        String sql = ("select getdate()");
//        ResultSet rs = stmt.executeQuery(sql);
//        while (rs.next()) {
//            System.out.println("oject_id:"+rs.getString(1)+",oject_name:"+rs.getString(2)); 
//        }
//        rs.close();
//        stmt.close();
//        conn.close();
//    } catch (Exception e) {
//        System.out.println(e.getMessage());
//    }
    	
        System.out.println("im in connection");
        return con;
    }
    
    
    public void closeConnection(Connection con){
    	try{
    		if(con!=null)
    			con.close();
            }   catch(SQLException e){
                        e.printStackTrace();
                    }
    }


}
