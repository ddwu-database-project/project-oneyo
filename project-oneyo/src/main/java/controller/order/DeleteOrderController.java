package controller.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.dao.OrderDAO;

public class DeleteOrderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{
		HttpSession session = request.getSession();
		int orderId = (int) session.getAttribute("orderId");
		int cmkId = (int) session.getAttribute("cmkId");
		
    	OrderDAO orderDAO = new OrderDAO();
    	orderDAO.deleteOrder(orderId, cmkId);
    	
    	//redirection
    	return "redirect:/order/list";
	}
}
