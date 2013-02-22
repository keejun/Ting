package play.music.action;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.junit.Test;
public class Player extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html"); 
			HttpSession session = request.getSession();
			//String dirPath=request.getParameter("dir");
			  String dirPath="e:\\m\\";
		     List<String> fileTypes =new ArrayList<String>();
		     List<String> filePathList0 = new ArrayList<String>();  
		    String a="mp3";
            String b="wma";
		    fileTypes.add(a);
		    fileTypes.add(b);
			try{
				 Player player=new Player();
			     filePathList0=player.getAllFilePathByDir_FilterByFileType(dirPath, fileTypes);
			     session.setAttribute("files",filePathList0);
	             System.out.println("出来11");
	             System.out.println(filePathList0.size());
	             for(int j=0;j<filePathList0.size();j++){
	            	 System.out.print(filePathList0.get(j));
	             }
	             request.getRequestDispatcher("player.jsp").forward(request, response);
			 
			  } catch (Exception e) {
					e.printStackTrace();
					System.out.println("系統出錯");
				}
			
		}
    public List<String> getAllFilePathByDir_FilterByFileType(String dirPath,  
            List<String> fileTypes) {  
        fileTypes =new ArrayList<String>();
        String a="mp3";
    	String b="wma";
    	fileTypes.add(a);
    	fileTypes.add(b);
        String localClassFilePath = Player.class.getResource("/").getPath();  
        System.out.println(localClassFilePath);  
        String contextFilePath = localClassFilePath.substring(1, localClassFilePath.length()-16);  
        contextFilePath = contextFilePath.replace("/", "\\");  
        System.out.println(contextFilePath);  
        List<String> filePathList = new ArrayList<String>();  
        for (int index = 0; index < fileTypes.size(); index++) {  
            fileList = new ArrayList<String>();  
            List arrayList = Player.getListFiles(dirPath, fileTypes.get(index), true);  
         /*   if (arrayList.isEmpty()) {  
                System.out.println("没有符号要求的文件");  
            } else {  */
                   String message = "";  
                 /*  message += "符号要求的文件数：" + arrayList.size();  
                   System.out.println(message);  */
                for (Iterator i = arrayList.iterator(); i.hasNext();) {  
                    String temp = (String) i.next();  
                    temp = temp.replace(contextFilePath, "");//把根路径去掉  
                    System.out.println(temp);  
                    filePathList.add(temp);  
                    message += temp + "/r/n";  
              //  }  
            }  
        }  
        for (int replaceIndex = 0; replaceIndex < filePathList.size(); replaceIndex++) {  
            filePathList.set(replaceIndex, filePathList.get(replaceIndex).replace("\\", "/"));  
        }  
        return filePathList;  
    }  
  
    public static List<String> fileList = new ArrayList<String>();  
    public static List getListFiles(String path, String suffix, boolean isdepth) {  
        File file = new File(path);  
        return Player.listFile(file, suffix, isdepth);  
    }  
  
    public static List listFile(File f, String suffix, boolean isdepth) {  
        // 是目录，同时需要遍历子目录  
        if (f.isDirectory() && isdepth == true) {  
            File[] t = f.listFiles();  
            for (int i = 0; i < t.length; i++) {  
                listFile(t[i], suffix, isdepth);  
            }  
        } else {  
            String filePath = f.getAbsolutePath();  
  
            if (suffix =="mp3"||suffix=="wma") {  
                int begIndex = filePath.lastIndexOf(".");// 最后一个.(即后缀名前面的.)的索引  
                String tempsuffix = "";  
  
                if (begIndex != -1)// 防止是文件但却没有后缀名结束的文件  
                {  
                    tempsuffix = filePath.substring(begIndex + 1, filePath  
                            .length());  
                }  
  
                if (tempsuffix.equals(suffix)) {  
                    fileList.add(filePath);  
                }  
            } 
  
        }  
  
        return fileList;  
    }
    @Test
     public void test(){
    	Player player =new Player();
    	String dirPath ="e:\\m";
    	String a="mp3";
    	String b="wma";
    	List<String> fileTypes =new ArrayList<String>();
    	fileTypes.add(a);
    	fileTypes.add(b);
        List<String> filePathList= new ArrayList<String>();
        filePathList = player.getAllFilePathByDir_FilterByFileType(dirPath, fileTypes);
        System.out.println(filePathList.size());
        //System.out.println(filePathList);
        
    	
    }
    
}
