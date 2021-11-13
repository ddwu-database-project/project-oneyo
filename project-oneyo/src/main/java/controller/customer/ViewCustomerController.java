package controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.CustomerDAO;
import model.dto.Customer;
import model.service.*;

public class ViewCustomerController implements Controller {
	private CustomerDAO customerDAO = new CustomerDAO();
	
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	// 로그인 여부 확인
    	if (!CustomerSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/customer/login/form";		// login form 요청으로 redirect
        }

    	String email = CustomerSessionUtils.getLoginCustomerId(request.getSession());	
		Customer customer = null;
    	try {
    		customer = customerDAO.findCustomer(email);
			if (customer == null) {
				throw new CustomerNotFoundException(email + "는 존재하지 않는 아이디입니다.");
			}
		} catch (Exception e) {				
	        return "redirect:/";
		}	
    	request.setAttribute("customer", customer);		// 사용자 정보 저장			
		return "/customer/mypage.jsp";				// 마이페이지로 이동
    }
}
