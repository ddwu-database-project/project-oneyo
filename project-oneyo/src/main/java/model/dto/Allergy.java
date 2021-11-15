package model.dto;

public class Allergy {
	private int customerId;
	private int ingId;
	private String ingName;
	
	public Allergy(int customerId, int ingId, String ingName) {
		this.customerId = customerId;
		this.ingId = ingId;
		this.ingName = ingName;
	}
	
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getIngId() {
		return ingId;
	}
	public void setIngId(int ingId) {
		this.ingId = ingId;
	}
	public String getIngName() {
		return ingName;
	}
	public void setIngName(String ingName) {
		this.ingName = ingName;
	}
	
}
