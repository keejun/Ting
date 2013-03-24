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
public class Alltopic  extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		    request.setCharacterEncoding("utf-8");
		    response.setContentType("text/html"); 
		    HttpSession session = request.getSession();
		    String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		    int alid = Integer.parseInt(request.getParameter("id"));
		    Topicdao dao = new Topicdaoimpl();
			List<Topic> topics =new ArrayList<Topic>();
			try{
			   Topic topic=dao.displayques(alid);
				if(topic.getAlid()==0){
					response.sendRedirect("error.jsp");
					return;
				  }
				else
				{
					session.setAttribute("question",topic);
				    topics = dao.display(alid);
				    session.setAttribute("replys",topics);
				    request.getRequestDispatcher("topic.jsp").forward(request, response);
				}
			 }catch(Exception e){
				 e.printStackTrace();
		        System.out.print("1");
			 }    
	}
}
