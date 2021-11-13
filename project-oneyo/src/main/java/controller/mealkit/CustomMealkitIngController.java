package controller.mealkit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dto.Ingredient;
import model.dto.Mealkit;
import controller.manager.MealkitManager;

public class CustomMealkitIngController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MealkitManager manager = MealkitManager.getInstance();
    	int mkId = Integer.parseInt(request.getParameter("mkId"));
    	
		Mealkit mealkit = manager.findMealkit(mkId);
		List<Ingredient> mealkitIng = manager.findMealkitIng(mkId);
		mealkit.setIngredients(mealkitIng);
		
		request.setAttribute("mealkit", mealkit);
		return "/mealkit/customForm.jsp";
	}

}
