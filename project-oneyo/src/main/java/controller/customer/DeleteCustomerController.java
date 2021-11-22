package controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.dao.CustomerDAO;

public class DeleteCustomerController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteCustomerController.class);
	private CustomerDAO customerDAO = new CustomerDAO();

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		String deleteEmail = request.getParameter("email");
    	log.debug("Delete User : {}", deleteEmail);
	
		HttpSession session = request.getSession();	
	
		if (CustomerSessionUtils.isLoginCustomer(deleteEmail, session)) { 
				
			customerDAO.remove(deleteEmail);			
			return "redirect:/customer/logout";		
		}
		return "redirect:/customer/mypage"; 
	}
}
