package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IngredientDAO {
	private JDBCUtil jdbcUtil = null;
	
	public IngredientDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public List<String> findIngList(String ingName) throws SQLException {
        String sql = "SELECT INGNAME " 
        		   + "FROM INGREDIENT "
        		   + "WHERE INGNAME LIKE '%' || ? || '%'";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {ingName});		// JDBCUtil�� query�� ����
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query ����			
			List<String> ingList = new ArrayList<String>();	// ������ ����Ʈ ����
			while (rs.next()) {
				String ing = rs.getString("INGNAME");
				ingList.add(ing);				// List�� ��� �̸� ����
			}		
			return ingList;					
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
}
