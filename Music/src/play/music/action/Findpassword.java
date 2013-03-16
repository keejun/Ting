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
public class Findpassword extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
	 throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String name=request.getParameter("nickname");
		HttpSession session = request.getSession();
	    Userdao dao =new Userdaoimpl();
	    User user=new User();
		try{
			 user =dao.findpassword(email);
			
		   if(user!=null&&user.getEmail()==null&&user.getName()==null){
			 String errorfind ="对不起，您输入的邮箱帐号或昵称有误！";
			 session.setAttribute("findpass", errorfind);
		     response.sendRedirect("mycount.jsp");
			}
		   else if(user!=null&&user.getEmail().equals(email)&&user.getName().equals(name)){
			  System.out.print(user.getPassword());
			  session.setAttribute("user", user);
			  session.setAttribute("findpass","请牢记您的密码: "+ user.getPassword());
			   response.sendRedirect("mycount.jsp");
			  return;
			}
		   else{
			     String errorfind ="对不起，您输入的邮箱帐号或昵称有误！";
				 session.setAttribute("findpass", errorfind);
				 response.sendRedirect("mycount.jsp");
		   }	
		  }
		 catch (Exception e) {
				e.printStackTrace();
				System.out.println("系統出錯");
			}
			
		
		
		
		
	}
	
	@Test
	public void test() {
		    String name="china";
		    String email="china@china.com";
		    Userdao dao =new Userdaoimpl();
		    User user=new User();
		    try {
				user =dao.findpassword(email);
				
			    if(user!=null&&user.getEmail()==null&&user.getName()==null){
				   System.out.println("sorry,cannot find password!");
					
				}
			   else if(user!=null&&user.getEmail().equals(email)&&user.getName().equals(name)){
					System.out.println(user.getPassword());
				}
			   else{
				   System.out.println("sorry,cannot find password!");
			   }
			} catch (Exception e) {
			
				e.printStackTrace();
			}
	}
	
	
	

}
