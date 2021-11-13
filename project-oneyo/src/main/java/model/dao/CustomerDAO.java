package model.dao;

import model.dto.Customer;
import java.sql.ResultSet;
import java.sql.SQLException;

// 고객 관리를 위해 DB작업을 전담하는 DAO 클래스
public class CustomerDAO {
	private JDBCUtil jdbcUtil = null;
	
	public CustomerDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	// 고객 테이블에 새로운 고객 생성
	public int create(Customer customer) throws SQLException {
		String sql = "INSERT INTO CUSTOMER VALUES (customer_seq.nextval, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {customer.getCustomerName(), customer.getEmail(), 
				customer.getPassword(), customer.getPhone(), customer.getAddress()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil 에 insert문과 매개 변수 설정
						
		try {				
			int result = jdbcUtil.executeUpdate();	// insert 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback(); 
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;	
	}
	
	// 고객의 정보 수정
	public int update(Customer customer) throws SQLException {
		String sql = "UPDATE CUSTOMER "
					+ "SET customerName=?, password=?, phone=?, address=? "
					+ "WHERE email=?";
		Object[] param = new Object[] {customer.getCustomerName(), customer.getPassword(), customer.getPhone(), 
				customer.getAddress(), customer.getEmail()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil에 update문과 매개 변수 설정
			
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
	
	// 고객 id에 해당하는 고객 삭제
	public int remove(String email) throws SQLException {
		String sql = "DELETE FROM CUSTOMER WHERE email=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {email});	// JDBCUtil에 delete문과 매개 변수 설정

		try {				
			int result = jdbcUtil.executeUpdate();	// delete 문 실행
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
	
	// 주어진 고객 id에 해당하는 정보를 데이터베이스에서 찾아 Customer DTO에 저장하여 반환
	public Customer findCustomer(String email) throws SQLException {
        String sql = "SELECT customerName, password, phone, address "
        			+ "FROM CUSTOMER "
        			+ "WHERE email=?";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {email});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {		
				Customer customer = new Customer(		// Customer 객체를 생성하여 고객 정보를 저장
					rs.getString("customerName"),
					rs.getString("password"),
					rs.getString("phone"),
					rs.getString("address"),
					email);
				return customer;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
}
