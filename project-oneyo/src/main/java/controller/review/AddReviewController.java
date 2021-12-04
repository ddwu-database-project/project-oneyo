package controller.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.MealkitDAO;
import model.dao.ReviewDAO;
import model.dto.Ingredient;
import model.dto.Mealkit;
import model.dto.Review;

public class AddReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String orderdate = request.getParameter("orderdate");
		int customMkId = Integer.parseInt(request.getParameter("customMkId"));
		
		ReviewDAO reviewDAO = new ReviewDAO();
		if(!reviewDAO.checkIfOverlap(customMkId)) {
			request.setAttribute("msg", "해당 커스텀밀키트의 리뷰는 이미 작성되었습니다.");
			return "/review/reviewAlert.jsp";
		}
		
		String reviewwrites = request.getParameter("reviewwrites");
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		int mkId = Integer.parseInt(request.getParameter("mkId"));
		
		Review tmp = new Review();
		tmp.setCustomMealkitId(customMkId);
		tmp.setOrderdate(orderdate);
		tmp.setReviewWrites(reviewwrites);
		tmp.setOrderId(orderId);
		tmp.setCustomerId(customerId);
		
		reviewDAO.newReview(tmp);
		
		MealkitDAO mealkitDAO = new MealkitDAO();
		
		Mealkit mealkit =mealkitDAO.findMealkit(mkId);
		List<Ingredient> mealkitIng = mealkitDAO.findMealkitIng(mkId);

		mealkit.setIngredients(mealkitIng);
		
		request.setAttribute("mealkit", mealkit);	
		return "/mealkit/details";   
	}

}
