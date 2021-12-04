package controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.MealkitDAO;
import model.dto.Category;
import model.dto.Mealkit;

public class AdminModMkController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MealkitDAO mkDAO = new MealkitDAO();
		if (request.getMethod().equals("GET")) {
			int mkid = Integer.parseInt(request.getParameter("id"));		
			Mealkit mealkit = mkDAO.findMealkit(mkid);
			mkDAO = new MealkitDAO();
			mealkit.setIngredients(mkDAO.findMealkitIng(mkid));
			mkDAO = new MealkitDAO();
			List<Category> catList = mkDAO.findAllCategory();
			request.setAttribute("categories", catList);
			
			mealkit.setIngredients(mkDAO.findMealkitIng(mkid));
			request.setAttribute("mealkit", mealkit);

			return "/admin/modifyMealkit.jsp";
		}
		Mealkit mealkit = new Mealkit(
				Integer.parseInt(request.getParameter("id")),
				request.getParameter("name"),
				Integer.parseInt(request.getParameter("calorie")),
				Integer.parseInt(request.getParameter("price")),
				new Category(Integer.parseInt(request.getParameter("category"))),
				request.getParameter("fullintro"),
				request.getParameter("shortintro"));
		mkDAO.update(mealkit);
		return "redirect:/admin/mealkit/list";
	}

}
