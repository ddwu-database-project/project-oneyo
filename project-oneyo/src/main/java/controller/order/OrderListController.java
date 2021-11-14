package controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.*;
import model.dto.*;

public class OrderListController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception{
		
    	//int customerId = Integer.parseInt(request.getParameter("customerId"));
    	OrderDAO orderDAO = new OrderDAO();
    	List<Order> orderList = orderDAO.viewOrderList(5); //5´ë½Å customerId
    	
    	request.setAttribute("orderList", orderList);
    	//forwarding
    	return "/order/list.jsp";
	}
}
