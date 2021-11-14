package controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.*;
import model.dto.CustomMealkit;
import model.dto.Customer;

public class OrderController implements Controller{
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{
		
//		@SuppressWarnings("unchecked")
		// get login customer
				HttpSession session = request.getSession();
				String email = CustomerSessionUtils.getLoginCustomerId(session);
						
				// get login customer Id
				CustomerDAO customerDAO = new CustomerDAO();
				Customer customer = customerDAO.findCustomer(email);
				int customerId = customer.getCustomerId();
		//List<CustomMealkit> customMealkitList = (List<CustomMealkit>) request.getAttribute("customMealkitList");
		OrderDAO orderDAO = new OrderDAO();
		List<CustomMealkit> customMealkitList = orderDAO.findOrderList(customerId);
		request.setAttribute("customMealkitList", customMealkitList); //커스텀 밀키트 리스트 + 옵션 저장해두기  
		
    	//redirection
    	return "/order/order.jsp"; //이곳에서 사용
	}
	
}
