package controller.mealkit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.dto.Mealkit;
import model.dao.MealkitDAO;
import model.dto.Ingredient;

import java.util.List;

public class ViewMealkitController implements Controller{
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
		MealkitDAO mealkitDAO = new MealkitDAO();
		int mkId = Integer.parseInt(request.getParameter("mkId"));
    	
		Mealkit mealkit =mealkitDAO.findMealkit(mkId);
		List<Ingredient> mealkitIng = mealkitDAO.findMealkitIng(mkId);

		mealkit.setIngredients(mealkitIng);
		
		request.setAttribute("mealkit", mealkit);	
		return "/mealkit/details.jsp";        
    }
}
