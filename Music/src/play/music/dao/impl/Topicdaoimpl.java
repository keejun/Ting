package play.music.dao.impl;
import play.music.entity.Topic;
import play.music.util.Dbtopic;
import play.music.dao.Topicdao;
import java.util.List;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Topicdaoimpl implements Topicdao {
    
	public List<Topic> displaytopic() throws Exception {
		List<Topic> topics = new ArrayList<Topic>();
		Connection conn =null;
		PreparedStatement stmt =null;
		PreparedStatement stmt1 =null;
		PreparedStatement stmt2 =null;
	    ResultSet rs =null;
	    ResultSet rs1 =null;
	    ResultSet rs2 =null;
	    try{
	    	conn=Dbtopic.getConn();
	    	stmt=conn.prepareStatement("select * from imques where isonline=1 order by pubtime desc");
	    	rs=stmt.executeQuery();
	    	while(rs!=null&&rs.next()){
	    		Topic topic =new Topic();
	    		topic.setAlid(rs.getInt("alid"));
	    		stmt1=conn.prepareStatement("select count(alid)  replynum  from imreply where alid=?");
	    		stmt1.setInt(1,rs.getInt("alid"));
	    		rs1=stmt1.executeQuery();
	    		while(rs1!=null&&rs1.next()){
	    		topic.setReplynum(rs1.getInt("replynum"));
	    		}
	    	    topic.setScannumber(rs.getInt("scannumber"));
	    		stmt2=conn.prepareStatement("select replytime from (SELECT REPLYTIME from IMREPLY where ALID=? ORDER BY REPLYTIME DESC) where rownum = 1");
	    		stmt2.setInt(1,rs.getInt("alid"));
	    		rs2=stmt2.executeQuery();
	    		while(rs2!=null&&rs2.next()){
	    		topic.setReplytime(rs2.getString("replytime"));
	    		}
	    		topic.setQues(rs.getString("ques"));
	    		topic.setPubtime(rs.getString("pubtime"));
	    		topics.add(topic);
	    	}
	     }catch(SQLException e){
	    	e.printStackTrace();
	     }finally {
	        Dbtopic.closeconn(conn);
	     }
		
		return topics;
	}
    public Topic displayques(int alid) throws Exception{
    	 Topic topic =new Topic();
    	 Connection conn =null;
    	 PreparedStatement stmt =null;
    	 PreparedStatement stmt1 =null;
    	 ResultSet rs =null;
    	 try{
    		 conn=Dbtopic.getConn();
    		 stmt=conn.prepareStatement("select * from IMQUES WHERE IMQUES.ALID =?");
    		 stmt1=conn.prepareStatement("UPDATE imques  SET  scannumber=scannumber+1  WHERE imques.alid = ? ");
    		 stmt.setInt(1, alid);
    		 stmt1.setInt(1, alid);
    		 rs=stmt.executeQuery();
    		 stmt1.executeQuery();
    		 while(rs!=null&&rs.next()){
    	      topic.setAlid(rs.getInt("alid"));
    	      topic.setPubren(rs.getString("pubren"));
    	      topic.setPubtime(rs.getString("pubtime"));
    	      topic.setQues(rs.getString("ques"));
    	      topic.setQuesinfo(rs.getString("quesinfo"));
    		 } 
    	   }finally{
    		   Dbtopic.closeconn(conn);
    	   }
		return topic;
    	
          }
	public List<Topic> display(int alid) throws Exception {
		
		List<Topic> topics= new ArrayList<Topic>();
		Connection conn =null;
		PreparedStatement stmt =null;
		ResultSet rs =null;
		try{
			conn=Dbtopic.getConn();
			stmt=conn.prepareStatement("SELECT REPLY,REPLYREN,REPLYTIME FROM IMREPLY WHERE IMREPLY.ALID =? order by replytime asc ");
			stmt.setInt(1,alid );
			rs=stmt.executeQuery();
			while(rs!=null&&rs.next()){
		    Topic topic = new Topic();	
		    topic.setReply(rs.getString("REPLY"));
			topic.setReplyren(rs.getString("REPLYREN"));
			topic.setReplytime(rs.getString("REPLYTIME"));
			topics.add(topic);
			}
	    	}finally {
	    		 Dbtopic.closeconn(conn);
		}
		
		return topics;
	}

	public void addquestion(String ques, String quesinfo, String pubren) throws SQLException {
		    Connection conn = null;
			PreparedStatement stmt =null;
			PreparedStatement stmt1 =null;
		    try{
		    	conn =Dbtopic.getConn();
		    	stmt=conn.prepareStatement("insert into IMQUES(alid,ques,quesinfo,pubren,pubtime) VALUES (autoid.nextval,?,?,?,sysdate )");
		    	stmt1=conn.prepareStatement("commit");
		    	stmt.setString(1,ques);
		    	stmt.setString(2,quesinfo);
		    	stmt.setString(3,pubren);
		    	stmt.executeUpdate();
				stmt1.executeUpdate();
		       } finally {
		    	   Dbtopic.closeconn(conn);
				}
	    }

	public void addreply(int alid, String reply, String replyren)
			throws Exception {
		    Connection conn = null;
			PreparedStatement stmt =null;
			PreparedStatement stmt1 =null;
		    try{
		    	conn =Dbtopic.getConn();
		    	stmt=conn.prepareStatement("insert into IMREPLY(alid,reply,replyren,replytime) VALUES (?,?,?,sysdate)");
		    	stmt1=conn.prepareStatement("commit");
		    	stmt.setInt(1,alid);
		    	stmt.setString(2,reply);
		    	stmt.setString(3,replyren);
		    	stmt.executeUpdate();
				stmt1.executeUpdate();
		       } finally {
		    	   Dbtopic.closeconn(conn);
				}
		
	}

	public void settopicoffline(int alid, String pubren) throws Exception {
		    Connection conn =null;
		    PreparedStatement stmt =null;
		    try{
		    	 conn =Dbtopic.getConn();
		    	 stmt=conn.prepareStatement("UPDATE imques SET isonline = 0  WHERE alid=? and pubren=? ");
		    
		         stmt.setInt(1,alid);
		         stmt.setString(2, pubren);
		         stmt.executeQuery();
		       
		         }finally{
		    	Dbtopic.closeconn(conn);
		    }
		
	}

	public List<Topic> displaymytopic(String pubren) throws Exception {
		List<Topic> topics= new ArrayList<Topic>();
		Connection conn =null;
		PreparedStatement stmt =null;
		ResultSet rs =null;
		try{
			conn=Dbtopic.getConn();
			stmt=conn.prepareStatement("SELECT * FROM IMQUES WHERE IMQUES.PUBREN =?  and isonline=1");
			stmt.setString(1, pubren);
			rs=stmt.executeQuery();
			while(rs!=null&&rs.next()){
		    Topic topic = new Topic();	
		    topic.setQues(rs.getString("ques"));
			topic.setPubtime(rs.getString("pubtime"));
			topic.setScannumber(rs.getInt("scannumber"));
			topic.setAlid(rs.getInt("alid"));
			topics.add(topic);
			}
	    	}finally {
	    		 Dbtopic.closeconn(conn);
		}
		
		return topics;
	}

	public List<Topic> displaymyreply(String replyren) throws Exception {
		List<Topic> topics= new ArrayList<Topic>();
		Connection conn =null;
		PreparedStatement stmt =null;
		ResultSet rs =null;
		try{
			conn=Dbtopic.getConn();
			stmt=conn.prepareStatement(" select alid,ques,pubtime,scannumber from imques where imques.alid in (SELECT alid FROM IMREPLY WHERE IMREPLY.REPLYREN =? ) and isonline=1");
			stmt.setString(1, replyren);
			rs=stmt.executeQuery();
			while(rs!=null&&rs.next()){
		    Topic topic = new Topic();
		    topic.setAlid(rs.getInt("alid"));
		    topic.setQues(rs.getString("ques"));
			topic.setPubtime(rs.getString("pubtime"));
			topic.setScannumber(rs.getInt("scannumber"));
			topics.add(topic);
			}
	    	}finally {
	          Dbtopic.closeconn(conn);
		}
		
		return topics;
	}

	

    
}
