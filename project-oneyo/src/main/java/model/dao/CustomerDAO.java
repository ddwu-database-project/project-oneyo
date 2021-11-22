package model.dao;

import model.dto.Customer;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO {
	private JDBCUtil jdbcUtil = null;
	
	public CustomerDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public int create(Customer customer) throws SQLException {
		String sql = "INSERT INTO CUSTOMER VALUES (customer_seq.nextval, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {customer.getCustomerName(), customer.getEmail(), 
				customer.getPassword(), customer.getPhone(), customer.getAddress()};				
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
	
	public int update(Customer customer) throws SQLException {
		String sql = "UPDATE CUSTOMER "
					+ "SET customerName=?, password=?, phone=?, address=? "
					+ "WHERE email=?";
		Object[] param = new Object[] {customer.getCustomerName(), customer.getPassword(), customer.getPhone(), 
				customer.getAddress(), customer.getEmail()};				
		jdbcUtil.setSqlAndParameters(sql, param);	
			
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
	
	public int remove(String email) throws SQLException {
		String sql = "DELETE FROM CUSTOMER WHERE email=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {email});	

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
	
	public Customer findCustomer(String email) throws SQLException {
        String sql = "SELECT customerId, customerName, password, phone, address "
        			+ "FROM CUSTOMER "
        			+ "WHERE email=?";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {email});	

		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			if (rs.next()) {		
				Customer customer = new Customer(		
					rs.getInt("customerId"),
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
			jdbcUtil.close();		
		}
		return null;
	}
	
	public String findNameById(int id) throws SQLException {
        String sql = "SELECT customerName "
        			+ "FROM CUSTOMER "
        			+ "WHERE customerId=?";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {id});	

		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			if (rs.next()) {		
				return rs.getString("customerName");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}
}
