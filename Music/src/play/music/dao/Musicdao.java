package play.music.dao;
import play.music.entity.Music;
import java.util.List;

public interface Musicdao {
    Music findmusic(String name,String musicid) throws Exception ;
	void addlove(Music music) throws Exception;
	void dislove(String name,String musicid) throws Exception;
	List<Music> love(String name) throws Exception;

}
