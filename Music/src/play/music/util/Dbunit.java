package play.music.util;
import java.sql.*;

public class Dbunit {
	public static Connection getConn(){
		Connection conn=null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sys as sysdba","198929");
		    }
		catch(ClassNotFoundException e){
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;	
			
         }
	
	 public static void closeConn(Connection conn){
		 if(conn!=null){
			 try{
				 conn.close();
			    }
			 
			catch(SQLException e){
				
				e.printStackTrace();
			}
			 
		 }
		 
  	 }
	public static void main(String args[]){
		
		System.out.println(Dbunit.getConn());
		
	}
		
	}

