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

public class AdminAddMealkitController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = null;
		String id = null;
    	String calorie = null;
    	String price = null;
    	String category = null;   
    	String fullintro = null;
    	String shortintro = null;
    	String filename = null;
    	
		MealkitDAO mkDAO = new MealkitDAO();
		if (request.getMethod().equals("GET")) {
			List<Category> catList = mkDAO.findAllCategory();
			request.setAttribute("categories", catList);
			return "/admin/addMealkit.jsp";
		}
		
		boolean check = ServletFileUpload.isMultipartContent(request);
		
		if(check) {
			
			ServletContext context = request.getServletContext();
			String path = context.getRealPath("/");
			int idx = path.indexOf(".metadata");
			path = path.substring(0, idx);
			path += "project-oneyo/project-oneyo/src/main/webapp/assets/img";
			File dir = new File(path);
			System.out.println("path = "+path);
			
			if(!dir.exists()) dir.mkdir();
			
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(10 * 1024);
                factory.setRepository(dir);
    
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(10 * 1024 * 1024);
                upload.setHeaderEncoding("UTF-8");
                                
                List<FileItem> items = (List<FileItem>)upload.parseRequest(request);
                
                for(int i = 0; i < items.size(); ++i) {
                	FileItem item = (FileItem)items.get(i);
                	
                	String value = item.getString("UTF-8");
                	
                	if(item.isFormField()) {             		
                		if(item.getFieldName().equals("name")) name = value;
                		else if(item.getFieldName().equals("id")) id = value;
                		else if(item.getFieldName().equals("calorie")) calorie = value;
                		else if(item.getFieldName().equals("price")) price = value;
                		else if(item.getFieldName().equals("category"))category = value;
                		else if(item.getFieldName().equals("fullintro")) fullintro = value;
                		else if(item.getFieldName().equals("shortintro")) shortintro = value;
                	}
                	else {
                		if(item.getFieldName().equals("file")) {                           
                			filename = item.getName();
                			if(filename == null || filename.trim().length() == 0) continue;
                			filename = filename.substring(filename.lastIndexOf("\\") + 1);
                			File file = new File(dir, filename);
                			if (!file.exists()) item.write(file);
                		}
                	}
                }
                               
			}catch(SizeLimitExceededException e) {
				e.printStackTrace();           
            }catch(FileUploadException e) {
                e.printStackTrace();
            }catch(Exception e) {            
                e.printStackTrace();
            }
            
		}		
		
		Mealkit mealkit;
		mealkit = new Mealkit(name,
				Integer.parseInt(calorie),
				Integer.parseInt(price),
				new Category(Integer.parseInt(category)),
				fullintro,
				shortintro,
				filename);
		mkDAO.create(mealkit);
		return "redirect:/admin/mealkit/list";
	}

}
