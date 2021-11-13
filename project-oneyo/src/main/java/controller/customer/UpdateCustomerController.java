package controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.dao.CustomerDAO;
import model.dto.Customer;

public class UpdateCustomerController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateCustomerController.class);
    private CustomerDAO customerDAO = new CustomerDAO();
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
    	if (request.getMethod().equals("GET")) {	
    		// GET request: ȸ������ ���� form ��û	
    		// ������ UpdateUserFormController�� ó���ϴ� �۾��� ���⼭ ����
    		String email = request.getParameter("email");

    		log.debug("UpdateForm Request : {}", email);
    		
			Customer customer = customerDAO.findCustomer(email);
			request.setAttribute("customer", customer);			

			HttpSession session = request.getSession();
			if (CustomerSessionUtils.isLoginCustomer(email, session)) {
				return "/customer/updateForm.jsp";   // �˻��� ����� ������ update form���� ����     
			}    
			
			// else (���� �Ұ����� ���) ����� ���� ȭ������ ���� �޼����� ����
			request.setAttribute("updateFailed", true);          
			return "/customer/mypage.jsp";	// ����� ���� ȭ������ �̵� (forwarding)
	    }	
    	
    	// POST request (ȸ�������� parameter�� ���۵�)
    	Customer updateCustomer = new Customer(
        		request.getParameter("name"),
    			request.getParameter("password"),
    			request.getParameter("phone"),
    			request.getParameter("address"),
    			request.getParameter("email"));

    	log.debug("Update User : {}", updateCustomer);

		customerDAO.update(updateCustomer);	
		
        return "redirect:/customer/mypage";			
    }
}
