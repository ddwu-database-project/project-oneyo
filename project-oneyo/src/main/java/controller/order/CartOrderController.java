package controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.CustomerDAO;
import model.dao.OrderDAO;
import model.dto.CustomMealkit;
import model.dto.Customer;

public class CartOrderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{
		// get login customer
		HttpSession session = request.getSession();
		String email = CustomerSessionUtils.getLoginCustomerId(session);
						
		// get login customer Id
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.findCustomer(email);
		int customerId = customer.getCustomerId();
		//���ǿ��� cmkList ��������
		@SuppressWarnings("unchecked")
		List<Integer> cmkIds = (List<Integer>)session.getAttribute("cmkIdList");
		
		//List<CustomMealkit> customMealkitList = (List<CustomMealkit>) request.getAttribute("customMealkitList");
		OrderDAO orderDAO = new OrderDAO();
		List<CustomMealkit> customMealkitList = orderDAO.cartOrderList(cmkIds, customerId);
		request.setAttribute("customMealkitList", customMealkitList); //Ŀ���� ��ŰƮ ����Ʈ + �ɼ� �����صα�  
		
    	//redirection
    	return "/order/order.jsp"; //�̰����� ���
	}
}
