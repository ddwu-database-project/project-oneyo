package controller.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.dao.AllergyDAO;
import model.dao.CustomerDAO;
import model.dao.OrderDAO;
import model.dto.Allergy;
import model.dto.Customer;
import model.service.CustomerNotFoundException;
import model.service.DeleteCustomerException;

public class DeleteCustomerController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteCustomerController.class);
	private CustomerDAO customerDAO = new CustomerDAO();
    private AllergyDAO allergyDAO = new AllergyDAO();
	private OrderDAO orderDAO = new OrderDAO();

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		String deleteEmail = request.getParameter("email");
    	log.debug("Delete User : {}", deleteEmail);
	
		HttpSession session = request.getSession();	
	
		if (CustomerSessionUtils.isLoginCustomer(deleteEmail, session)) { 
			Customer customer = null;
			List<Allergy> allergyList = null;
		    try {
				String email = CustomerSessionUtils.getLoginCustomerId(request.getSession());
				customer = customerDAO.findCustomer(email);
				int cId = customer.getCustomerId();
				int result = orderDAO.checkOrderStatus(cId);	
		    	allergyList = allergyDAO.findAllergyList(cId);	
				
				if (result != 0) {
					throw new DeleteCustomerException("주문 취소 후 탈퇴해주세요.");
				}	
				customerDAO.remove(deleteEmail);
			} catch (Exception e) {			
				request.setAttribute("deleteFailed", true);
				request.setAttribute("exception", e);
				request.setAttribute("customer", customer);		
		    	request.setAttribute("allergyList", allergyList);	
		        return "/customer/mypage.jsp";
			}	
		}
		return "redirect:/customer/logout";		
	}
    
}
