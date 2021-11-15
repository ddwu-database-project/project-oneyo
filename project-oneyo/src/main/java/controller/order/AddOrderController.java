package controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dto.*;
import model.dao.*;

public class AddOrderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String email = CustomerSessionUtils.getLoginCustomerId(session);
		
		// get login customer Id
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.findCustomer(email);
		int customerId = customer.getCustomerId();
		
		//주문페이지에서 세션에 저장한 주문한 커스텀 밀키트 리스트 가져오기
		@SuppressWarnings("unchecked")
		List<CustomMealkit> customMealkitList = (List<CustomMealkit>) session.getAttribute("orderedcmkList");
		
		OrderDAO orderDAO = new OrderDAO();
		orderDAO.addOrder(customMealkitList); //추가하기
		List<Order> orderList = orderDAO.viewOrderList(customerId);
		request.setAttribute("orderList", orderList);
		
		//forwarding
    	return "/order/list.jsp"; //이곳에서 사용
	}
}
