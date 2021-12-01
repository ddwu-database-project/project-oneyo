package controller.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.ReviewDAO;
import model.dto.Review;

public class ReviewListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReviewDAO reviewDAO = new ReviewDAO();
		List<Review> r = new ArrayList<>();
		r = reviewDAO.getAll(Integer.parseInt(request.getParameter("mkId")));
		
		request.setAttribute("rlist", r);
		request.setAttribute("rsize", r.size());
		return "/review/list.jsp";
	}

}
