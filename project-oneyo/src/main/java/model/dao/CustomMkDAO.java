package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import model.dto.CustomMealkit;
import model.dto.Ingredient;


public class CustomMkDAO {
	
	private JDBCUtil jdbcUtil;
	
	public CustomMkDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	private void createIng(int customMkId, List<Ingredient> ingList) throws Exception{
		String sql = "INSERT INTO custommealkiting VALUES (" + customMkId + ", ?, ? )";
		
		jdbcUtil.setSql(sql);
		
		try {
			for (Ingredient ing : ingList) {
				Object[] param = new Object[] {ing.getIngId(), ing.getIngQuantity()};
				jdbcUtil.setParameters(param);
				int result = jdbcUtil.executeUpdate();
			}
		} catch (Exception ex) {
			throw ex;
		} 
			
	}
	
	public int create(CustomMealkit customMk) throws SQLException {
		String sql = "INSERT INTO custommealkit VALUES ( ?, ?, custom_mk_seq.nextval, ?)";
		String sql2 = "SELECT max(custommkid) as custommkid FROM custommealkit WHERE customerid=?";
//		System.out.println(customMk.getOriginalMealkit().getMkId() + " " + customMk.getCustomerId());
		
		Object[] param = new Object[] {customMk.getCustomerId(), customMk.getOriginalMealkit().getMkId(), 0};
		
		jdbcUtil.setSqlAndParameters(sql, param);
		int result = 0;
		ResultSet rs = null;
		
		try {
			result = jdbcUtil.executeUpdate();
			jdbcUtil.setSqlAndParameters(sql2, new Object[] { customMk.getCustomerId() });
			rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				customMk.setCustomMealkitId(rs.getInt("custommkid"));
			}
			createIng(customMk.getCustomMealkitId(), customMk.getIngredients());
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();
			if (rs != null) {
				rs.close();
			}
		}
		
		return result;
	}
}
