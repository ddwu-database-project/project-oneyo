package controller.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import controller.manager.MealkitManager;
import model.dto.CustomMealkit;
import model.dto.Customer;
import model.dto.Ingredient;
import model.dto.Mealkit;
import model.dao.CustomerDAO;

public class AddCartController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// get mealkit info
		MealkitManager manager = MealkitManager.getInstance();
    	int mkId = Integer.parseInt(request.getParameter("mkId"));
		Mealkit mealkit = manager.findMealkit(mkId);
		
		// get custom mealkit info
		List<Ingredient> mkIngs = manager.findMealkitIng(mkId);
		String[] ingIds = request.getParameterValues("mkIngIds");
		int totalIngCalorie = 0;
		int totalIngPrice = 0;
		// set custom mealkit info
		for (int i = 0; i < ingIds.length; i++) {
			int ingQuantity = Integer.parseInt(request.getParameter("IngQuantity"+ingIds[i]));
			mkIngs.get(i).setIngQuantity(ingQuantity);
			
			//calculate total ingredients price
			int ingPrice = Integer.parseInt(request.getParameter("mkIngPrice"+ingIds[i]));
			mkIngs.get(i).setIngPrice(ingPrice*ingQuantity);
			totalIngPrice += ingPrice*ingQuantity;
			
			//calculate total ingredients calorie
			int ingCalorie = Integer.parseInt(request.getParameter("mkIngCalorie"+ingIds[i]));
			mkIngs.get(i).setIngCalorie(ingCalorie*ingQuantity);
			totalIngCalorie += ingCalorie*ingQuantity;
			
		}
		System.out.println(mkIngs.toString());
		
		// get login customer
		HttpSession session = request.getSession();
		String email = CustomerSessionUtils.getLoginCustomerId(session);
		
		// get login customer Id
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.findCustomer(email);
		int customerId = customer.getCustomerId();
		
		// create CustomerMealkit
		CustomMealkit customMealkit = new CustomMealkit(mealkit, customerId, totalIngPrice, 1, totalIngCalorie, mkIngs);

		request.setAttribute("customerMealkit", customMealkit);
		return "/cart/list.jsp";
	}

}
