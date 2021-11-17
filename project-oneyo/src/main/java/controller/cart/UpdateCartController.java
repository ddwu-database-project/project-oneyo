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
				
		
		String id = request.getParameter("customMkId");
		
		cartDAO.update(id, request.getParameter("quantity"));
		System.out.println(request.getParameter("quantity" + id));
	
		return "redirect:/cart/list";
	}

}
