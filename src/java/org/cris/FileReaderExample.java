/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cris;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.util.Date;
import java.util.Properties;
 import java.io.IOException;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Dillip Mishra
 */
public class FileReaderExample {
    


//public class FileReaderExample {

    public static void main(String args[]) {
        try {
            //opening file for reading in Java
            FileInputStream file = new FileInputStream("D:/uts_rep.WordPad");
            BufferedReader reader = new BufferedReader(new InputStreamReader(file));
          
            //reading file content line by line
            String line = reader.readLine();
            while(line != null){
                System.out.println(line);
                line = reader.readLine();
            }
                  
        } catch (FileNotFoundException ex) {
            Logger.getLogger(CollectionTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(CollectionTest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static class CollectionTest {

        public CollectionTest() {
        }
    }
}


