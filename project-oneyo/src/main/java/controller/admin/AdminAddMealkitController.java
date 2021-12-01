package controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.IngredientDAO;
import model.dao.MealkitDAO;
import model.dto.Category;
import model.dto.Ingredient;
import model.dto.Mealkit;

public class AdminAddMealkitController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		if (request.getMethod().equals("GET")) {
			IngredientDAO ingDAO = new IngredientDAO();
			List<Ingredient> ingList = ingDAO.findAllIngList();
			request.setAttribute("ingList", ingList);
			return "/admin/addMealkit.jsp";
		}
		MealkitDAO mkDAO = new MealkitDAO();
		Mealkit mealkit;
		mealkit = new Mealkit(request.getParameter("name"),
				Integer.parseInt(request.getParameter("calorie")),
				Integer.parseInt(request.getParameter("price")),
				new Category(Integer.parseInt(request.getParameter("category"))));
		mkDAO.create(mealkit);
		return "redirect:/admin/mealkit/list";
	}

}
