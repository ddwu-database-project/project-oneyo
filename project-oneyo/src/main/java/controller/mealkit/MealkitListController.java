package controller.mealkit;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.dto.Mealkit;
import controller.manager.*;

public class MealkitListController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	MealkitManager manager = MealkitManager.getInstance();
		List<Mealkit> mealkits = manager.findMealkitList();
		
		request.setAttribute("mealkits", mealkits);				
		return "/mealkit/list.jsp";        
    }
}
