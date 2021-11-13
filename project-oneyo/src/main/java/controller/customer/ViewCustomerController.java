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
    	// �α��� ���� Ȯ��
    	if (!CustomerSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/customer/login/form";		// login form ��û���� redirect
        }

    	String email = CustomerSessionUtils.getLoginCustomerId(request.getSession());	
		Customer customer = null;
    	try {
    		customer = customerDAO.findCustomer(email);
			if (customer == null) {
				throw new CustomerNotFoundException(email + "�� �������� �ʴ� ���̵��Դϴ�.");
			}
		} catch (Exception e) {				
	        return "redirect:/";
		}	
    	request.setAttribute("customer", customer);		// ����� ���� ����			
		return "/customer/mypage.jsp";				// ������������ �̵�
    }
}
