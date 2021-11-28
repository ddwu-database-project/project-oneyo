package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.dto.Mealkit;
import model.dto.Category;
import model.dto.Ingredient;
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
			jdbcUtil.close();		// resource ��ȯ
		}
		return mealkit;
		
	}
	
	public List<Ingredient> findMealkitIng(int mkId) throws Exception{
		String sql = "SELECT m.mkname, m.defaultcal, m.defaultprice, s.ingid, s.ingname, s.ingquantity, s.calorie, s.price, s.ingcategoryid "
				+"FROM mealkit m JOIN (SELECT i.ingname, i.ingid, b.mkid, b.ingquantity, i.calorie, i.price, i.ingcategoryid "
					+"FROM ingredient i JOIN baseingredient b "
					+"ON i.ingid = b.ingid) s "
				+"ON m.mkid = s.mkid "
				+"WHERE m.mkid = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {mkId});
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<Ingredient> mealkitIng = new ArrayList<Ingredient>();	
			while (rs.next()) {
				Ingredient ingredient = new Ingredient(			
					rs.getInt("ingid"),
					rs.getString("ingname"),
					rs.getInt("price"),
					rs.getInt("calorie"),
					rs.getInt("ingquantity"));
				mealkitIng.add(ingredient);	
			}		
			return mealkitIng;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();	
		}
		return null;
	}
	
	public Category findMealkitCateg(int mkId) throws Exception{
		String sql = "select c.mkcategoryid, c.mkcategoryname "
				+ "from mkcategory c join mealkit m on c.mkcategoryid = m.mkcategoryid "
				+ "where m.mkid = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {mkId});
		Category category = null;
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if (rs.next()) {
				category = new Category(
						rs.getInt("mkcategoryid"),
						rs.getString("mkcategoryname")
						);
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}return category;
	}
}
