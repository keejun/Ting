package play.music.dao;
import play.music.entity.User;

public interface  Userdao {
  User find(String email) throws Exception;
  void add(User user) throws Exception;
  User findpassword(String email) throws Exception;
  
  
}
