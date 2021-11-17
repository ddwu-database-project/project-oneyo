package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import model.dto.Cart;
import model.dto.CustomMealkit;
import model.dto.Ingredient;
import model.dto.Mealkit;

public class CartDAO {
	
	private ConnectionManager connManager;
	private JDBCUtil jdbcUtil;
	
	public CartDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connManager = new ConnectionManager();
			jdbcUtil = new JDBCUtil();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
	}
	
	public int create(CustomMealkit customMk) throws SQLException {
		String sql = "INSERT INTO cartitem VALUES (cart_seq.nextval, ?, ?)";		
		Object[] param = new Object[] {customMk.getCustomerId(), customMk.getCustomMealkitId()};
		
//		System.out.println(customMk.getQuantity() + " " + customMk.getCustomerId() + " " +
//				customMk.getCustomMealkitId() + " " + customMk.getPrice()); 

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

	
	public int update(String customMkId, String newQuantity) throws SQLException {
		
		String sql = "UPDATE custommealkit "
					+ "SET quantity=? "
					+ "WHERE custommkid=?";
		Object[] param = new Object[] {newQuantity, customMkId, };				
		jdbcUtil.setSqlAndParameters(sql, param);
			
		try {				
			int result = jdbcUtil.executeUpdate();	// update �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}		
		return 0;
	}

	
	public int remove(int customMkId) throws SQLException {
		String sql = "DELETE FROM cartitem WHERE custommkid=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {customMkId});	// JDBCUtil�� delete���� �Ű� ���� ����

		try {				
			int result = jdbcUtil.executeUpdate();	// delete �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}		
		return 0;
	}
	
	private Boolean findIngList(List<CustomMealkit> cmList)
	{
		Connection conn = connManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT i.ingname, i.price, i.calorie, c.ingquantity "
					+ "FROM ingredient i, custommealkiting c "
					+ "WHERE i.ingid = c.ingid AND custommkid = ?";
			pstmt = conn.prepareStatement(query);
			
			for (CustomMealkit cm : cmList) {
				int customMkId = cm.getCustomMealkitId();
				List<Ingredient> ingList = cm.getOriginalMealkit().getIngredients();
				pstmt.setInt(1, customMkId);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String ingName = rs.getString("INGNAME");
					int ingPrice = rs.getInt("PRICE");
					int ingCalorie = rs.getInt("CALORIE");
					int ingQuantity = rs.getInt("INGQUANTITY");

					ingList.add(new Ingredient(ingName, ingPrice, ingCalorie, ingQuantity));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (rs != null) {
				try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
			if (pstmt != null) {
				try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
			if (conn != null) {
				try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
		}
		
		return true;
	}
	
	public Cart findCartItem(int customerId) {
		Connection conn = connManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Cart cartitem = new Cart();
		List<CustomMealkit> cmList = cartitem.getCustomMealkits();
		List<Ingredient> cmIng;
		
		try {
			String query = "SELECT cm.customMkId, m.mkid, m.mkname, cm.price, cm.quantity, cm.calorie "
					+ "FROM cartitem c, mealkit m, custommealkit cm "
					+ "WHERE c.customerId = ? AND c.customMkId = cm.customMkId AND cm.mkId = m.mkId";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, customerId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				int customMkId = rs.getInt("CUSTOMMKID");
				int mkId = rs.getInt("MKID");
				String mkName = rs.getString("MKNAME");
				int price = rs.getInt("PRICE");
				int quantity = rs.getInt("QUANTITY");
				int calorie = rs.getInt("CALORIE");
				cmList.add(new CustomMealkit(customMkId, new Mealkit(mkId, mkName), price, quantity, calorie));
			}
			findIngList(cmList);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
			if (pstmt != null) {
				try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
			if (conn != null) {
				try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
			}
		}
		return cartitem;
	}	
	
}
