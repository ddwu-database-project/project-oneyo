package model.dao;

import java.sql.SQLException;

import model.dto.Customer;

public class AllergyDAO {
	private JDBCUtil jdbcUtil = null;
	
	public AllergyDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public int create(int cId, int aId) throws SQLException {
		String sql = "INSERT INTO ALLERGY VALUES (?, ?)";		
		Object[] param = new Object[] {cId, aId};				
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
}
