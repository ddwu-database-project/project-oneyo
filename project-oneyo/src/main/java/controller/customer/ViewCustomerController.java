package controller.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.dao.AllergyDAO;
import model.dao.CustomerDAO;
import model.dto.Allergy;
import model.dto.Customer;
import model.service.*;

public class ViewCustomerController implements Controller {
	private CustomerDAO customerDAO = new CustomerDAO();
    private AllergyDAO allergyDAO = new AllergyDAO();
	
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
		// �α��� ���� Ȯ��
    	if (!CustomerSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/customer/login/form";		// login form ��û���� redirect
        }

    	String email = CustomerSessionUtils.getLoginCustomerId(request.getSession());	
    	
		Customer customer = null;
		List<Allergy> allergyList = null;
    	try {
    		customer = customerDAO.findCustomer(email);
			if (customer == null) {
				throw new CustomerNotFoundException(email + "�� �������� �ʴ� ���̵��Դϴ�.");
			}
	    	int cId = customerDAO.findCustomer(email).getCustomerId();
	    	allergyList = allergyDAO.findAllergyList(cId);		
		} catch (Exception e) {				
	        return "redirect:/";
		}	
    	request.setAttribute("customer", customer);		// ����� ���� ����	
    	request.setAttribute("allergyList", allergyList);	
		return "/customer/mypage.jsp";				// ������������ �̵�
    }
}
