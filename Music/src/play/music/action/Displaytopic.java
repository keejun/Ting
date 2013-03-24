package play.music.action;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import play.music.entity.Topic;
import play.music.dao.Topicdao;
import play.music.dao.impl.Topicdaoimpl;

public class Displaytopic  extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		    request.setCharacterEncoding("utf-8");
	      	response.setContentType("text/html"); 
	      	HttpSession session = request.getSession();
	      	Topicdao dao =new Topicdaoimpl();
	      	List<Topic> topics = new ArrayList<Topic>();
	      	try{
	      		topics =dao.displaytopic();
	      		session.setAttribute("displaytopics", topics);
	      		request.getRequestDispatcher("group.jsp").forward(request, response);	      		
	      	}catch(Exception e){
	      		e.printStackTrace();
				System.out.println("系統出錯diaplaytopic");
	      	}
		
		
	}
}
