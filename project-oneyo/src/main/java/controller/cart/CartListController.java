package controller.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.CartDAO;
import model.dto.Cart;

public class CartListController implements Controller {
	private CartDAO cartDAO = new CartDAO();
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		Cart cart = cartDAO.findCartItem(5);
		
		request.setAttribute("cartitems", cart.getCustomMealkits());
		System.out.println("get cart");
		
		return "/cart/list.jsp";
	}
}
