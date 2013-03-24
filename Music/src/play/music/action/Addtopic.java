package play.music.action;
import java.io.IOException;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import play.music.entity.User;
import play.music.entity.Topic;
import play.music.dao.Topicdao;
import play.music.dao.impl.Topicdaoimpl;
public class Addtopic  extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html"); 
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			HttpSession session = request.getSession();
			String ques = request.getParameter("ques");
			String quesinfo=request.getParameter("quesinfo");
			User user = (User)session.getAttribute("user");
		    String pubren = user.getName();
			 
			Topicdao dao = new Topicdaoimpl();
			
			try{
				dao.addquestion(ques, quesinfo, pubren);
				response.sendRedirect(basePath+"displaytopic");
			}catch(Exception e){
				e.printStackTrace();
			    System.out.println("系統出錯addtopic");
			}
			
	}
}
