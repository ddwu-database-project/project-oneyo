package controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.dao.CustomerDAO;
import model.dto.Customer;
import model.service.ExistingCustomerException;

public class RegisterCustomerController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterCustomerController.class);
    private CustomerDAO customerDAO = new CustomerDAO();
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Customer customer = new Customer(
    		request.getParameter("name"),
			request.getParameter("password"),
			request.getParameter("phone"),
			request.getParameter("address"),
			request.getParameter("email"));
		
        log.debug("Create Customer : {}", customer);
        int result;
		try {
			result = customerDAO.create(customer);	
			if (result == 0) {
				throw new ExistingCustomerException("�̹� �����ϴ� ���̵��Դϴ�.");
			}
		} catch (Exception e) {		// ���� �߻� �� ȸ������ form���� forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("customer", customer);
			return "/customer/registerForm.jsp";
		}
		return "redirect:/";
    }
}

