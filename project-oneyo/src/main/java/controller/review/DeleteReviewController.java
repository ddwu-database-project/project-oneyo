package controller.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.CustomerDAO;
import model.dao.MealkitDAO;
import model.dao.ReviewDAO;
import model.dto.Customer;
import model.dto.Ingredient;
import model.dto.Mealkit;

public class DeleteReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReviewDAO reviewDAO = new ReviewDAO();
		reviewDAO.delReview(Integer.parseInt(request.getParameter("reviewId")));

		
		
		 int mkId = Integer.parseInt(request.getParameter("mkId")); 
		 MealkitDAO mealkitDAO = new MealkitDAO();
		 
		 Mealkit mealkit =mealkitDAO.findMealkit(mkId); 
		 
		 List<Ingredient> mealkitIng = mealkitDAO.findMealkitIng(mkId);
		 
		 mealkit.setIngredients(mealkitIng);
		 
		 request.setAttribute("mealkit", mealkit);
		 CustomerDAO customerDAO = new CustomerDAO();
			CustomerSessionUtils u = new CustomerSessionUtils();
			HttpSession session = request.getSession();	
			@SuppressWarnings("static-access")
			String email = u.getLoginCustomerId(session);
			Customer c = customerDAO.findCustomer(email);
			
			request.setAttribute("loginCustomerId", c.getCustomerId());
			
		 return "/mealkit/details.jsp";
		 

	}

}
