package controller.admin;

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
		ingDAO.removeBase(ingId, mkId);
		return "redirect:/admin/ing/modify?id=" + String.valueOf(mkId);
	}

}
