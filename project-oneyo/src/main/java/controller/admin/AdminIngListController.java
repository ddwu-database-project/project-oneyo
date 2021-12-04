package controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.IngredientDAO;
import model.dto.Ingredient;

public class AdminIngListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		IngredientDAO ingDAO = new IngredientDAO();
		List<Ingredient> ingredients = new ArrayList<>();
		ingredients = ingDAO.findAllIngList();
		request.setAttribute("ingredients", ingredients);
		return "/admin/ingredientList.jsp";
	}

}
