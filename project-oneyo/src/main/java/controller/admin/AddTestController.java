package controller.admin;

import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class AddTestController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("gggggggggggggggggggggg");
		String path = request.getSession().getServletContext().getRealPath("assets");
		System.out.println("path = "+path);
		ServletContext context = request.getServletContext();
		InputStream path2 = context.getResourceAsStream("/WEB-INF/");
		System.out.println("path2 = "+path2);
		
		return "/admin/fileOk.jsp";
	}

}