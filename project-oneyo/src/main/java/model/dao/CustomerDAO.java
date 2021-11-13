package model.dao;

import model.dto.Customer;
import java.sql.ResultSet;
import java.sql.SQLException;

// �� ������ ���� DB�۾��� �����ϴ� DAO Ŭ����
public class CustomerDAO {
	private JDBCUtil jdbcUtil = null;
	
	public CustomerDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	// �� ���̺� ���ο� �� ����
	public int create(Customer customer) throws SQLException {
		String sql = "INSERT INTO CUSTOMER VALUES (customer_seq.nextval, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {customer.getCustomerName(), customer.getEmail(), 
				customer.getPassword(), customer.getPhone(), customer.getAddress()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil �� insert���� �Ű� ���� ����
						
		try {				
			int result = jdbcUtil.executeUpdate();	// insert �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback(); 
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}		
		return 0;	
	}
	
	// ���� ���� ����
	public int update(Customer customer) throws SQLException {
		String sql = "UPDATE CUSTOMER "
					+ "SET customerName=?, password=?, phone=?, address=? "
					+ "WHERE email=?";
		Object[] param = new Object[] {customer.getCustomerName(), customer.getPassword(), customer.getPhone(), 
				customer.getAddress(), customer.getEmail()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil�� update���� �Ű� ���� ����
			
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
	
	// �� id�� �ش��ϴ� �� ����
	public int remove(String email) throws SQLException {
		String sql = "DELETE FROM CUSTOMER WHERE email=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {email});	// JDBCUtil�� delete���� �Ű� ���� ����

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
	
	// �־��� �� id�� �ش��ϴ� ������ �����ͺ��̽����� ã�� Customer DTO�� �����Ͽ� ��ȯ
	public Customer findCustomer(String email) throws SQLException {
        String sql = "SELECT customerName, password, phone, address "
        			+ "FROM CUSTOMER "
        			+ "WHERE email=?";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {email});	// JDBCUtil�� query���� �Ű� ���� ����

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
			if (rs.next()) {		
				Customer customer = new Customer(		// Customer ��ü�� �����Ͽ� �� ������ ����
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
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
}
