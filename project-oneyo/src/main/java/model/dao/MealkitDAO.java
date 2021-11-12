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
			List<Mealkit> mealkits = new ArrayList<Mealkit>();	
			while (rs.next()) {
				Mealkit mealkit = new Mealkit(			
					rs.getInt("mkId"),
					rs.getString("mkname"),
					rs.getInt("defaultcal"),
					rs.getInt("defaultprice"));
				mealkits.add(mealkit);				
			}		
			return mealkits;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();	
		}
		return null;
	}
	
	public Mealkit findMealkit(int mkId) throws SQLException{
		String sql = "SELECT mkId, mkname, defaultcal, defaultprice "
				+"FROM mealkit "
				+"WHERE mkId = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {mkId});
		Mealkit mealkit = null;
		try {
			ResultSet rs = jdbcUtil.executeQuery();	
			if (rs.next()) {
				mealkit = new Mealkit(
					mkId,
					rs.getString("mkname"),
					rs.getInt("defaultcal"),
					rs.getInt("defaultprice")
					);
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ¹ÝÈ¯
		}
		return mealkit;
		
	}
}
