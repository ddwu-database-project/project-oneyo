package model.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.dto.CustomMealkit;
import model.dto.Ingredient;
import model.dto.Mealkit;
import model.dto.Order;
public class OrderDAO {
	private JDBCUtil jdbcUtil = null;
	
	public OrderDAO() {
		jdbcUtil = new JDBCUtil();
	}
	//커스텀된 List<Ingredient>가져오기
	public List<Ingredient> getCustomIngList(Mealkit m){
		List<Ingredient> customIng = m.getIngredients();
		return customIng;
	}
	
	//주문 상세 조회
	//주문 내역 페이지 보여주기 //해당 고객이 여태까지 주문한 모든 밀키트리스트 보여주는 것
	public List<CustomMealkit> findOrderList(int customerId) {
	    List<CustomMealkit> orderedItems = new ArrayList<>();
	    String sql = "SELECT c.custommkId, c.quantity, m.mkname, m.mkId, m.defaultCal, m.defaultPrice, "
	    		+ "i.price, i.calorie "
				+ "FROM custommealkit c, mealkit m, custom_ing_view v, custom_mk_view i"
				+ "WHERE c.mkId = m.mkId AND c.custommkId = v.custommkId AND c.custommkId = i.custommkId "
				+ "AND customerId = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {customerId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while(rs.next()) { 
				Mealkit tmp1 = new Mealkit(rs.getInt("mkId"), rs.getString("mkname"), 
						rs.getInt("defaultCal"), rs.getInt("defaultPrice"));
				
				CustomMealkit tmp2 = new CustomMealkit(tmp1, rs.getInt("custommkId"), customerId, rs.getInt("quantity"), rs.getInt("price"), rs.getInt("calorie"));
				orderedItems.add(tmp2);
			}
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}
		
		return orderedItems;
	}
	//주문하기
	//리스트 받아온 것(커스텀밀키트들)을 하나씩 쪼개서 인서트
	
	//매개변수인 l에서 orderId, ingredient 가져오는 것 불가능//generatedKeys()사용해서 orderId가져오기
	public List<CustomMealkit> addOrder(List<CustomMealkit> l){
		List<CustomMealkit> orderingItems = null; //해당 고객의 모든 customMealkit
		Order order = new Order();
		int totalPrice = order.calcTotalPrice(l);
		int customerId = l.get(0).getCustomerId();
		int orderId = 0;
		
		String sql1 = "INSERT INTO MEALKITORDER VALUES(order_seq.NEXTVAL, 0, to_date(sysdate), ?, ?)"; //MEALKITORDER에 추가

		Object[] param = new Object[] {customerId, totalPrice};
		jdbcUtil.setSqlAndParameters(sql1, param);
		
		String key[] = {"orderId"}; //MEALKITORDER의 PK컬럼명
		try {
			jdbcUtil.executeUpdate(key); //insert문 실행
			ResultSet rs = jdbcUtil.getGeneratedKeys();
			if(rs.next()) {
				orderId = rs.getInt(1); //생성된 PK 값
			}
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		orderingItems = findOrderList(customerId);
		
		String sql2 = "INSERT INTO ORDEREDMEALKIT VALUES(?, ?, order_mk_seq.NEXTVAL, ?)";//ORDEREDMEALKIT에 추가
		
		for(CustomMealkit item : l) {
			int customMkId = item.getCustomMealkitId();
			int quantity = item.getQuantity();
			param = new Object[] {customMkId, orderId, quantity};
			jdbcUtil.setSqlAndParameters(sql2, param);
			
			try {
				int result = jdbcUtil.executeUpdate(); //처리된 레코드 개수
				if(result != 1) {
					jdbcUtil.rollback();
				}
			}catch(Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			}
		}
		
		String sql3 = "INSERT INTO CUSTOMMEALKITING VALUES(?, ?, ?)"; //CUSTOMMEALKITING에 추가
		for(CustomMealkit item : l) {
			int custommealkitId = item.getCustomMealkitId();
			List<Ingredient> customIng = getCustomIngList(item.getOriginalMealkit());
			for(Ingredient ing : customIng) {
				param = new Object[] {custommealkitId, ing.getIngId(), ing.getIngQuantity()};
				jdbcUtil.setSqlAndParameters(sql3, param);
				
				try {
					int result = jdbcUtil.executeUpdate(); //처리된 레코드 개수
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
	
	//주문취소
	public int deleteOrder(int orderId) { //void?
		String sql = "UPDATE MEALKITORDER "
				+ "SET status = 3 "
				+"WHERE orderId = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {orderId});
		
		try {				
			int result = jdbcUtil.executeUpdate();	// update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}
}
