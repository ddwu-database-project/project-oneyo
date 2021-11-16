package controller.share;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.CustomMkDAO;
import model.dao.CustomerDAO;
import model.dto.CustomMealkit;
import model.dto.Customer;

public class ShareMyListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		// get login customer
		HttpSession session = request.getSession();
		// login confirm
		if (!CustomerSessionUtils.hasLogined(session)) {
			return "redirect:/customer/login/form";
		}
		String email = CustomerSessionUtils.getLoginCustomerId(session);
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.findCustomer(email);
		
		CustomMkDAO customMkDAO = new CustomMkDAO();
		List<CustomMealkit> cmList = customMkDAO.findCustomMkList(customer.getCustomerId());
		
		request.setAttribute("customMk", cmList);
				
		return "/share/mylist.jsp";
	}

}
