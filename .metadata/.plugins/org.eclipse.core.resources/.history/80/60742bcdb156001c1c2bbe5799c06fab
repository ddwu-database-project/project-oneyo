package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.CustomMealkit;
import model.dto.Ingredient;
import model.dto.Mealkit;


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
				jdbcUtil.executeUpdate();
			}
		} catch (Exception ex) {
			throw ex;
		} 
			
	}
	
	public int create(CustomMealkit customMk) throws SQLException {
		String sql = "INSERT INTO custommealkit VALUES ( ?, ?, custom_mk_seq.nextval, 0, ?, ?, ?, ?)";
		String sql2 = "SELECT max(custommkid) as custommkid FROM custommealkit WHERE customerid=?";
//		System.out.println(customMk.getOriginalMealkit().getMkId() + " " + customMk.getCustomerId());
		
		Object[] param = new Object[] {customMk.getCustomerId(), customMk.getOriginalMealkit().getMkId(), 0,
				customMk.getQuantity(), customMk.getPrice(), customMk.getTotalCalorie()};
		
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
	
	public int remove(int customMkId) throws SQLException {
		String sql1 = "DELETE FROM custommealkiting WHERE custommkid=?";
		String sql2 = "DELETE FROM custommealkit WHERE custommkid=?";
		Object[] param = new Object[] { customMkId };
		
		jdbcUtil.setSqlAndParameters(sql1, param);
		
		try {
			int result = jdbcUtil.executeUpdate();
			jdbcUtil.setSql(sql2);
			result = jdbcUtil.executeUpdate();
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
	
	private Boolean findIngList(List<CustomMealkit> cmList)
	{
		String query = "SELECT i.ingname, i.price, i.calorie, c.ingquantity "
				+ "FROM ingredient i, custommealkiting c "
				+ "WHERE i.ingid = c.ingid AND custommkid = ?";
		
		jdbcUtil.setSql(query);
		ResultSet rs = null;
		try {
			for (CustomMealkit cm : cmList) {
				int customMkId = cm.getCustomMealkitId();
				List<Ingredient> ingList = cm.getIngredients();
				jdbcUtil.setParameters(new Object[] { customMkId });
				rs = jdbcUtil.executeQuery();
				while (rs.next()) {
					String ingName = rs.getString("INGNAME");
					int ingPrice = rs.getInt("PRICE");
					int ingCalorie = rs.getInt("CALORIE");
					int ingQuantity = rs.getInt("INGQUANTITY");

					ingList.add(new Ingredient(ingName, ingPrice, ingCalorie, ingQuantity));
				}
			}
		} catch (Exception e) {
			jdbcUtil.rollback();
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
			jdbcUtil.commit();
		}
		return true;
	}
	
	public List<CustomMealkit> findCustomMkList(int customerId) throws Exception {
		ArrayList<CustomMealkit> cmList = new ArrayList<>();
		String sql;
		if (customerId == -1) {
			sql = "SELECT c.customerid, m.mkname, m.mkid, c.custommkid, c.price, c.calorie "
					+"FROM custommealkit c JOIN mealkit m ON c.mkid = m.mkid WHERE sharestatus=1";
			jdbcUtil.setSql(sql);
		} else {
			sql = "SELECT m.mkname, m.mkid, c.custommkid, c.price, c.calorie "
					+"FROM custommealkit c JOIN mealkit m ON c.mkid = m.mkid WHERE orderstatus=1 AND sharestatus=0 AND customerid=?";
			Object[] param = new Object[] { customerId };
			jdbcUtil.setSqlAndParameters(sql, param);
		}		
		
		ResultSet rs = null;
		
		try {
			rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				cmList.add(new CustomMealkit(new Mealkit(rs.getInt("mkid"), rs.getString("mkname")),
						customerId == -1 ? rs.getInt("customerid"):customerId, rs.getInt("custommkid"), rs.getInt("price"), rs.getInt("calorie")));
			}
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			if (rs != null) {
				try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		
		findIngList(cmList);
		
		return (cmList);
	}
		
	public int updateShare(int customMkId, int value) {
		
		String sql = "UPDATE custommealkit SET sharestatus=? WHERE custommkid=?";
		
		jdbcUtil.setSqlAndParameters(sql, new Object[] { value, customMkId });
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
	
	public CustomMealkit findByCustomMkId(int customMkId, int customerId) {
		String sql = "SELECT m.mkname, m.mkid, c.custommkid, c.price, c.calorie, c.quantity "
				+"FROM custommealkit c JOIN mealkit m ON c.mkid = m.mkid WHERE custommkid=?";
		Object[] param = new Object[] { customMkId };
		jdbcUtil.setSqlAndParameters(sql, param);		
		
		ResultSet rs = null;
		
		try {
			rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				CustomMealkit cm = new CustomMealkit(new Mealkit(rs.getInt("mkid"), rs.getString("mkname")),
						rs.getInt("custommkid"), customerId, rs.getInt("price"), rs.getInt("quantity"), rs.getInt("calorie"));
				List<CustomMealkit> cmList = new ArrayList<>();
				cmList.add(cm);
				findIngList(cmList);
				return cm;
			}
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			if (rs != null) {
				try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return null;
	}
	
	public List<CustomMealkit> findListByOrderId(int orderId) {
		List<CustomMealkit> cmList = new ArrayList<>();
		String sql = "SELECT m.mkname, m.mkid, c.custommkid, c.price, c.quantity, c.sharestatus, c.orderstatus " +
	"FROM custommealkit c, mealkit m, orderinfo o WHERE c.mkid=m.mkid and c.custommkid=o.custommkid and orderid=?";
		
		jdbcUtil.setSqlAndParameters(sql, new Object[] { orderId });
		ResultSet rs = null;
		try {
			rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				cmList.add(new CustomMealkit(rs.getInt("custommkid"), new Mealkit(rs.getInt("mkid"), rs.getString("mkname")),
						rs.getInt("price"), rs.getInt("quantity"), rs.getInt("sharestatus"), rs.getInt("orderstatus")));
			}
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			if (rs != null) {
				try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		
		findIngList(cmList);
		return cmList;
	}


}
