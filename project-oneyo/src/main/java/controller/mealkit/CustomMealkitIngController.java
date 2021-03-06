package controller.mealkit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.MealkitDAO;
import model.dto.Ingredient;
import model.dto.Mealkit;

public class CustomMealkitIngController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// get login customer
		HttpSession session = request.getSession();
		if (!CustomerSessionUtils.hasLogined(session)) {
			return "redirect:/customer/login/form";
		}
		
		MealkitDAO mealkitDAO = new MealkitDAO();
    	int mkId = Integer.parseInt(request.getParameter("mkId"));
    	
		Mealkit mealkit = mealkitDAO.findMealkit(mkId);
		List<Ingredient> mealkitIng = mealkitDAO.findMealkitIng(mkId);

		mealkit.setIngredients(mealkitIng);
		
		request.setAttribute("mealkit", mealkit);
		return "/mealkit/customForm.jsp";
	}

}
