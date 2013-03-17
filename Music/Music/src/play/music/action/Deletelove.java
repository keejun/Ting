package play.music.action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import play.music.dao.Musicdao;
import play.music.dao.impl.Musicdaoimpl;
public class Deletelove extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html"); 
			String name=request.getParameter("name");
			String musicid=request.getParameter("musicid");
			Musicdao dao =new Musicdaoimpl();
			try{
			   dao.dislove(name, musicid);
			   System.out.println("删除成功");
			  } catch (Exception e) {
					e.printStackTrace();
					System.out.println("系統出錯deletelove");
				}
			
		}

	}
