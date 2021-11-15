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
    		// GET request: 회원정보 등록 form 요청	
    		log.debug("RegisterForm Request");
		
			return "/customer/registerForm.jsp";    	
	    }	
    	
    	// POST request (회원정보가 parameter로 전송됨)
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
				throw new ExistingCustomerException("이미 존재하는 아이디입니다.");
			}
			if (aIds != null) {
				int cId = customerDAO.findCustomer(email).getCustomerId();
				for (int i = 0; i < aIds.length; i++) {
					allergyDAO.create(cId, Integer.parseInt(aIds[i]));
				}
			}
		} catch (Exception e) {		// 예외 발생 시 회원가입 form으로 forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("customer", customer);
			System.out.println("error");
			return "/customer/registerForm.jsp";
		}
		return "/customer/registerSuccess.jsp";
    }
}

