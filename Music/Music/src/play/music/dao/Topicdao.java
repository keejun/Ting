package play.music.dao;
import  play.music.entity.Topic;
import java.util.List;
public interface  Topicdao {
   List<Topic> displaytopic() throws Exception;
   Topic display(int alid) throws Exception;
   void addquestion(String ques,String pubren,String pubtime) throws Exception;
   void addreply(int alid,String reply,String replyren,String replytime) throws Exception;
   void settopicoffline(int alid,String pubren) throws Exception ;
   Topic displaymytopic(String pubren)throws Exception;
   Topic displaymyreply(String replyren)throws Exception;
}
