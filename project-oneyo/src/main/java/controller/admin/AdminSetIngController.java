package controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.IngredientDAO;
import model.dto.Ingredient;

public class AdminSetIngController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		IngredientDAO ingDAO = new IngredientDAO();
		if (request.getMethod().equals("GET")) {
			
			int mkid = Integer.parseInt(request.getParameter("id"));
			List<Ingredient> ingList = ingDAO.findNotIngList(mkid);
			request.setAttribute("ingList", ingList);
			request.setAttribute("mkid", mkid);
			return "/admin/addIngredients.jsp";
		}
		String[] ids = request.getParameterValues("id");
		int mkid = Integer.parseInt(request.getParameter("mkid"));
		for (String id : ids) {
			ingDAO.createBase(Integer.parseInt(id), mkid);
		}
		return "redirect:/mealkit/list";
	}

}
