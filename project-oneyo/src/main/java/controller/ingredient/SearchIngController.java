package controller.ingredient;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.IngredientDAO;

public class SearchIngController implements Controller {
	private IngredientDAO ingredientDAO = new IngredientDAO();
	
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			

    	String ingName = request.getParameter("ingredient");	

    	try {
    		if (ingName != null) {
    	    	List<String> ings = ingredientDAO.findIngList(ingName);
            	request.setAttribute("ings", ings);							
    		}
		} catch (Exception e) {				
	        return "redirect:/";
		}	
    	return "/ingredient/search.jsp";		
    }
}
