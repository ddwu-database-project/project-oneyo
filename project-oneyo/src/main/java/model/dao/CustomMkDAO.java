package model.dao;

import java.sql.SQLException;

import model.dto.CustomMealkit;

public class CustomMkDAO {

	private ConnectionManager connManager;
	private JDBCUtil jdbcUtil;
	
	public CustomMkDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connManager = new ConnectionManager();
			jdbcUtil = new JDBCUtil();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
	}
	
	public int create(CustomMealkit customMk) throws SQLException {
		String sql = ""
	}
}
