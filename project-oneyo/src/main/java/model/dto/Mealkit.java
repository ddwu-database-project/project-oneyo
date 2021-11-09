package model.dto;

public class Mealkit {
	private int mkId;
	private String mkName;
	private int defaultCal;
	private int defaultPrice;
	
	public Mealkit() {}
	
	public Mealkit(int mkId, String mkName, int defaultCal, int defaultPrice) {
		this.mkId = mkId;
		this.mkName = mkName;
		this.defaultCal = defaultCal;
		this.defaultPrice = defaultPrice;
	}
	
	public int getMkId() {
		return mkId;
	}
	public void setMkId(int mkId) {
		this.mkId = mkId;
	}
	public String getMkName() {
		return mkName;
	}
	public void setMkName(String mkName) {
		this.mkName = mkName;
	}
	public int getDefaultCal() {
		return defaultCal;
	}
	public void setDefaultCal(int defaultCal) {
		this.defaultCal = defaultCal;
	}
	public int getDefaultPrice() {
		return defaultPrice;
	}
	public void setDefaultPrice(int defaultPrice) {
		this.defaultPrice = defaultPrice;
	}
	
}
