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
				throw new CustomerNotFoundException(email + "는 존재하지 않는 아이디입니다.");
			}
			if (!customer.matchPassword(password)) {
				throw new PasswordMismatchException("비밀번호가 일치하지 않습니다. ");
			}
			
			// 세션에 고객 정보 저장 (고객 이메일)
			HttpSession session = request.getSession();
            session.setAttribute(CustomerSessionUtils.CUSTOMER_SESSION_KEY, email);
           
            session.setAttribute("name", customer.getCustomerName()); 
            
		} catch (Exception e) {	
            request.setAttribute("loginFailed", true);
			request.setAttribute("exception", e);
	        return "/customer/loginForm.jsp";
		}	
		return "redirect:/";				
    }
}
