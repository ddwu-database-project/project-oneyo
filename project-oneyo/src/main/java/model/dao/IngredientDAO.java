package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.Category;
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
		jdbcUtil.setSqlAndParameters(sql, new Object[] {ingName});		
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();						
			List<Ingredient> ingList = new ArrayList<Ingredient>();	
			while (rs.next()) {
				Ingredient ing = new Ingredient(
						rs.getInt("INGID"),
						rs.getString("INGNAME"),
						rs.getInt("PRICE"),
						rs.getInt("CALORIE"));	
				ingList.add(ing);				
			}		
			return ingList;					
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}
	
	public List<Ingredient> findAllIngList() throws SQLException {
		String sql = "select i.ingid, i.ingname, i.ingcategoryid, c.ingcategoryname "
				+ "from ingredient i, ingcategory c where i.ingcategoryid=c.ingcategoryid "
				+ "order by ingcategoryid";
		jdbcUtil.setSql(sql);
		List<Ingredient> ingList = new ArrayList<>();
		ResultSet rs = null;
		try {
			rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				ingList.add(new Ingredient(
						rs.getInt("ingid"),
						rs.getString("ingname"),
						new Category(
								rs.getInt("ingcategoryid"),
								rs.getString("ingcategoryname"))									
						));
			}
			return ingList;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			if (rs != null) {
				try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
		}
	}
}
