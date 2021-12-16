package controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.CustomMkDAO;
import model.dao.OrderDAO;
import model.dto.CustomMealkit;

public class DeleteOrderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{

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
