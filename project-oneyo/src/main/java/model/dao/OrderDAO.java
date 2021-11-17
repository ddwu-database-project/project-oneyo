package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import model.dto.CustomMealkit;
import model.dto.Ingredient;
import model.dto.Mealkit;
import model.dto.Order;
import model.dto.ShippingDetail;
public class OrderDAO {
	private JDBCUtil jdbcUtil = null;
	
	public OrderDAO() {
		jdbcUtil = new JDBCUtil();
	}
	//Ŀ���ҵ� List<Ingredient>��������
	public List<Ingredient> getCustomIngList(CustomMealkit m){
		List<Ingredient> customIng = m.getIngredients();
		String sql = "SELECT i.ingname, i.price, i.calorie, c.ingquantity, "
				+ "FROM ingredient i, custommealkiting c "
				+ "WHERE i.ingid = c.ingid AND custommkid = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {m.getCustomMealkitId()});
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while(rs.next()) { 
				String ingName = rs.getString("ingname");
				int ingPrice = rs.getInt("price");
				int ingCalorie = rs.getInt("calorie");
				int ingQuantity = rs.getInt("ingquantity");

				customIng.add(new Ingredient(ingName, ingPrice, ingCalorie, ingQuantity));
			}
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}
		return customIng;
	}
	//cartController�� �ֹ������� ä���
	public List<CustomMealkit> cartOrderList(List<Integer> id, int customerId){
		List<CustomMealkit> orderedItems = new ArrayList<>();
		String sql = "SELECT m.mkname, m.mkId, m.defaultCal, m.defaultPrice, c.price, c.quantity from custommealkit c, mealkit m WHERE c.mkId = m.mkId AND c.customerId = ? AND c.custommkId = ?";
		for(int i : id) {
			jdbcUtil.setSqlAndParameters(sql, new Object[] {customerId, i});
			
			try {
				ResultSet rs = jdbcUtil.executeQuery();
				while(rs.next()) { 
					Mealkit tmp1 = new Mealkit(rs.getInt("mkId"), rs.getString("mkname"), 
							rs.getInt("defaultCal"), rs.getInt("defaultPrice"));
					
					CustomMealkit tmp2 = new CustomMealkit(rs.getInt("custommkId"), tmp1, rs.getInt("price"), rs.getInt("quantity"));
					orderedItems.add(tmp2);
				}
			}catch(Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			}
		}
		jdbcUtil.commit();
		jdbcUtil.close();	// resource ��ȯ
		
		return orderedItems;
	}
	
	//�ֹ� �� ��ȸ
	//�ֹ� ���� ������ �����ֱ� //�ش� ���� ���±��� �ֹ��� ��� ��ŰƮ����Ʈ �����ִ� ��//CustomMealkit ���̺��� orderStatus=�ֹ���(1)�� �� ��� �����ͼ� ��������
	public List<CustomMealkit> findOrderList(int customerId) {
	    List<CustomMealkit> orderedItems = new ArrayList<>();
	    String sql = "SELECT m.mkname, m.mkId, m.defaultCal, m.defaultPrice, c.price, c.quantity, c.custommkId from custommealkit c, mealkit m WHERE c.mkId = m.mkId AND c.customerId = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {customerId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while(rs.next()) { 
				Mealkit tmp1 = new Mealkit(rs.getInt("mkId"), rs.getString("mkname"), 
						rs.getInt("defaultCal"), rs.getInt("defaultPrice"));
				
				CustomMealkit tmp2 = new CustomMealkit(rs.getInt("custommkId"), tmp1, rs.getInt("price"), rs.getInt("quantity"));
				orderedItems.add(tmp2);
			}
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}
		
		return orderedItems;
	}
	//�ֹ�����Ʈ �����ֱ�
	public List<Order> viewOrderList(int customerId){
		List<CustomMealkit> orderedItems = findOrderList(customerId);
		String sql = "SELECT s.orderId, s.orderdate, s.company, s.trackingnum FROM shippingdetail s, orderinfo o WHERE s.orderId=o.orderId AND o.customMkId = ?";
		List<Order> orderList = new ArrayList<>();
		
		int orderId = 0;
		ShippingDetail tmp1 = null;
		String dateShipped = null;
		for(CustomMealkit item : orderedItems) {
			jdbcUtil.setSqlAndParameters(sql, new Object[] {item.getCustomMealkitId()});
			
			try {
				ResultSet rs = jdbcUtil.executeQuery();
				while(rs.next()) {
					dateShipped = String.valueOf(rs.getDate("orderdate")).split(" ")[0];
					tmp1 = new ShippingDetail(dateShipped, rs.getString("company"), rs.getInt("trackingnum"));
					orderId = rs.getInt("orderId");
					
					Order tmp2 = new Order(orderId, tmp1, orderedItems);
					orderList.add(tmp2);
				}	
			}catch(Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			}
		}
		jdbcUtil.commit();
		jdbcUtil.close();	// resource ��ȯ
		
		return orderList;
	}
	
	//�ֹ��ϱ�
	//����Ʈ �޾ƿ� ��(Ŀ���ҹ�ŰƮ��)�� �ϳ��� �ɰ��� �μ�Ʈ
	
	//�Ű������� l���� orderId, ingredient �������� �� �Ұ���//generatedKeys()����ؼ� orderId��������
	public List<CustomMealkit> addOrder(List<CustomMealkit> l){
		List<CustomMealkit> orderingItems = null; // �ش� ���� ��� customMealkit
		Order order = new Order();
		int totalPrice = order.calcTotalPrice(l);
		int customerId = l.get(0).getCustomerId();
		int orderId = 0;
		
		System.out.println(customerId);
		String sql1 = "INSERT INTO MEALKITORDER VALUES(order_seq.NEXTVAL, 0, to_date(sysdate), ?, ?)"; // MEALKITORDER��
																										// �߰�

		Object[] param = new Object[] { customerId, totalPrice };
		jdbcUtil.setSqlAndParameters(sql1, param);

		String key[] = { "orderId" }; // MEALKITORDER�� PK�÷���
		try {
			jdbcUtil.executeUpdate(key); // insert�� ����
			ResultSet rs = jdbcUtil.getGeneratedKeys();
			if (rs.next()) {
				orderId = rs.getInt(1); // ������ PK ��
			}

			orderingItems = findOrderList(customerId);

			String sql2 = "INSERT INTO ORDERINFO VALUES(?, ?, order_mk_seq.NEXTVAL, ?)";// ORDERINFO�� �߰�

			for (CustomMealkit item : l) {
				int customMkId = item.getCustomMealkitId();
				int quantity = item.getQuantity();
				param = new Object[] { customMkId, orderId, quantity };
				jdbcUtil.setSqlAndParameters(sql2, param);

				int result = jdbcUtil.executeUpdate(); // ó���� ���ڵ� ����
				if (result != 1) {
					jdbcUtil.rollback();
				}
			}

//			String sql3 = "INSERT INTO CUSTOMMEALKITING VALUES(?, ?, ?)"; // CUSTOMMEALKITING�� �߰�
//			for (CustomMealkit item : l) {
//				int custommealkitId = item.getCustomMealkitId();
//				List<Ingredient> customIng = getCustomIngList(item);
//				for (Ingredient ing : customIng) {
//					param = new Object[] { custommealkitId, ing.getIngId(), ing.getIngQuantity() };
//					jdbcUtil.setSqlAndParameters(sql3, param);
//
//					int result = jdbcUtil.executeUpdate(); // ó���� ���ڵ� ����
//					if (result != 1) {
//						jdbcUtil.rollback();
//					}
//
//				}
//			}
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		jdbcUtil.commit();
		jdbcUtil.close();
		return orderingItems;
	}
	
	//�ֹ����
	public int deleteOrder(int orderId) { //void?
		String sql = "UPDATE mealkitorder "
				+ "SET status = 3 "
				+"WHERE orderId = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {orderId});
		
		try {				
			int result = jdbcUtil.executeUpdate();	// update �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}
		
//		String sql1 = "UPDATE CUSTOMMEALKIT SET orderstatus = 0 WHERE custommkId = ?";
//		jdbcUtil.setSqlAndParameters(sql1, new Object[] {cmkId});
//		try {				
//			int result = jdbcUtil.executeUpdate();	// update �� ����
//			return result;
//		} catch (Exception ex) {
//			jdbcUtil.rollback();
//			ex.printStackTrace();
//		}
		return 0;
	}
	
	public List<Order> findOrderByCustomerId(int customerId) {
		List<Order> orderList = new ArrayList<>();

		String sql = "SELECT DISTINCT mo.orderid, mo.orderdate, mo.status, mo.totalprice FROM mealkitorder mo, orderinfo o WHERE mo.orderid=o.orderid AND customerid=?";
		// �ֹ���ȣ, �ֹ�����, �ֹ�����, ��ŰƮ��, ����, ����, ��Į�θ�
		jdbcUtil.setSqlAndParameters(sql, new Object[] {customerId});
		ResultSet rs = null;
		try {
			rs = jdbcUtil.executeQuery();
			// update �� ����
			while (rs.next()) {
				orderList.add(new Order(rs.getInt("orderid"), customerId, rs.getInt("status"),
						rs.getInt("totalprice"), rs.getString("orderdate").split(" ")[0]));
			}
			return orderList;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			if (rs != null) { try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}
		
		return null;
	}
}
