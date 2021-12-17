package controller.admin;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.MealkitDAO;

public class AdminRemoveMkController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MealkitDAO mkDAO = new MealkitDAO();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		//delete old file in img folder
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("/");
		int idx = path.indexOf(".metadata");
		path = path.substring(0, idx);
		path += "project-oneyo/project-oneyo/src/main/webapp/assets/img";
		File dir = new File(path);
        String oldFile = mkDAO.findMealkit(id).getFilename();
        String oldPath = dir +  "/" + oldFile;
        File delFile = new File(oldPath);
        if (delFile.exists()) delFile.delete();
		
		mkDAO.remove(id);
		return "redirect:/admin/mealkit/list";
	}

}
