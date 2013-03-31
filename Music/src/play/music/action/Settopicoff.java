package play.music.action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import play.music.entity.Topic;
import play.music.entity.User;
import play.music.util.Dbtopic;
import play.music.dao.impl.Topicdaoimpl;
import play.music.dao.Topicdao;
public class Settopicoff extends HttpServlet{
	@SuppressWarnings("unused")
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html"); 
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			
			int alid =Integer.parseInt( request.getParameter("id") );
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			Topicdao dao = new Topicdaoimpl();
			try{
				if(user==null){
					response.sendRedirect("error.jsp");
				}
			  else{
				   String pubren =user.getName();
				   dao.settopicoffline(alid, pubren);
				   response.sendRedirect(basePath+"displaytopic");
				}
				
			}catch(Exception e){
				e.printStackTrace();
				System.out.print("error/setoff");
			}
			
	}
}
