
 
package org.cris;
 
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
 
public class Truffy {
 
    /**
     * JavaProgrammingForums.com
     */
 
    // Path to log file . = application root
    private static String path = "////10.193.0.135//utserrp//Utserrp";
 
    // Log file name
    private static String file = "acdstrancashinfo01042019.HWH.log";
 
    public void getAndReadFile(){
 
          try
          {
          FileInputStream in = new FileInputStream(path + "/" + file);
          BufferedReader br = new BufferedReader(new InputStreamReader(in));
          String strLine;
 
          // Read file line by line
          // Processing would be called here
          while((strLine = br.readLine())!= null)
          {
           System.out.println(strLine);
          }
 
          }catch(Exception e){
           System.out.println(e);
          }
 
    }
 
 
    public static void main(String[] args) {
 
        Truffy t = new Truffy();
        t.getAndReadFile();
 
    }
 
}
