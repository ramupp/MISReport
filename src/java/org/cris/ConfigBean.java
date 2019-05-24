/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cris;

import java.sql.Connection;

/**
 *
 * @author Dillip Mishra
 */
public class ConfigBean {
    
 
private String ZoneCode;
private String DatabaseServerIP; 
private String DatabaseServerPort;
private String DatabaseName;
private String Username; 
private String Password; 

    public String getZoneCode() {
        return ZoneCode;
    }

    public void setZoneCode(String ZoneCode) {
        this.ZoneCode = ZoneCode;
    }

    public String getDatabaseServerIP() {
        return DatabaseServerIP;
    }

    public void setDatabaseServerIP(String DatabaseServerIP) {
        this.DatabaseServerIP = DatabaseServerIP;
    }

    public String getDatabaseServerPort() {
        return DatabaseServerPort;
    }

    public void setDatabaseServerPort(String DatabaseServerPort) {
        this.DatabaseServerPort = DatabaseServerPort;
    }

    public String getDatabaseName() {
        return DatabaseName;
    }

    public void setDatabaseName(String DatabaseName) {
        this.DatabaseName = DatabaseName;
    }
    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getAttribute(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getCurrentDateYYYYMMDDHHMMSS() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void setAttribute(String tempCon, Connection con) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    

}
    
