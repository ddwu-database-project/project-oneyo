package controller.share;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.CustomMkDAO;

public class AddShareController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int customMkId = Integer.parseInt(request.getParameter("customMkId"));
		CustomMkDAO customMkDAO = new CustomMkDAO();
		
		if (customMkDAO.updateShare(customMkId, 1) == 0) {
			System.out.println("공유 오류");
		}
		
		return "redirect:/share/mylist";
	}

}
