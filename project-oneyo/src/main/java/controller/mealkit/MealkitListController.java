package controller.mealkit;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.dao.MealkitDAO;
import model.dto.Mealkit;

public class MealkitListController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	MealkitDAO mealkitDAO = new MealkitDAO();
		List<Mealkit> mealkits = mealkitDAO.findMealkitList();
		
		for (Mealkit mk : mealkits) {
			mk.setIngredients(mealkitDAO.findMealkitIng(mk.getMkId()));
		}

		request.setAttribute("mealkits", mealkits);				
		return "/mealkit/list.jsp";        
    }
}
