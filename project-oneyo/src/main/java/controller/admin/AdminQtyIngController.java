package controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.IngredientDAO;

public class AdminQtyIngController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String[] ids = request.getParameterValues("id");
		int mkid = Integer.parseInt(request.getParameter("mkid"));
		IngredientDAO ingDAO = new IngredientDAO();
		
		for (String id : ids) {
			ingDAO.createBase(Integer.parseInt(id), mkid, Integer.parseInt(request.getParameter("qty"+id)));
		}
		
		return "redirect:/admin/ing/modify?id="+String.valueOf(mkid);
	}

}
