package play.music.util;
import java.sql.*;

import org.junit.Test;
public class Dbtopic {
    public static Connection getConn(){
    	Connection conn =null;
    	try{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		conn =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kee","198929");		
          	}
    	catch(ClassNotFoundException e){
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
         return conn; 	
      } 
    public static void closeconn(Connection conn){
    	if(conn!=null){
    		try{
    			conn.close();
    		}catch(SQLException e){
				
				e.printStackTrace();
			}
    	}	
    }
 	
}
