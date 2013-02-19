package play.music.action;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.net.URLDecoder;
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
			String name=new String(request.getParameter("name").getBytes("iso8859_1"),"utf-8");
			Musicdao dao =new  Musicdaoimpl();
			List<Music> musics = new ArrayList<Music>();
			try{
			     musics = dao.love(name);
			     request.setAttribute("musics", musics);
			  /*  for(int j=0;j<musics.size();j++){
			    	 Music music =(Music)musics.get(j);
			     	 System.out.println(music.getMusicname());
			    }*/
			    request.getRequestDispatcher("collection.jsp").forward(request, response);
			  
			  } catch (Exception e) {
					e.printStackTrace();
					System.out.println("系統出錯diaplaylove");
				}
			
		}

}
