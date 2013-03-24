package play.music.dao;
import  play.music.entity.Topic;
import java.util.List;
public interface  Topicdao {
   List<Topic> displaytopic() throws Exception; //将所有的问题列表显示出来
   Topic displayques(int alid) throws Exception ; //用户点击的某个问题
   List<Topic> display(int alid) throws Exception;//用户点击的某个问题的详细内容
   void addquestion(String ques,String quesinfo,String pubren) throws Exception;//增加问题
   void addreply(int alid,String reply,String replyren) throws Exception;//增加评论
   void settopicoffline(int alid,String pubren) throws Exception ;//发帖人移除帖
   List<Topic>  displaymytopic(String pubren)throws Exception;//查看发帖人发过的帖子
   List<Topic>  displaymyreply(String replyren)throws Exception;//查看发帖人回过的帖子
}
