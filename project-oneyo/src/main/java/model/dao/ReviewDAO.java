package model.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.dto.Review;

public class ReviewDAO {
	private JDBCUtil jdbcUtil = null;
	
	public ReviewDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public List<Review> getAll(int mkId){
		List<Review> all = new ArrayList<>();
		String sql = "SELECT r.reviewid, r.reviewwrites, o.orderdate, c.customername, m.mkid FROM review r, mealkitorder o, customer c, mealkit m, custommealkit cm "
				+ "WHERE r.orderid = o.orderid AND o.customerid = c.customerid AND m.mkid = cm.mkid and cm.custommkid = r.custommkid and m.mkid = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {mkId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while(rs.next()) { 
				Review tmp = new Review(rs.getInt("reviewid"), rs.getString("orderdate"), rs.getString("reviewwrites"), rs.getString("customername"));
				all.add(tmp);
			}
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();	
		}
		
		return all;
	}
	
	public boolean checkIfOverlap(int customMkId) {
		String sql = "SELECT custommkId FROM REVIEW WHERE custommkId = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {customMkId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while(rs.next()) { 
				if(rs.getInt("custommkId") == customMkId)
					return false;
			}
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();	
		}
		return true;
	}
	
	public void newReview(Review r) {
		String sql = "INSERT INTO REVIEW VALUES(review_seq.nextval, ?, ?, ?, ?)";
		int result = 0;
		Object[] param = new Object[] { r.getCustomMealkitId(),r.getReviewWrites(),r.getOrderId(),r.getCustomerId()};
		
		jdbcUtil.setSqlAndParameters(sql, param);
		try {
			result = jdbcUtil.executeUpdate();
			if(result != 1) {
				jdbcUtil.rollback();
			}
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
	}
}
