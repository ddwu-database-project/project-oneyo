package controller.order;

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

public class DeleteOrderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{
//		HttpSession session = request.getSession();
//		int orderId = (int) session.getAttribute("orderId");
//		int cmkId = (int) session.getAttribute("cmkId");
		
    	OrderDAO orderDAO = new OrderDAO();
    	int orderId = Integer.parseInt(request.getParameter("orderid"));
    	orderDAO.deleteOrder(orderId);
    	
		CustomMkDAO customMkDAO = new CustomMkDAO();
		List<CustomMealkit> customMk = customMkDAO.findListByOrderId(orderId);
		
		for (CustomMealkit cmk : customMk) {
			customMkDAO.updateShare(cmk.getCustomMealkitId(), 0);
		}
    	
    	//redirection
		return "redirect:/order/list";
	}
}
