package controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.IngredientDAO;
import model.dto.Category;
import model.dto.Ingredient;

public class AdminAddIngController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		if (request.getMethod().equals("GET")) {
			return "/admin/newIngForm.jsp";
		}
		IngredientDAO ingDAO = new IngredientDAO();
		Ingredient ing = new Ingredient(
				request.getParameter("name"),
				Integer.parseInt(request.getParameter("price")),
				Integer.parseInt(request.getParameter("calorie")),
				new Category(Integer.parseInt(request.getParameter("category"))));
		
		ingDAO.create(ing);
		return "redirect:/admin/home";
	}

}
