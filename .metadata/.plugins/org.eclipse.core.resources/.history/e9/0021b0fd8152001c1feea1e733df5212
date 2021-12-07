package controller.home;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.dao.MealkitDAO;
import model.dto.Mealkit;

public class HomeController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MealkitDAO mealkitDAO = new MealkitDAO();
		List<Mealkit> topMealkits = mealkitDAO.findTopMealkitList(3);
		List<Mealkit> newMealkits = mealkitDAO.findNewMealkitList(2);
		List<Mealkit> topReviewMealkits = mealkitDAO.findTopReviewMealkitList(3);
		
		request.setAttribute("topMealkits", topMealkits);
		request.setAttribute("newMealkits", newMealkits);
		request.setAttribute("topReviewMealkits", topReviewMealkits);
		return "/home/main.jsp";
	}

}
