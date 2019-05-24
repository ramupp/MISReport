/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cris;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.util.Date;
import java.util.Properties;
 
/**
 * @author Crunchify.com
 * 
 */
 
public class getPropertyValues {
	String result = "";
	InputStream inputStream;
 
	public String getPropValues() throws IOException {
 
		try {
			Properties prop = new Properties();
			//String propFileName = "D:\\Ramu_workspace\\MISReport\\src\\java\\org\\cris\\Properties_file.txt";
                        String propFileName = "org/cris/Properties_file.txt";
                     
                        
                        inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
                        if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
			}
 
			Date time = new Date(System.currentTimeMillis());
 
			// get the property value and print it out
//			String user = prop.getProperty("user");
//			String company1 = prop.getProperty("company1");
//			String company2 = prop.getProperty("company2");
//			String company3 = prop.getProperty("company3");
                        String Username = prop.getProperty("Username");
                        String Password = prop.getProperty("Password");
			String DatabaseServerIP = prop.getProperty("DatabaseServerIP");
			String DatabaseServerPort = prop.getProperty("DatabaseServerPort");
			String DatabaseName = prop.getProperty("DatabaseName");
                        String ZoneCode = prop.getProperty("ZoneCode");
                        
                        
                        
                        
			//result = "Company List = " + company1 + ", " + company2 + ", " + company3;
			//System.out.println(result + "\nProgram Ran on " + time + " by user=" + user);
                        
                        
                        result = "Properties file is = " + DatabaseServerIP + ", " + DatabaseServerPort + ", " + DatabaseName + ", " +ZoneCode;
			System.out.println(result + "\nProgram Ran on " + time + " by Username=" + Username + " Password=" + Password);
                        
                        
                        
                        
                        
		} catch (Exception e) {
			System.out.println("Exception: " + e);
		} finally {
			inputStream.close();
		}
         return result;
	}
}