package controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.dao.CustomerDAO;
import model.dto.Customer;
import model.service.*;

public class LoginController implements Controller {
	private CustomerDAO customerDAO = new CustomerDAO();
	
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			    
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Customer customer = null;
    	try {
    		customer = customerDAO.findCustomer(email);
    		
			if (customer == null) {
				throw new CustomerNotFoundException(email + "이 존재하지 않습니다.");
			}
			if (!customer.matchPassword(password)) {
				throw new PasswordMismatchException("비밀번호가 잘못 되었습니다.");
			}
			
			HttpSession session = request.getSession();
            session.setAttribute(CustomerSessionUtils.CUSTOMER_SESSION_KEY, email);
            session.setAttribute(CustomerSessionUtils.CUSTOMER_SESSION_ADMIN, customer.getPrevilege());
            session.setAttribute("name", customer.getCustomerName()); 
            
            if (customer.getPrevilege() == 1) {
            	session.setAttribute("admin", "admin"); 
            	return "redirect:/";
            } else {
            	session.setAttribute("admin", "none");
            }
            
		} catch (Exception e) {	
            request.setAttribute("loginFailed", true);
			request.setAttribute("exception", e);
	        return "/customer/loginForm.jsp";
		}	
		return "redirect:/";				
    }
}
