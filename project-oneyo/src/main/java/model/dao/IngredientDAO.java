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
	
	public int create(Ingredient ing) throws SQLException {
		String sql = "INSERT INTO ingredient VALUES (ingredient_seq.nextval, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {
				ing.getIngName(),
				ing.getIngPrice(),
				ing.getIngCalorie(),
				ing.getCategory().getCategoryId(),
				ing.getFilename()
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
	
	public int createBase(int ingId, int mkId, int qty) throws SQLException {
		String sql = "INSERT INTO baseingredient VALUES (?, ?, ?)";		
		Object[] param = new Object[] {
				mkId, ingId, qty
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
	
	public int updateBase(int ingId, int mkId, int qty) throws SQLException {
		String sql = "UPDATE baseingredient SET ingquantity=? WHERE ingid=? AND mkid=?";		
		Object[] param = new Object[] {
				qty, ingId, mkId
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
	
	public int remove(int ingId) throws SQLException {
		String sql = "DELETE FROM ingredient WHERE ingid=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {ingId});	

		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	
		}		
		return 0;
	}
	
	public int removeBase(int ingId, int mkId) throws SQLException {
		String sql = "DELETE FROM baseingredient WHERE ingid=? AND mkid=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {ingId, mkId});	

		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	
		}		
		return 0;
	}
	
	
	public List<Ingredient> findIngList(String ingName) throws SQLException {
        String sql = "SELECT INGID, INGNAME, PRICE, CALORIE, FILENAME " 
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
						rs.getInt("CALORIE"),
						rs.getString("FILENAME"));	
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
		String sql = "select i.ingid, i.ingname, i.ingcategoryid, i.filename, c.ingcategoryname "
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
								rs.getString("ingcategoryname")),
						rs.getString("filename")
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
		String sql = "select i.ingid, i.ingname, i.ingcategoryid, i.filename, c.ingcategoryname "
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
								rs.getString("ingcategoryname")),
						rs.getString("filename")
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
		String sql = "select i.ingid, i.ingname, i.ingcategoryid, c.ingcategoryname, b.ingquantity "
				+ "from ingredient i, ingcategory c, baseingredient b where i.ingcategoryid=c.ingcategoryid and b.ingid=i.ingid "
				+ "and b.mkid=? "
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
						rs.getInt("ingquantity"),
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
	
	public String findIngFileByName(String name) throws Exception {
		String sql = "select ingid, ingname, filename from ingredient where ingname=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { name });
		Ingredient ingredient = new Ingredient();
		ResultSet rs = null;
		try {
			rs = jdbcUtil.executeQuery();
			if (rs.next()) {
				ingredient = new Ingredient(
						rs.getInt("ingid"),
						rs.getString("ingname"),
						rs.getString("filename")
						);
			}
			return ingredient.getFilename();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			if (rs != null) {
				try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
		}
	}
	
	public Ingredient findIngFileById(int id) throws Exception {
		String sql = "select ingid, ingname, filename from ingredient where ingid=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { id });
		Ingredient ingredient = new Ingredient();
		ResultSet rs = null;
		try {
			rs = jdbcUtil.executeQuery();
			if (rs.next()) {
				ingredient = new Ingredient(
						rs.getInt("ingid"),
						rs.getString("ingname"),
						rs.getString("filename")
						);
			}
			return ingredient;
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
