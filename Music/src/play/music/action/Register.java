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

public class Register  extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String name=request.getParameter("nickname");
		HttpSession session = request.getSession();
	    Userdao dao =new Userdaoimpl();
	    User user=new User();
	    User user2=new User();
	    try{
	         user =dao.find(email);
	         user2=dao.findname(name);
	     	  if(user.getEmail()==null&&user2.getName()==null&&name!=null&&email!=null) {
		    	   User user1 =new User(); 
		    	   user1.setEmail(email);
		    	   user1.setName(name);
		    	   user1.setPassword(password);
		    	   dao.add(user1);
		    	   System.out.println("註冊成功");
				   session.setAttribute("user", user1);
				   response.sendRedirect("index.jsp"); 
				   return;
				 }
	     	  else if(user2.getName()==null&&user.getEmail().equals(email)){ 
	    	  String errormsg ="邮箱已被注册！请换个邮箱试试！";
	    	  session.setAttribute("errorlogin",errormsg);
	    	  response.sendRedirect("signup.jsp#register");
	    	  } 
	     	  else if(user.getEmail()==null&&user2.getName().equals(name)){ 
		    	  String errormsg ="昵称已被注册！请换个昵称试试！";
		    	  session.setAttribute("errorlogin",errormsg);
		    	  response.sendRedirect("signup.jsp#register");
		    	  }  
	    
	    	
	    }  catch (Exception e) {
			e.printStackTrace();
			System.out.println("系統出錯register");
		}
		
		
		
	}
  @Test
    public void test() throws Exception{
	     User user=new User();
	     String email="123@123.com";
	     user.setEmail(email);
	     String name="话说别人说我的名字比较长";
	     user.setName(name);
	     String password="keejun";
	     user.setPassword(password);
	     Userdao dao =new Userdaoimpl();
	     dao.add(user);
	     System.out.println("註冊成功");
	  
	  
  }

}
