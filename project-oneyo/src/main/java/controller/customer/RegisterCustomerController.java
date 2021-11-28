package controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.dao.AllergyDAO;
import model.dao.CustomerDAO;
import model.dto.Customer;
import model.service.ExistingCustomerException;

public class RegisterCustomerController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterCustomerController.class);
    private CustomerDAO customerDAO = new CustomerDAO();
    private AllergyDAO allergyDAO = new AllergyDAO();
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	if (request.getMethod().equals("GET")) {	
    		log.debug("RegisterForm Request");
		
			return "/customer/registerForm.jsp";    	
	    }	
    	
    	String email = request.getParameter("email");
    	Customer customer = new Customer(
    		request.getParameter("name"),
			request.getParameter("password"),
			request.getParameter("phone"),
			request.getParameter("address"),
			email);
    	
    	String[] aIds = request.getParameterValues("allergy");
    	
        log.debug("Create Customer : {}", customer);
        int result;
		try {
			result = customerDAO.create(customer);	
			if (result == 0) {
				throw new ExistingCustomerException("이미 존재하는 이메일입니다.");
			}
			if (aIds != null) {
				int cId = customerDAO.findCustomer(email).getCustomerId();
				for (int i = 0; i < aIds.length; i++) {
					allergyDAO.create(cId, Integer.parseInt(aIds[i]));
				}
			}
		} catch (Exception e) {	
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("customer", customer);
			System.out.println("error");
			return "/customer/registerForm.jsp";
		}
		return "/customer/registerSuccess.jsp";
    }
}

