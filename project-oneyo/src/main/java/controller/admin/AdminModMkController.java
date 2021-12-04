package controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.MealkitDAO;
import model.dto.Mealkit;

public class AdminModMkController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int mkid = Integer.parseInt(request.getParameter("id"));
		MealkitDAO mkDAO = new MealkitDAO();
		
		Mealkit mealkit = mkDAO.findMealkit(mkid);
		mealkit.setIngredients(mkDAO.findMealkitIng(mkid));
		
		return "/admin/modifyMilkit.jsp";
	}

}
