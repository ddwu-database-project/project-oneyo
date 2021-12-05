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
		String mkId = request.getParameter("mkId");
		r = reviewDAO.getAll(Integer.parseInt(mkId));
		int cid = Integer.parseInt(request.getParameter("loginCustomerId"));
		request.setAttribute("rlist", r);
		request.setAttribute("rsize", r.size());
		request.setAttribute("loginCustomerId", cid);
		request.setAttribute("mkId", mkId);
		return "/review/list.jsp";
	}

}
