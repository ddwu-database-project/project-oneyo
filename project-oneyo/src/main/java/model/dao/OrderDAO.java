package model.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.dto.CustomMealkit;
import model.dto.Customer;
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
	public List<Ingredient> getCustomIngList(Mealkit m){
		List<Ingredient> customIng = m.getIngredients();
		return customIng;
	}
	//�ֹ��� ���� �������
	public Customer getCustomerInfo(int customerId) {
		String sql = "SELECT customername, email, phone, address FROM customer where customerId = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {customerId});
		Customer c = null;
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while(rs.next()) { 
				c = new Customer(rs.getString("customerName"), rs.getString("email"), rs.getString("phone"), rs.getString("address"));
			}
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}
		return c;
	}
	
	//�ֹ� �� ��ȸ
	//�ֹ� ���� ������ �����ֱ� //�ش� ���� ���±��� �ֹ��� ��� ��ŰƮ����Ʈ �����ִ� ��
	public List<CustomMealkit> findOrderList(int customerId) {
	    List<CustomMealkit> orderedItems = new ArrayList<>();
	    String sql = "SELECT c.custommkId, i.quantity, m.mkname, m.mkId, m.defaultCal, m.defaultPrice, " //�������
	    		+ "i.price, i.calorie "
				+ "FROM custommealkit c, mealkit m, custom_mk_view i "
				+ "WHERE c.mkId = m.mkId AND c.custommkId = i.custommkId "
				+ "AND customerId = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {customerId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while(rs.next()) { 
				Mealkit tmp1 = new Mealkit(rs.getInt("mkId"), rs.getString("mkname"), 
						rs.getInt("defaultCal"), rs.getInt("defaultPrice"));
				
				CustomMealkit tmp2 = new CustomMealkit(tmp1, rs.getInt("custommkId"), customerId, rs.getInt("price"), rs.getInt("quantity"), rs.getInt("calorie"));
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
		String sql = "SELECT s.orderId, s.orderdate, s.company, s.trackingnum FROM shippingdetail s, custom_mk_view v WHERE s.orderId=v.orderId AND v.customMkId = ?";
		List<Order> orderList = new ArrayList<>();
		
		int orderId = 0;
		ShippingDetail tmp1 = null;
		String dateShipped = null;
		for(CustomMealkit item : orderedItems) {
			jdbcUtil.setSqlAndParameters(sql, new Object[] {item.getCustomMealkitId()});
			
			try {
				ResultSet rs = jdbcUtil.executeQuery();
				while(rs.next()) {
					dateShipped = String.valueOf(rs.getDate("orderdate"));
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
		List<CustomMealkit> orderingItems = null; //�ش� ���� ��� customMealkit
		Order order = new Order();
		int totalPrice = order.calcTotalPrice(l);
		int customerId = l.get(0).getCustomerId();
		int orderId = 0;
		
		String sql1 = "INSERT INTO MEALKITORDER VALUES(order_seq.NEXTVAL, 0, to_date(sysdate), ?, ?)"; //MEALKITORDER�� �߰�

		Object[] param = new Object[] {customerId, totalPrice};
		jdbcUtil.setSqlAndParameters(sql1, param);
		
		String key[] = {"orderId"}; //MEALKITORDER�� PK�÷���
		try {
			jdbcUtil.executeUpdate(key); //insert�� ����
			ResultSet rs = jdbcUtil.getGeneratedKeys();
			if(rs.next()) {
				orderId = rs.getInt(1); //������ PK ��
			}
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		orderingItems = findOrderList(customerId);
		
		String sql2 = "INSERT INTO ORDEREDMEALKIT VALUES(?, ?, order_mk_seq.NEXTVAL, ?)";//ORDEREDMEALKIT�� �߰�
		
		for(CustomMealkit item : l) {
			int customMkId = item.getCustomMealkitId();
			int quantity = item.getQuantity();
			param = new Object[] {customMkId, orderId, quantity};
			jdbcUtil.setSqlAndParameters(sql2, param);
			
			try {
				int result = jdbcUtil.executeUpdate(); //ó���� ���ڵ� ����
				if(result != 1) {
					jdbcUtil.rollback();
				}
			}catch(Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			}
		}
		
		String sql3 = "INSERT INTO CUSTOMMEALKITING VALUES(?, ?, ?)"; //CUSTOMMEALKITING�� �߰�
		for(CustomMealkit item : l) {
			int custommealkitId = item.getCustomMealkitId();
			List<Ingredient> customIng = getCustomIngList(item.getOriginalMealkit());
			for(Ingredient ing : customIng) {
				param = new Object[] {custommealkitId, ing.getIngId(), ing.getIngQuantity()};
				jdbcUtil.setSqlAndParameters(sql3, param);
				
				try {
					int result = jdbcUtil.executeUpdate(); //ó���� ���ڵ� ����
					if(result != 1) {
						jdbcUtil.rollback();
					}
				}catch(Exception ex) {
					jdbcUtil.rollback();
					ex.printStackTrace();
				}
			}
		}
		
		jdbcUtil.commit();
		jdbcUtil.close();
		return orderingItems;
	}
	
	//�ֹ����
	public int deleteOrder(int orderId) { //void?
		String sql = "UPDATE MEALKITORDER "
				+ "SET status = 3 "
				+"WHERE orderId = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {orderId});
		
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
	
}
