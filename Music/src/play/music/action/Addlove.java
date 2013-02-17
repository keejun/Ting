package play.music.action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.Test;
import play.music.util.*;
import play.music.dao.*;
import play.music.dao.impl.Musicdaoimpl;
import play.music.entity.Music;
public class Addlove extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html"); 
		String name=request.getParameter("name");
		String musicname=request.getParameter("musicname");
		String musicid=request.getParameter("musicid");
		Musicdao dao =new Musicdaoimpl();
		Music music =new Music();
		try{
		    music =dao.findmusic(musicname, musicid);
		    if(music.getName()==null&&name!=null){
		    	Music music1=new Music();
		    	music1.setMusicid(musicid);
		    	music1.setName(name);
		    	music1.setMusicname(musicname);
		    	dao.addlove(music1);
		        System.out.println("添加成功");
		    }
		    else if(music!=null&&music.getMusicid().equals(musicid)&&music.getName().equals(name)){
		    	  String added ="已在您的收藏中";
		    	  System.out.println(added);
		        } 
		  } catch (Exception e) {
				e.printStackTrace();
				System.out.println("系統出錯addlove");
			}
		
	}

}
