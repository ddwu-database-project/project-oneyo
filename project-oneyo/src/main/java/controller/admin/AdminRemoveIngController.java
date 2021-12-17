package controller.admin;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.IngredientDAO;

public class AdminRemoveIngController implements Controller {	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("/");
		int idx = path.indexOf(".metadata");
		path = path.substring(0, idx);
		path += "project-oneyo/project-oneyo/src/main/webapp/assets/img/ingredients";
		File dir = new File(path);
		
		IngredientDAO ingDAO = new IngredientDAO();
		
		if (request.getParameter("mkId") == null) {
			int ingId = Integer.parseInt(request.getParameter("id"));
			String oldFile = ingDAO.findIngFileById(ingId).getFilename();
	        String oldPath = dir +  "/" + oldFile;
	        File delFile = new File(oldPath);
	        if (delFile.exists()) delFile.delete();
			ingDAO.remove(ingId);
			return "redirect:/admin/ing/list";
		}
		
		int mkId = Integer.parseInt(request.getParameter("mkId"));
		int ingId = Integer.parseInt(request.getParameter("ingId"));        
		ingDAO.removeBase(ingId, mkId);
		return "redirect:/admin/ing/modify?id=" + String.valueOf(mkId);
	}

}
