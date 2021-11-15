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
		
		//�ֹ����������� ���ǿ� ������ �ֹ��� Ŀ���� ��ŰƮ ����Ʈ ��������
		@SuppressWarnings("unchecked")
		List<CustomMealkit> customMealkitList = (List<CustomMealkit>) session.getAttribute("orderedcmkList");
		
		OrderDAO orderDAO = new OrderDAO();
		orderDAO.addOrder(customMealkitList); //�߰��ϱ�
		List<Order> orderList = orderDAO.viewOrderList(customerId);
		request.setAttribute("orderList", orderList);
		
		//forwarding
    	return "/order/list.jsp"; //�̰����� ���
	}
}
