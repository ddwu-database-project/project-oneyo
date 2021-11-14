package controller.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.manager.MealkitManager;
import model.dto.Ingredient;
import model.dto.Mealkit;

public class AddCartController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MealkitManager manager = MealkitManager.getInstance();
    	int mkId = Integer.parseInt(request.getParameter("mkId"));
		Mealkit mealkit = manager.findMealkit(mkId);
		
		List<Ingredient> mkIngs = manager.findMealkitIng(mkId);
		String[] ingIds = request.getParameterValues("mkIngIds");
		for (int i = 0; i < ingIds.length; i++) {
			int ingQuantity = Integer.parseInt(request.getParameter("IngQuantity"+ingIds[i]));
			mkIngs.get(i).setIngQuantity(ingQuantity);
			
			int ingPrice = Integer.parseInt(request.getParameter("mkIngPrice"+ingIds[i]));
			mkIngs.get(i).setIngPrice(ingPrice*ingQuantity);
			
			int ingCalorie = Integer.parseInt(request.getParameter("mkIngCalorie"+ingIds[i]));
			mkIngs.get(i).setIngCalorie(ingCalorie*ingQuantity);
			
		}
		System.out.println(mkIngs.toString());
		
//		CustomMealkit customMealkit = new CustomMealkit(mealkit, , )
		return "/cart/list.jsp";
	}

}
