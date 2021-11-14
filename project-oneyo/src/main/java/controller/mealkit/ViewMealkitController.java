package controller.mealkit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.dto.Mealkit;
<<<<<<< HEAD
import model.dto.Ingredient;
import controller.manager.MealkitManager;
=======
import model.dao.MealkitDAO;
import model.dto.Ingredient;
>>>>>>> 65aff69b59e841201f9c8e9767abca13bdbb6e0a
import java.util.List;

public class ViewMealkitController implements Controller{
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
<<<<<<< HEAD
    	MealkitManager manager = MealkitManager.getInstance();
    	int mkId = Integer.parseInt(request.getParameter("mkId"));
    	
		Mealkit mealkit = manager.findMealkit(mkId);
		List<Ingredient> mealkitIng = manager.findMealkitIng(mkId);
=======
		MealkitDAO mealkitDAO = new MealkitDAO();
		int mkId = Integer.parseInt(request.getParameter("mkId"));
    	
		Mealkit mealkit =mealkitDAO.findMealkit(mkId);
		List<Ingredient> mealkitIng = mealkitDAO.findMealkitIng(mkId);
>>>>>>> 65aff69b59e841201f9c8e9767abca13bdbb6e0a
		mealkit.setIngredients(mealkitIng);
		
		request.setAttribute("mealkit", mealkit);	
		return "/mealkit/details.jsp";        
    }
}
