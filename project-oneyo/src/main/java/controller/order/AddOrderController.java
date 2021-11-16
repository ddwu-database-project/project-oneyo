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

public class AddOrderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String email = CustomerSessionUtils.getLoginCustomerId(session);
		
		// get login customer Id
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.findCustomer(email);
		int customerId = customer.getCustomerId();
		
		//주문페이지에서 세션에 저장한 주문한 커스텀 밀키트 리스트 가져오기
//		@SuppressWarnings("unchecked")
//		List<CustomMealkit> cmList = (List<CustomMealkit>) session.getAttribute("orderedcmkList");
//		System.out.println(cmList);
		
		String[] orderMkIds = request.getParameterValues("orderMkId");
		
		CustomMkDAO customMkDAO = new CustomMkDAO();
		List<CustomMealkit> customMealkitList = new ArrayList<CustomMealkit>();
		
		for (String id : orderMkIds) {
			customMealkitList.add(customMkDAO.findByCustomMkId(Integer.parseInt(id), customer.getCustomerId()));
		}
		
		OrderDAO orderDAO = new OrderDAO();
		orderDAO.addOrder(customMealkitList); //추가하기
		List<Order> orderList = orderDAO.viewOrderList(customerId);
		request.setAttribute("orderList", orderList);
		
		//forwarding
//    	return "/order/list.jsp"; //이곳에서 사용
		return "redirect:/order/list";
	}
}
