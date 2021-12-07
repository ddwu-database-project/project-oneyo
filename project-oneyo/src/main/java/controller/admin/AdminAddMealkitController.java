package controller.admin;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import controller.Controller;
import model.dao.MealkitDAO;
import model.dto.Category;
import model.dto.Mealkit;
import java.io.File;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

public class AdminAddMealkitController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MealkitDAO mkDAO = new MealkitDAO();
		if (request.getMethod().equals("GET")) {
			List<Category> catList = mkDAO.findAllCategory();
			request.setAttribute("categories", catList);
			return "/admin/addMealkit.jsp";
		}
		
		/*String filename = null;
		String name = null;
		String calorie = null;
		String price = null;
		String fullintro = null;
		String shortintro = null;
		String category = null;
		
		boolean check = ServletFileUpload.isMultipartContent(request);
		
		if(check) {
			ServletContext context = request.getServletContext();
			String path = context.getRealPath("/");
			
//			int idx = path.indexOf(".metadata");
//			path = path.substring(0, idx);
//			path += "project-oneyo/src/main/webapp/assets/img/";
			File dir = new File(path);
			System.out.println("path = "+path);
			
			if(!dir.exists()) dir.mkdir();
			
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(10 * 1024);
                factory.setRepository(dir);
    
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(10 * 1024 * 1024);
                upload.setHeaderEncoding("utf-8");
                                
                List<FileItem> items = (List<FileItem>)upload.parseRequest(request);
                
                for(int i = 0; i < items.size(); ++i) {
                	FileItem item = (FileItem)items.get(i);
                	
                	String value = item.getString("utf-8");
                	
                	if(item.isFormField()) {             		
                		if(item.getFieldName().equals("name")) name = value;
                		else if(item.getFieldName().equals("price")) price = value;
                		else if(item.getFieldName().equals("calorie")) calorie = value;
                		else if(item.getFieldName().equals("fullintro")) fullintro = value;
                		else if(item.getFieldName().equals("shortintro")) shortintro = value;
                		else if(item.getFieldName().equals("category")) category = value;
                	}else {
                		if(item.getFieldName().equals("file")) {
                			filename = item.getName();
                			if(filename == null || filename.trim().length() == 0) continue;
                			filename = filename.substring(filename.lastIndexOf("\\") + 1);
                			File file = new File(dir, filename);
                			item.write(file);
                		}
                	}
                }
                
			}catch(SizeLimitExceededException e) {
				e.printStackTrace();           
            }catch(FileUploadException e) {
                e.printStackTrace();
            }catch(Exception e) {            
                e.printStackTrace();
            }*/
		
		String filename = "";
		int sizeLimit = 15*1024*1024;
		String realPath = request.getServletContext().getRealPath("upload");
		
		File dir = new File(realPath);
		if (!dir.exists()) dir.mkdirs();
		
		MultipartRequest multipartReqeust = null;
		multipartReqeust = new MultipartRequest(request, realPath, sizeLimit, 
				"UTF-8", new DefaultFileRenamePolicy());
		filename = multipartReqeust.getFilesystemName("file");
		
		System.out.println("filename = "+filename);
		System.out.println("realPath = "+realPath);
		System.out.println("name = "+request.getParameter("name"));
		System.out.println("price = "+Integer.parseInt(request.getParameter("calorie")));
		System.out.println("category = "+Integer.parseInt(request.getParameter("category")));
		System.out.println("fullintro = "+request.getParameter("fullintro"));
		System.out.println("shortintro = "+request.getParameter("shortintro"));
		Mealkit mealkit;
		mealkit = new Mealkit(request.getParameter("name"),
				Integer.parseInt(request.getParameter("calorie")),
				Integer.parseInt(request.getParameter("price")),
				new Category(Integer.parseInt(request.getParameter("category"))),
				request.getParameter("fullintro"),
				request.getParameter("shortintro"),
				filename);
		mkDAO.create(mealkit);
		return "redirect:/admin/mealkit/list";
	}

}
