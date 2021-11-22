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
import model.dto.Allergy;
import model.dto.Customer;

public class UpdateCustomerController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateCustomerController.class);
    private CustomerDAO customerDAO = new CustomerDAO();
    private AllergyDAO allergyDAO = new AllergyDAO();
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
    	if (request.getMethod().equals("GET")) {	
    		String email = request.getParameter("email");
    		int cId = customerDAO.findCustomer(email).getCustomerId();
    		

    		log.debug("UpdateForm Request : {}", email);
    		
			Customer customer = customerDAO.findCustomer(email);
			request.setAttribute("customer", customer);	
			
			List<Allergy> allergyList = allergyDAO.findAllergyList(cId);	
			request.setAttribute("allergyList", allergyList);	
			
			HttpSession session = request.getSession();
			if (CustomerSessionUtils.isLoginCustomer(email, session)) {
				return "/customer/updateForm.jsp";     
			}    
			
			request.setAttribute("updateFailed", true);          
			return "/customer/mypage.jsp";	
	    }	
    	
    	String email = request.getParameter("email");
    	Customer updateCustomer = new Customer(
    		request.getParameter("name"),
			request.getParameter("password"),
			request.getParameter("phone"),
			request.getParameter("address"),
			email);
    	
    	String[] aIds = request.getParameterValues("allergy");
    	
    	log.debug("Update User : {}", updateCustomer);

		customerDAO.update(updateCustomer);	
		int cId = customerDAO.findCustomer(email).getCustomerId();
		allergyDAO.remove(cId);
		if (aIds != null) {
			for (int i = 0; i < aIds.length; i++) {
				allergyDAO.create(cId, Integer.parseInt(aIds[i]));
			}
		}
		
        return "redirect:/customer/mypage";			
    }
}
