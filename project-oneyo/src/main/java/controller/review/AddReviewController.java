package controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.ReviewDAO;
import model.dto.Review;

public class AddReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String orderdate = request.getParameter("orderdate");
		int customMkId = Integer.parseInt(request.getParameter("customMkId"));
		String reviewwrites = request.getParameter("reviewwrites");
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		
		Review tmp = new Review();
		tmp.setCustomMealkitId(customMkId);
		tmp.setOrderdate(orderdate);
		tmp.setReviewWrites(reviewwrites);
		tmp.setOrderId(orderId);
		tmp.setCustomerId(customerId);
		ReviewDAO reviewDAO = new ReviewDAO();
		reviewDAO.newReview(tmp);
		
		return "redirect:/order/list";
	}

}
