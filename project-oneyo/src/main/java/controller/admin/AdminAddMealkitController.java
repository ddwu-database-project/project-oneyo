package controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.MealkitDAO;
import model.dto.Category;
import model.dto.Mealkit;

import java.io.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminAddMealkitController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MealkitDAO mkDAO = new MealkitDAO();
		if (request.getMethod().equals("GET")) {
			List<Category> catList = mkDAO.findAllCategory();
			request.setAttribute("categories", catList);
			return "/admin/addMealkit.jsp";
		}
		
		Mealkit mealkit;
		mealkit = new Mealkit(request.getParameter("name"),
				Integer.parseInt(request.getParameter("calorie")),
				Integer.parseInt(request.getParameter("price")),
				new Category(Integer.parseInt(request.getParameter("category"))),
				request.getParameter("fullintro"),
				request.getParameter("shortintro"));
		mkDAO.create(mealkit);
		
		String filename = "";
		int sizeLimit = 15*1024*1024;
		
		String realPath = request.getServletContext().getRealPath("upload");
		
		File dir = new File(realPath);
		if (!dir.exists()) dir.mkdirs();
		
		MultipartRequest multipartRequest = null;
		multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "UTFF-8", new DefaultFileRenamePolicy());
		
		filename = multipartRequest.getFilesystemName("photo");
		System.out.println("filename = " + filename);
		System.out.println("realPath = " + realPath);
		return "redirect:/admin/mealkit/list";
	}

}
