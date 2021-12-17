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
		IngredientDAO ingDAO = new IngredientDAO();
		if (request.getParameter("mkId") == null) {
			int ingId = Integer.parseInt(request.getParameter("id"));
			ingDAO.remove(ingId);
			return "redirect:/admin/ing/list";
		}
		
		int mkId = Integer.parseInt(request.getParameter("mkId"));
		int ingId = Integer.parseInt(request.getParameter("ingId"));
		String name = request.getParameter("name");
		
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("/");
		int idx = path.indexOf(".metadata");
		path = path.substring(0, idx);
		path += "project-oneyo/project-oneyo/src/main/webapp/assets/img/ingredients";
		File dir = new File(path);
		
		//delete old file
        String oldFile = ingDAO.findIngByName(name);
        String oldPath = dir +  "/" + oldFile;
        File delFile = new File(oldPath);
        if (delFile.exists()) delFile.delete();
        
		ingDAO.removeBase(ingId, mkId);
		return "redirect:/admin/ing/modify?id=" + String.valueOf(mkId);
	}

}
