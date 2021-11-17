package controller.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.CartDAO;
import model.dao.CustomMkDAO;
import model.dao.CustomerDAO;
import model.dao.OrderDAO;
import model.dto.CustomMealkit;
import model.dto.Customer;

public class AddOrderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String email = CustomerSessionUtils.getLoginCustomerId(session);
		
		// get login customer Id
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.findCustomer(email);
		int customerId = customer.getCustomerId();
		
		//�ֹ����������� ���ǿ� ������ �ֹ��� Ŀ���� ��ŰƮ ����Ʈ ��������
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
		orderDAO.addOrder(customMealkitList); //�߰��ϱ�
		
		CartDAO cartDAO = new CartDAO();
		
		for (CustomMealkit cm : customMealkitList) {
			cartDAO.remove(cm.getCustomMealkitId());
		}
		
		
		//forwarding
//    	return "/order/list.jsp"; //�̰����� ���
		return "redirect:/order/list";
	}
}
