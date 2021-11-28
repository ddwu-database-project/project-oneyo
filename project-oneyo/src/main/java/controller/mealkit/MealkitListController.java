package controller.mealkit;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.AllergyDAO;
import model.dao.CustomerDAO;
import model.dao.MealkitDAO;
import model.dto.Allergy;
import model.dto.Customer;
import model.dto.Mealkit;

public class MealkitListController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	MealkitDAO mealkitDAO = new MealkitDAO();
		List<Mealkit> mealkits = mealkitDAO.findMealkitList();
		
		for (Mealkit mk : mealkits) {
			mk.setIngredients(mealkitDAO.findMealkitIng(mk.getMkId()));
			mk.setCategory(mealkitDAO.findMealkitCateg(mk.getMkId()));
		}
		
		// get login customer
		HttpSession session = request.getSession();
		if (CustomerSessionUtils.hasLogined(session)) {
			String email = CustomerSessionUtils.getLoginCustomerId(session);
			
			// get login customer Id
			CustomerDAO customerDAO = new CustomerDAO();
			Customer customer = customerDAO.findCustomer(email);
			int customerId = customer.getCustomerId();
	
			AllergyDAO allergyDAO = new AllergyDAO();
			List<Allergy> alleries = allergyDAO.findAllergyList(customerId);
			
			request.setAttribute("alleries", alleries);
		}
		
		request.setAttribute("mealkits", mealkits);				
		return "/mealkit/list.jsp";        
    }
}
