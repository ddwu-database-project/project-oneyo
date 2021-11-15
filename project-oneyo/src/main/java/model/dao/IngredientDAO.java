package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.Ingredient;

public class IngredientDAO {
	private JDBCUtil jdbcUtil = null;
	
	public IngredientDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public List<Ingredient> findIngList(String ingName) throws SQLException {
        String sql = "SELECT INGID, INGNAME, PRICE, CALORIE " 
        		   + "FROM INGREDIENT "
        		   + "WHERE INGNAME LIKE '%' || ? || '%'";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {ingName});		// JDBCUtil�� query�� ����
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query ����			
			List<Ingredient> ingList = new ArrayList<Ingredient>();	// ������ ����Ʈ ����
			while (rs.next()) {
				Ingredient ing = new Ingredient(
						rs.getInt("INGID"),
						rs.getString("INGNAME"),
						rs.getInt("PRICE"),
						rs.getInt("CALORIE"));	
				ingList.add(ing);				// List�� ��� ����
			}		
			return ingList;					
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
}
