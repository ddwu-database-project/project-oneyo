package controller.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.CartDAO;

public class UpdateCartController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		CartDAO cartDAO = new CartDAO();
		cartDAO.update(request.getParameter("customMkId"), request.getParameter("quantity"));
		
		return "redirect:/cart/list";
	}

}
