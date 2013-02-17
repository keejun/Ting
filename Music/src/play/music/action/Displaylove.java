package play.music.action;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import play.music.util.*;
import play.music.dao.Musicdao;
import play.music.dao.impl.Musicdaoimpl;
import play.music.entity.Music;

public class Displaylove extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html"); 
			String name=request.getParameter("name");//实际为邮箱
			Musicdao dao =new  Musicdaoimpl();
			List<Music> musics = new ArrayList<Music>();
			try{
			     musics = dao.love(name);
			     request.setAttribute("musics", musics);
			  } catch (Exception e) {
					e.printStackTrace();
					System.out.println("系統出錯diaplaylove");
				}
			
		}

}
