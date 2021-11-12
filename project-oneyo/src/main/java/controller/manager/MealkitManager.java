package controller.manager;

import model.dao.MealkitDAO;
import model.dto.Mealkit;
import java.util.List;

public class MealkitManager {
	private static MealkitManager mkMan = new MealkitManager();
	private MealkitDAO mealkitDAO;
	
	private MealkitManager() {
		try {
			mealkitDAO = new MealkitDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public List<Mealkit> findMealkitList() throws Exception {
		return mealkitDAO.findMealkitList();
	}
	
	public Mealkit findMealkit(int mkId) throws Exception {
		System.out.println("findmealkitid = "+ mkId);
		return mealkitDAO.findMealkit(mkId);
	}
	
	public static MealkitManager getInstance() {
		return mkMan;
	}
}
