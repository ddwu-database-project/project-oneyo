package controller.order;

import java.util.ArrayList;
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


public class FormOrderController implements Controller{
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{
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
				
		int totalIngCalorie = mkIngs.size() == 0 ? mealkit.getDefaultCal() : 0;
		int totalIngPrice = mkIngs.size() == 0 ? mealkit.getDefaultPrice() : 0;
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
		
		//커스텀밀키트리스트 저장
		List<CustomMealkit> customMealkitList = new ArrayList<CustomMealkit>();
		customMealkitList.add(customMealkit);
		request.setAttribute("customMealkitList", customMealkitList); //커스텀 밀키트 리스트 + 옵션 저장해두기  
		request.setAttribute("c", customer);
    	//redirection
    	return "/order/order2.jsp"; //이곳에서 사용
	}
}
