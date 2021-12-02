package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.Category;
import model.dto.Ingredient;
import model.dto.Mealkit;

public class IngredientDAO {
	private JDBCUtil jdbcUtil = null;
	
	public IngredientDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public int create(Ingredient ing) throws SQLException {
		String sql = "INSERT INTO ingredient VALUES (ingredient_seq.nextval, ?, ?, ?, ?)";		
		Object[] param = new Object[] {
				ing.getIngName(),
				ing.getIngPrice(),
				ing.getIngCalorie(),
				ing.getCategory().getCategoryId()
		};
		
		jdbcUtil.setSqlAndParameters(sql, param);
						
		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;			
	}
	
	public int createBase(int ingId, int mkId) throws SQLException {
		String sql = "INSERT INTO baseingredient VALUES (?, ?, 1)";		
		Object[] param = new Object[] {
				mkId, ingId
		};
		
		jdbcUtil.setSqlAndParameters(sql, param);
						
		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;			
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
	
	public List<Ingredient> findNotIngList(int mkid) throws SQLException {
		String sql = "select i.ingid, i.ingname, i.ingcategoryid, c.ingcategoryname "
				+ "from ingredient i, ingcategory c where i.ingcategoryid=c.ingcategoryid "
				+ "and i.ingid not in (select ingid from baseingredient where mkid=?) "
				+ "order by ingcategoryid";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { mkid });
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
	
	public List<Ingredient> findMealkitIngList(int mkid) throws SQLException {
		String sql = "select i.ingid, i.ingname, i.ingcategoryid, c.ingcategoryname "
				+ "from ingredient i, ingcategory c where i.ingcategoryid=c.ingcategoryid "
				+ "and i.ingid in (select ingid from baseingredient where mkid=?) "
				+ "order by ingcategoryid";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { mkid });
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
	
	public List<Category> findAllCategory() throws Exception {
		String sql = "select * from ingcategory";
		
		jdbcUtil.setSql(sql);
		List<Category> catList = new ArrayList<>();
		ResultSet rs = null;
		try {
			rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				catList.add(new Category(
						rs.getInt("ingcategoryid"),
						rs.getString("ingcategoryname")));
			}		
			return catList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();	
		}
		return null;
	}

}
