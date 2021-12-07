package controller.review;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

import model.dao.ReviewDAO;


public class DeleteReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReviewDAO reviewDAO = new ReviewDAO();
		reviewDAO.delReview(Integer.parseInt(request.getParameter("reviewId")));

		int mkId = Integer.parseInt(request.getParameter("mkId"));

		return "redirect:/mealkit/detail?mkId=" + mkId;
	}

}
