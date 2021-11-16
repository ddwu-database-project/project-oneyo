package controller.share;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.CustomMkDAO;

public class DeleteShareController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int customMkId = Integer.parseInt(request.getParameter("customMkId"));
		CustomMkDAO customMkDAO = new CustomMkDAO();
		
		if (customMkDAO.updateShare(customMkId, 0) == 0) {
			System.out.println("공유 취소 오류");
		}
		
		return "redirect:/share/list/all";
	}

}
