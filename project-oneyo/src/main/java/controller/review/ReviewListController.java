package controller.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.CustomerDAO;
import model.dao.ReviewDAO;
import model.dto.Review;

public class ReviewListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReviewDAO reviewDAO = new ReviewDAO();
		List<Review> r = new ArrayList<>();
		String mkId = request.getParameter("mkId");
		r = reviewDAO.getAll(Integer.parseInt(mkId));
		int cid = -1;
		HttpSession session = request.getSession();
		if (CustomerSessionUtils.hasLogined(session)) {
			CustomerDAO cDAO = new CustomerDAO();
			cid = cDAO.findCustomer(CustomerSessionUtils.getLoginCustomerId(session)).getCustomerId();
		}
		request.setAttribute("rlist", r);
		request.setAttribute("rsize", r.size());
		request.setAttribute("loginCustomerId", cid);
		request.setAttribute("mkId", mkId);
		return "/review/list.jsp";
	}

}
