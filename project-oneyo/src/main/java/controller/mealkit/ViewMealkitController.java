package controller.mealkit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.dto.Mealkit;
import controller.manager.MealkitManager;

public class ViewMealkitController implements Controller{
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	MealkitManager manager = MealkitManager.getInstance();
    	int mkId = Integer.parseInt(request.getParameter("mkId"));
		Mealkit mealkit = manager.findMealkit(mkId);
		
		request.setAttribute("mealkit", mealkit);				
		return "/mealkit/details.jsp";        
    }
}
