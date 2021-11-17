package controller.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.CartDAO;
import model.dao.CustomMkDAO;

public class DeleteCartController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		CartDAO cartDAO = new CartDAO();
		CustomMkDAO customMkDAO = new CustomMkDAO();
		
		String ids = request.getParameter("deleteids");
		String[] list = ids.split(",");
		
		for (String s : list) {
			if (!s.equals("")) {
				cartDAO.remove(Integer.parseInt(s));
				customMkDAO.remove(Integer.parseInt(s));
			}
		}
		return "redirect:/cart/list";
	}

}
