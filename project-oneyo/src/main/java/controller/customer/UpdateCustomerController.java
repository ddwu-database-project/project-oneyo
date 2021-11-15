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
    		// GET request: 회원정보 수정 form 요청	
    		// 원래는 UpdateUserFormController가 처리하던 작업을 여기서 수행
    		String email = request.getParameter("email");
    		int cId = customerDAO.findCustomer(email).getCustomerId();
    		

    		log.debug("UpdateForm Request : {}", email);
    		
			Customer customer = customerDAO.findCustomer(email);
			request.setAttribute("customer", customer);	
			
			List<Allergy> allergyList = allergyDAO.findAllergyList(cId);	
			request.setAttribute("allergyList", allergyList);	
			
			HttpSession session = request.getSession();
			if (CustomerSessionUtils.isLoginCustomer(email, session)) {
				return "/customer/updateForm.jsp";   // 검색한 사용자 정보를 update form으로 전송     
			}    
			
			// else (수정 불가능한 경우) 사용자 보기 화면으로 오류 메세지를 전달
			request.setAttribute("updateFailed", true);          
			return "/customer/mypage.jsp";	// 사용자 보기 화면으로 이동 (forwarding)
	    }	
    	
    	// POST request (회원정보가 parameter로 전송됨)
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
