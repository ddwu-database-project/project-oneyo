package controller.admin;

import java.util.List;

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
		IngredientDAO ingDAO = new IngredientDAO();
		if (request.getMethod().equals("GET")) {
			List<Category> categories = ingDAO.findAllCategory();
			request.setAttribute("categories", categories);
			return "/admin/newIngForm.jsp";
		}

		Ingredient ing = new Ingredient(
				request.getParameter("name"),
				Integer.parseInt(request.getParameter("price")),
				Integer.parseInt(request.getParameter("calorie")),
				new Category(Integer.parseInt(request.getParameter("category"))));
		
		ingDAO.create(ing);
		return "redirect:/admin/home";
	}

}
