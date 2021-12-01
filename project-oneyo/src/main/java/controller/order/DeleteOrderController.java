package controller.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.CustomMkDAO;
import model.dao.CustomerDAO;
import model.dao.OrderDAO;
import model.dto.Customer;

public class DeleteOrderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{
//		HttpSession session = request.getSession();
//		int orderId = (int) session.getAttribute("orderId");
//		int cmkId = (int) session.getAttribute("cmkId");
		
    	OrderDAO orderDAO = new OrderDAO();
    	orderDAO.deleteOrder(Integer.parseInt(request.getParameter("orderid")));
    	
		int customMkId = Integer.parseInt(request.getParameter("custommkId"));
		CustomMkDAO customMkDAO = new CustomMkDAO();
		
		if (customMkDAO.updateShare(customMkId, 0) == 0) {
			System.out.println("���� ��� ����");
		}
    	
    	//redirection
		return "redirect:/order/list";
	}
}
