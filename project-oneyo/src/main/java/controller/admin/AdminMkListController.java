package controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.MealkitDAO;
import model.dto.Mealkit;

public class AdminMkListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MealkitDAO mealkitDAO = new MealkitDAO();
		List<Mealkit> mealkitList = mealkitDAO.findMealkitList();
		
		request.setAttribute("mkList", mealkitList);
		return "/admin/mealkitList.jsp";
	}

}
