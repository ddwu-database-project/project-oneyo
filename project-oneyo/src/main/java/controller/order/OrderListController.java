package controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.OrderDAO;
import model.dto.CustomMealkit;

public class OrderListController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{
		
    	//int customerId = Integer.parseInt(request.getParameter("customerId"));
    	OrderDAO orderDAO = new OrderDAO();
    	List<CustomMealkit> orderedItems = orderDAO.findOrderList(1);
    	
    	request.setAttribute("orderedItems", orderedItems);
    	//forwarding
    	return "/order/list.jsp";
	}
}
