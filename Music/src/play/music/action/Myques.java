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
import play.music.entity.User;
import play.music.dao.Topicdao;
import play.music.dao.Userdao;
import play.music.dao.impl.Topicdaoimpl;
import play.music.dao.impl.Userdaoimpl;
public class Myques extends HttpServlet {
	@SuppressWarnings("unused")
	public void service(HttpServletRequest request, HttpServletResponse response)
		       throws ServletException, IOException{
			    request.setCharacterEncoding("utf-8");
				response.setContentType("text/html");
				HttpSession session = request.getSession();
			    User user= (User)session.getAttribute("user");
			    Topicdao dao =new Topicdaoimpl();
			    List<Topic> mytopics = new ArrayList<Topic>();
			    try{
			       if(user!=null){
			        String pubren =user.getName();   
			       mytopics=dao.displaymytopic(pubren);
			       session.setAttribute("mytopics",mytopics);
			       request.getRequestDispatcher("mytopic.jsp").forward(request, response);	
			       }
			     else{
			    	    response.sendRedirect("signup.jsp");
			    	    return;
			       }
			      } catch(Exception e){
			    	  e.printStackTrace();
			    	  System.out.print("error/mypub");
			      }
			    
				
				
       	}

}
