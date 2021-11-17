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
import model.dao.OrderDAO;
import model.dto.CustomMealkit;
import model.dto.Customer;
import model.dto.Order;

public class OrderListController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{
		
		// get login customer
		HttpSession session = request.getSession();
		if (!CustomerSessionUtils.hasLogined(session)) {
			return "redirect:/customer/login/form";
		}
		String email = CustomerSessionUtils.getLoginCustomerId(session);
		
		// get login customer Id
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.findCustomer(email);
		int customerId = customer.getCustomerId();
		
    	OrderDAO orderDAO = new OrderDAO();
    	List<Order> orderList = orderDAO.findOrderByCustomerId(customerId);//5��� customerId
    	
    	CustomMkDAO customMkDAO = new CustomMkDAO();
    	for (Order order : orderList) {
    		order.setOrderCustomMk(customMkDAO.findListByOrderId(order.getOrderId()));
    		System.out.println(order.getOrderCustomMk().get(0).getSharestatus());
    	}
    	
    	request.setAttribute("orderList", orderList);
    	//forwarding
    	return "/order/list.jsp";
	}
}
