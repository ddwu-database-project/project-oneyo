package model.dto;

public class Review {
	private int reviewId;
	private int customMealkitId;
	private String orderdate;
	private String reviewWrites;
	private String cname;
	private int orderId;
	private int customerId;
	
	
	
	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getReviewId() {
		return reviewId;
	}
	
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public int getCustomMealkitId() {
		return customMealkitId;
	}
	public void setCustomMealkitId(int customMealkitId) {
		this.customMealkitId = customMealkitId;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getReviewWrites() {
		return reviewWrites;
	}
	public void setReviewWrites(String reviewWrites) {
		this.reviewWrites = reviewWrites;
	}
	public Review(int reviewId, String orderdate, String reviewWrites, String cname, int customerId) {
		this.reviewId = reviewId;
		this.orderdate = orderdate;
		this.reviewWrites = reviewWrites;
		this.cname = cname;
		this.customerId = customerId;
	}

	public Review() {
		super();
	}

}
