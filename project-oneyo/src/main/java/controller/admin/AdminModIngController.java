package controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.IngredientDAO;
import model.dto.Ingredient;

public class AdminModIngController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		IngredientDAO ingDAO = new IngredientDAO();
		if (request.getMethod().equals("GET")) {
			int mkid = Integer.parseInt(request.getParameter("id"));
			List<Ingredient> mkIngList = ingDAO.findMealkitIngList(mkid);
			request.setAttribute("mkid", mkid);
			request.setAttribute("ingredients", mkIngList);
			return "/admin/modifyIngs.jsp";
		}
		int mkId = Integer.parseInt(request.getParameter("mkId"));
		int ingId = Integer.parseInt(request.getParameter("ingId"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		ingDAO.updateBase(ingId, mkId, qty);
		return "redirect:/admin/mealkit/list";
	}

}
