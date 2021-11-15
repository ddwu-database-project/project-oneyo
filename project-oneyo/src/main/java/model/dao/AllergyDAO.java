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
	
	/*
	public List<User> findAllergyList() throws SQLException {
        String sql = "SELECT userId, name, email, NVL(commId,0) AS commId, cName " 
        		   + "FROM USERINFO u LEFT OUTER JOIN Community c ON u.commId = c.cId "
        		   + "ORDER BY userId";
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<User> userList = new ArrayList<User>();	// User들의 리스트 생성
			while (rs.next()) {
				User user = new User(			// User 객체를 생성하여 현재 행의 정보를 저장
					rs.getString("userId"),
					null,
					rs.getString("name"),
					rs.getString("email"),
					null,
					rs.getInt("commId"),
					rs.getString("cName"));
				userList.add(user);				// List에 User 객체 저장
			}		
			return userList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}*/
}
