package play.music.action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;

import play.music.dao.impl.Userdaoimpl;
import play.music.dao.*;
import play.music.entity.User;

public class Login extends HttpServlet {
  
@Override
public void service(HttpServletRequest request, HttpServletResponse response)
       throws ServletException, IOException{
	    request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		HttpSession session = request.getSession();
	    Userdao dao =new Userdaoimpl();
	    User user= new User();
	    try{
	       user= dao.find(email);
	      if(user.getEmail()!=null&&!user.getPassword().equals(password)){
	    	    String errorlogin="用戶名或密码不正確";
	    	    session.setAttribute("errorlogins",errorlogin);
	            System.out.println("密码错误");
				response.sendRedirect("signup.jsp");
				return;
		     }
	     else if (user.getEmail()==null)
	    	  {     
					String errorlogin="用戶名或密码不正確";
					System.out.println(errorlogin);
					session.setAttribute("errorlogins",errorlogin);
					response.sendRedirect("signup.jsp");
					return;
					
				}
	     else if(user!=null&&user.getPassword().equals(password)){
	    	    String errorlogin="登录成功";
				System.out.println(errorlogin);
				session.setAttribute("user", user);
				response.sendRedirect("index.jsp");
		       }
	      }
	      catch (Exception e) {
			e.printStackTrace();
			System.out.println("系統出錯login");
		}
	   
   }
  @Test 
  public void test() {
	    String email="china@china.com";
		String password="keejun";
	     Userdao dao =new Userdaoimpl();
	     User user=new User();
		 try {
			   user= dao.find(email);
			     if(user.getEmail()!=null&&!user.getPassword().equals(password)){
			            System.out.println("密码错误");
				     }
			     else if (user.getEmail()==null)
			    	  {     
							String errorlogin="用戶名不正確";
							System.out.println(errorlogin);
						
							
						}
			     else if(user!=null&&user.getPassword().equals(password)){
			    	    String errorlogin="成功";
						System.out.println(errorlogin);
						
			               }
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("系統出錯");
		}
    	
  }
   
}
