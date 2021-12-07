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

public class AdminModMkController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MealkitDAO mkDAO = new MealkitDAO();
		if (request.getMethod().equals("GET")) {
			int mkid = Integer.parseInt(request.getParameter("id"));		
			Mealkit mealkit = mkDAO.findMealkit(mkid);
			mkDAO = new MealkitDAO();
			mealkit.setIngredients(mkDAO.findMealkitIng(mkid));
			mkDAO = new MealkitDAO();
			List<Category> catList = mkDAO.findAllCategory();
			request.setAttribute("categories", catList);
			
			mealkit.setIngredients(mkDAO.findMealkitIng(mkid));
			request.setAttribute("mealkit", mealkit);

			return "/admin/modifyMealkit.jsp";
		}
		int calculatedCal = Integer.parseInt(request.getParameter("calorie"));
		int calculatedPrice = Integer.parseInt(request.getParameter("price"));
		if(calculatedCal == 0 && calculatedPrice == 0) {
			List<Integer> tmp = mkDAO.calculateCalNPrice(Integer.parseInt(request.getParameter("id")));
			calculatedCal = tmp.get(0);
			calculatedPrice = tmp.get(1);
		}
		
		String filename = null;
		
		boolean check = ServletFileUpload.isMultipartContent(request);
		
		if(check) {
			ServletContext context = request.getServletContext();
			String path = context.getRealPath("/");
			
			int idx = path.indexOf(".metadata");
			path = path.substring(0, idx);
			path += "project-oneyo/src/main/webapp/assets/img/";
			File dir = new File(path);
			
			if(!dir.exists()) dir.mkdir();
			
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(10 * 1024);
                factory.setRepository(dir);
    
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(10 * 1024 * 1024);
                upload.setHeaderEncoding("UFT-8");
                                
                List<FileItem> items = (List<FileItem>)upload.parseRequest(request);
                
                for(int i = 0; i < items.size(); ++i) {
                	FileItem item = (FileItem)items.get(i);
                	
                	
                	if(!item.isFormField()){
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
            }
		}
		
		System.out.println("filename = "+filename);
		Mealkit mealkit = new Mealkit(
				Integer.parseInt(request.getParameter("id")),
				request.getParameter("name"),
				calculatedCal,
				calculatedPrice,
				new Category(Integer.parseInt(request.getParameter("category"))),
				request.getParameter("fullintro"),
				request.getParameter("shortintro"),
				filename);
		mkDAO.update(mealkit);
		return "redirect:/admin/mealkit/list";
	}

}
