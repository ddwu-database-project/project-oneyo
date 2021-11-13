package controller.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.OrderDAO;

public class DeleteOrderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{
		int orderId = Integer.parseInt(request.getParameter("orderId"));
    	OrderDAO orderDAO = new OrderDAO();
    	orderDAO.deleteOrder(orderId);
    	
    	//redirection
    	return "redirect:/order/list";
	}
}
