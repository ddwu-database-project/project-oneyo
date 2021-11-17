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

public class ShareListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		CustomMkDAO customMkDAO = new CustomMkDAO();
		HttpSession session = request.getSession();
		// login confirm
		Customer customer = null;
		if (CustomerSessionUtils.hasLogined(session)) {
			String email = CustomerSessionUtils.getLoginCustomerId(session);
			CustomerDAO customerDAO = new CustomerDAO();
			customer = customerDAO.findCustomer(email);
		}

		List<CustomMealkit> cmList = customMkDAO.findCustomMkList(-1);
		
		request.setAttribute("customer", customer);
		request.setAttribute("customMk", cmList);
		return "/share/list.jsp";
	}

}
