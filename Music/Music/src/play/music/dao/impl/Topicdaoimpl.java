package play.music.dao.impl;
import play.music.entity.Topic;
import play.music.util.Dbunit;
import play.music.dao.Topicdao;
import java.util.List;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Topicdaoimpl implements Topicdao {

	public List<Topic> displaytopic() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Topic display(int alid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public void addquestion(String ques, String pubren,
			String pubtime) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void addreply(int alid, String reply, String replyren,
			String replytime) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void settopicoffline(int alid, String pubren) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public Topic displaymytopic(String pubren) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Topic displaymyreply(String replyren) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
    
}
