package controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class ReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String orderdate = request.getParameter("orderdate");
		String mkName = request.getParameter("mkname");
		String customMkId = request.getParameter("custommkId");
		String orderId = request.getParameter("orderId");
		String customerId = request.getParameter("customerId");
		
		request.setAttribute("customerId", customerId);
		request.setAttribute("orderId", orderId);
		request.setAttribute("mkName", mkName);
		request.setAttribute("orderdate", orderdate);
		request.setAttribute("customMkId", customMkId);
		return "/review/newReview.jsp";
	}

}
