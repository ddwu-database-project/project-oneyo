package controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.IngredientDAO;

public class AdminRemoveIngController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int ingId = Integer.parseInt(request.getParameter("id"));
		IngredientDAO ingDAO = new IngredientDAO();
		ingDAO.remove(ingId);
				
		return "redirect:/admin/ing/list";
	}

}
