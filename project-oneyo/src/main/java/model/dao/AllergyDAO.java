package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.Allergy;
import model.dto.Customer;

public class AllergyDAO {
	private JDBCUtil jdbcUtil = null;
	
	public AllergyDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public int create(int cId, int aId) throws SQLException {
		String sql = "INSERT INTO ALLERGY VALUES (?, ?)";		
		Object[] param = new Object[] {cId, aId};				
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
	
	public int remove(int cId) throws SQLException {
		String sql = "DELETE FROM ALLERGY WHERE customerId=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {cId});

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
	
	public List<Allergy> findAllergyList(int cId) throws SQLException {
        String sql = "SELECT A.CUSTOMERID, A.INGID, I.INGNAME " 
        		   + "FROM ALLERGY A, INGREDIENT I "
        		   + "WHERE A.INGID = I.INGID AND A.CUSTOMERID = ?" ;
		jdbcUtil.setSqlAndParameters(sql, new Object[] {cId});		
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();						
			List<Allergy> allergyList = new ArrayList<Allergy>();	
			while (rs.next()) {
				Allergy allergy = new Allergy(
						rs.getInt("CUSTOMERID"),
						rs.getInt("INGID"),
						rs.getString("INGNAME"));
				allergyList.add(allergy);		
			}		
			return allergyList;							
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}
}
