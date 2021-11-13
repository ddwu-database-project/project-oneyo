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
	
		if (CustomerSessionUtils.isLoginCustomer(deleteEmail, session)) { // 로그인한 사용자가 삭제 대상인 경우 (자기 자신을 삭제)
				
			customerDAO.remove(deleteEmail);				// 사용자 정보 삭제
			return "redirect:/customer/logout";		// logout 처리
		}
		return "redirect:/customer/mypage"; // 삭제가 안된 경우
	}
}
