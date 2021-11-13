package controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dto.*;
import model.dao.*;

public class AddOrderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		List<CustomMealkit> customMealkitList = (List<CustomMealkit>) request.getAttribute("customMealkitList");
		
		OrderDAO orderDAO = new OrderDAO();
		List<CustomMealkit> orderingItems = orderDAO.addOrder(customMealkitList);
		request.setAttribute("orderingItems", orderingItems);
		//forwarding
    	return "/order/list.jsp";
	}
}
