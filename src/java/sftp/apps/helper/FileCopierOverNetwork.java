package sftp.apps.helper; 
 
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;
 
 
public class FileCopierOverNetwork {
    public static void main(String args[]) {
        String hostname = "10.193.0.135";
        String username = "utserrp";
        String password = "Utserrp";
        String copyFrom = "/ureport/uts/2019/APR/dly/acdstrancashinfo01042019.HWH";
        //String copyTo = "D:/uts_rep.txt"; 
        String copyTo = "D:/Ramu_workspace/MISReport/web/server_file";
        JSch jsch = new JSch();
        Session session = null;
        System.out.println("Trying to connect.....");
        try {
            session = jsch.getSession(username, hostname, 22);
            session.setConfig("StrictHostKeyChecking", "no");
            session.setPassword(password);
            session.connect(); 
            Channel channel = session.openChannel("sftp");
            channel.connect();
            ChannelSftp sftpChannel = (ChannelSftp) channel; 
            sftpChannel.get(copyFrom, copyTo);
            sftpChannel.exit();
            session.disconnect();
        } catch (JSchException e) {
            e.printStackTrace();  
        } catch (SftpException e) {
            e.printStackTrace();
        }
        System.out.println("Done !!");
    }
}