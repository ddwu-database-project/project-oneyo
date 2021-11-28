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
	
	public Category findIngCateg(int ingId) throws Exception{
		String sql = "select categinfo.ingcategoryid as ingId, categinfo.ingcategoryname as ingName "
				+ "from (select c.ingcategoryid, c.ingcategoryname, i.ingname, i.ingid "
				+ "    from ingcategory c join ingredient i on c.ingcategoryid = i.ingcategoryid) categinfo "
				+ "where categinfo.ingid = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {ingId});
		Category category = null;
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if (rs.next()) {
				category = new Category(
						rs.getInt("ingId"),
						rs.getString("ingName")
						);
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}return category;
	}
	
	public List<Mealkit> findTopMealkitList(int cnt) throws Exception {
		String sql = "select m.mkid as mkId, m.mkname as mkname, m.defaultcal as defaultcal, m.defaultprice as defaultprice, m.mkcategoryid "
				+ "from mealkit m join (select mkid, count(*) "
				+ "from custommealkit "
				+ "group by mkid "
				+ "order by COUNT(*) desc) groupBy on m.mkid = groupby.mkid "
				+ "where rownum <= ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {cnt});
		List<Mealkit> mealkits = new ArrayList<Mealkit>();
		try {
			ResultSet rs = jdbcUtil.executeQuery();
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
	
	public List<Mealkit> findNewMealkitList(int cnt) throws Exception {
		String sql = "select mkId, mkname, defaultcal, defaultprice, mkcategoryid from (select * from mealkit order by mkId desc) where rownum <= ?";
		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {cnt});
		List<Mealkit> mealkits = new ArrayList<Mealkit>();
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				Mealkit mealkit = new Mealkit(
					rs.getInt("mkId"),
					rs.getString("mkname"),
					rs.getInt("defaultcal"),
					rs.getInt("defaultprice"));
				mealkits.add(mealkit);	
				System.out.println(rs.getString("mkname"));
			}		
			return mealkits;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();	
		}
		return null;
	}
	
	public List<Mealkit> findTopReviewMealkitList(int cnt) throws Exception {
		String sql = "select rslt.*, m.mkid as mkId, m.mkname as mkname, m.defaultcal as defaultcal, m.defaultprice as defaultprice "
				+ "from mealkit m join (select c.mkid, count(*) "
				+ "from custommealkit c join review r on c.custommkid = r.custommkid "
				+ "group by c.mkid "
				+ "order by count(*) desc) rslt on m.mkid = rslt.mkid "
				+ "where rownum <= ?";
		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {cnt});
		List<Mealkit> mealkits = new ArrayList<Mealkit>();
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				Mealkit mealkit = new Mealkit(
					rs.getInt("mkId"),
					rs.getString("mkname"),
					rs.getInt("defaultcal"),
					rs.getInt("defaultprice"));
				mealkits.add(mealkit);	
				System.out.println(rs.getString("mkname"));
			}		
			return mealkits;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();	
		}
		return null;
	}
}
