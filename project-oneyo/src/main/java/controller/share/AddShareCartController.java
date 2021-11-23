package controller.share;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.CartDAO;
import model.dao.CustomerDAO;
import model.dto.Customer;

public class AddShareCartController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if (!CustomerSessionUtils.hasLogined(session)) {
			return "redirect:/customer/login/form";
		}
		String email = CustomerSessionUtils.getLoginCustomerId(session);
		
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.findCustomer(email);
		int customerId = customer.getCustomerId();
		
		CartDAO cartDAO =  new CartDAO();
		cartDAO.shareCart(customerId, Integer.parseInt(request.getParameter("customMkId")));
	
		return "redirect:/cart/list";
	}

}
