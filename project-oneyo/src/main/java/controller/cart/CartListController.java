package controller.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.dao.CartDAO;
import model.dao.CustomerDAO;
import model.dto.Cart;
import model.dto.Customer;

public class CartListController implements Controller {
	private CartDAO cartDAO = new CartDAO();
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		// get login customer
		HttpSession session = request.getSession();
		String email = CustomerSessionUtils.getLoginCustomerId(session);
						
		// get login customer Id
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.findCustomer(email);
		int customerId = customer.getCustomerId();
				
		Cart cart = cartDAO.findCartItem(customerId);
		
		request.setAttribute("totalPrice", cart.getTotalPrice());
		request.setAttribute("cartitems", cart.getCustomMealkits());
		
		return "/cart/list.jsp";
	}
}
