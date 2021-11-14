package controller.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.CustomMkDAO;
import model.dao.CustomerDAO;
import model.dao.MealkitDAO;
import model.dto.CustomMealkit;
import model.dto.Customer;
import model.dto.Ingredient;
import model.dto.Mealkit;
public class AddCartController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// get login customer
		HttpSession session = request.getSession();
		String email = CustomerSessionUtils.getLoginCustomerId(session);
				
		// get login customer Id
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.findCustomer(email);
		int customerId = customer.getCustomerId();
		
		// get mealkit info
		MealkitDAO mealkitDAO = new MealkitDAO();
    	int mkId = Integer.parseInt(request.getParameter("mkId"));
		Mealkit mealkit = mealkitDAO.findMealkit(mkId);
		
		// get custom mealkit info
		List<Ingredient> mkIngs = mealkitDAO.findMealkitIng(mkId);
		String[] ingIds = request.getParameterValues("mkIngIds");
		
		int totalIngCalorie = 0;
		int totalIngPrice = 0;
		// set custom mealkit info
		for (int i = 0; ingIds != null && i < ingIds.length; i++) {
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

		// create CustomerMealkit
		CustomMealkit customMealkit = new CustomMealkit(mealkit, customerId, totalIngPrice, 1, totalIngCalorie, mkIngs);
		CustomMkDAO customMkDAO = new CustomMkDAO();
		
		customMkDAO.create(customMealkit);
//		request.setAttribute("customerMealkit", customMealkit);
		
	
		return "/cart/list.jsp";
	}

}
