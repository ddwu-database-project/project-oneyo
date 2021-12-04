package controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.IngredientDAO;
import model.dto.Ingredient;

public class AdminSetIngController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		IngredientDAO ingDAO = new IngredientDAO();
		if (request.getMethod().equals("GET")) {
			
			int mkid = Integer.parseInt(request.getParameter("id"));
			List<Ingredient> notIngList = ingDAO.findNotIngList(mkid);
			List<Ingredient> mkIngList = ingDAO.findMealkitIngList(mkid);
			request.setAttribute("notIngList", notIngList);
			request.setAttribute("mkIngList", mkIngList);
			request.setAttribute("mkid", mkid);
			return "/admin/addIngredients.jsp";
		}
		String[] ids = request.getParameterValues("id");
		List<Ingredient> ingredients = new ArrayList<>();
		int mkid = Integer.parseInt(request.getParameter("mkid"));
		for (int i = 0; i < ids.length; i++) {
			ingredients.add(new Ingredient(Integer.parseInt(ids[i]), request.getParameter("ing"+ids[i])));
//			ingDAO.createBase(Integer.parseInt(id), mkid);
		}
		request.setAttribute("mkid", mkid);
		request.setAttribute("ingredients", ingredients);
		return "/admin/setIngQty.jsp";
	}

}
