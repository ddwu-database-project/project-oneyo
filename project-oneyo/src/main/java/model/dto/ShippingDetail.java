package model.dto;

public class ShippingDetail {
	private String dateShipped;
	private String company;
	private int trackingNum;
	
	public String getDateShipped() {
		return dateShipped;
	}
	public void setDateShipped(String dateShipped) {
		this.dateShipped = dateShipped;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getTrackingNum() {
		return trackingNum;
	}
	public void setTrackingNum(int trackingNum) {
		this.trackingNum = trackingNum;
	}
	public ShippingDetail(String dateShipped, String company, int trackingNum) {
		super();
		this.dateShipped = dateShipped;
		this.company = company;
		this.trackingNum = trackingNum;
	}
	
}
