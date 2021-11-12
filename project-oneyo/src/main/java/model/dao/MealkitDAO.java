package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.dto.Mealkit;
import java.util.List;

public class MealkitDAO {
	private JDBCUtil jdbcUtil = null;
	
	public MealkitDAO() {			
		jdbcUtil = new JDBCUtil();	
	}
	
	public List<Mealkit> findMealkitList() throws SQLException{
		String sql = "SELECT mkId, mkname, defaultcal, defaultprice "
				+"FROM mealkit";
		
		jdbcUtil.setSql(sql);
		try {
			ResultSet rs = jdbcUtil.executeQuery();						
			List<Mealkit> mealkitList = new ArrayList<Mealkit>();	
			while (rs.next()) {
				Mealkit mealkit = new Mealkit(			
					rs.getInt("mkId"),
					rs.getString("mkname"),
					rs.getInt("defaultcal"),
					rs.getInt("defaultprice"));
				mealkitList.add(mealkit);				
			}		
			return mealkitList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();	
		}
		return null;
	}
}
