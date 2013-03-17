package play.music.dao.impl;
import play.music.entity.Music;
import play.music.util.Dbunit;
import play.music.dao.Musicdao;
import java.util.List;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;



public class Musicdaoimpl implements Musicdao {
    public Music findmusic(String name,String musicid) {
    	Music music =new Music();
		Connection conn = null;
		PreparedStatement stmt =null;
	    ResultSet rs =null;
	    try{
	    	conn = Dbunit.getConn();
	    	stmt =conn.prepareStatement("select * from iminfo where name=? and musicid=?");
	    	stmt.setString(1, name);
	    	stmt.setString(2, musicid);
	    	rs=stmt.executeQuery();
	    	while(rs!=null&&rs.next()){
	    		music.setName(rs.getString("name"));
	    		music.setMusicid(rs.getString("musicid"));
	    		music.setMusicname(rs.getString("musicname"));
	    	}	
	       }catch (SQLException e) {
				e.printStackTrace();
			} finally {
				Dbunit.closeConn(conn);
			}
	      return music;
	}

	public void addlove(Music music){
        Connection conn = null;
		PreparedStatement stmt =null;
		PreparedStatement stmt1 =null;
		ResultSet rs =null;
	   try{
			conn =Dbunit.getConn();
			stmt=conn.prepareStatement("insert into iminfo(name,musicname,musicid) values(?,?,?)");
			stmt1=conn.prepareStatement("commit");
			stmt.setString(1, music.getName());
			stmt.setString(2, music.getMusicname());
			stmt.setString(3, music.getMusicid());
			stmt.executeUpdate();
			stmt1.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
		 Dbunit.closeConn(conn);
		}
	 
	}

	public void dislove(String name, String musicid) {
		    Connection conn = null;
			PreparedStatement stmt =null;
		    ResultSet rs =null;
		    try{
		    	conn = Dbunit.getConn();
		    	stmt =conn.prepareStatement("delete from iminfo where name=? and musicid=?");
		    	stmt.setString(1, name);
		    	stmt.setString(2, musicid);
		    	rs=stmt.executeQuery();
		       }catch (SQLException e) {
					e.printStackTrace();
				} finally {
					Dbunit.closeConn(conn);
				}
		
	}

	public List<Music> love(String name) throws Exception {
		List<Music> musics =new ArrayList<Music>();
	    Connection conn = null;
	    PreparedStatement stmt =null;
	    ResultSet rs =null;
	    try{
	    	conn = Dbunit.getConn();
	    	stmt =conn.prepareStatement("select * from iminfo where name=?");
	    	stmt.setString(1, name);
	    	rs=stmt.executeQuery();
	    	while(rs!=null&&rs.next()){
	    		Music music =new Music();
	    		music.setName(rs.getString("name"));
	    		music.setMusicid(rs.getString("musicid"));
	    		music.setMusicname(rs.getString("musicname"));
	    		musics.add(music);
	    	}	
	       }catch (SQLException e) {
				e.printStackTrace();
			} finally {
				Dbunit.closeConn(conn);
			}
	
		return musics;
	}
	

}
