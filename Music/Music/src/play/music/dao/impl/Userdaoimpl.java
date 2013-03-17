package play.music.dao.impl;
import play.music.entity.User;
import play.music.dao.Userdao;
import play.music.util.Dbunit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.junit.Test;
public class Userdaoimpl implements Userdao {
	public User find(String email) {
		User user = new User();
		Connection conn = null;
		PreparedStatement stmt =null;
	    ResultSet rs =null;
	    try{
	    	conn = Dbunit.getConn();
	    	stmt =conn.prepareStatement("select * from imuser where email=?");
	    	stmt.setString(1, email);
	    	rs=stmt.executeQuery();
	    	while(rs!=null&&rs.next()){
	    		user.setName(rs.getString("name"));
	    		user.setPassword(rs.getString("password"));	
	    		user.setEmail(rs.getString("email"));
	    	}	
	       }catch (SQLException e) {
				e.printStackTrace();
			} finally {
				Dbunit.closeConn(conn);
			}
		    return user;
	}
	public User findname(String name) {
		User user =new User();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			
			conn = Dbunit.getConn();
			stmt = conn.prepareStatement("select * from imuser where name=?");
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			while(rs!=null&&rs.next()) {
				
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Dbunit.closeConn(conn);
		}
		return user;
	}

	public void add(User user)  {
		Connection conn = null;
		PreparedStatement stmt =null;
		PreparedStatement stmt1 =null;
		ResultSet rs =null;
	   try{
			conn =Dbunit.getConn();
			stmt=conn.prepareStatement("insert into imuser(name,password,email) values(?,?,?)");
			stmt1=conn.prepareStatement("commit");
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getEmail());
			stmt.executeUpdate();
			stmt1.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
		 Dbunit.closeConn(conn);
		}
	}
	

public User findpassword( String email) {
	    User user = new User();
		Connection conn = null;
		PreparedStatement stmt =null;
	    ResultSet rs =null;
	    try{
	    	conn = Dbunit.getConn();
	    	stmt =conn.prepareStatement("select * from imuser where email=? ");
	    	stmt.setString(1, email);
	    	rs=stmt.executeQuery();
	    	while(rs!=null&&rs.next()){
	    		user.setEmail(rs.getString("email"));
	    		user.setName(rs.getString("name"));
	    		user.setPassword(rs.getString("password"));	
	    	}	
	       }catch (SQLException e) {
				e.printStackTrace();
			} finally {
				Dbunit.closeConn(conn);
			}
		    return user;
   }
  @Test
    public void test() {
    	System.out.println(new Userdaoimpl().findpassword("chi1na@china.com") );
    }

}
