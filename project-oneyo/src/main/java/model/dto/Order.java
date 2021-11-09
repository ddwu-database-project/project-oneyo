package model.dto;
//주문 관리를 위해 필요한 도메인 클래스(VO) + a = DTO. MealkitOrder 테이블과 대응됨.

public class Order {
	private int orderId;
	private int customerId;
	private int status;
	private String orderDate;
	 

	public Order() {}


	public Order(int orderId, int customerId, int status, String orderDate) {
		super();
		this.orderId = orderId;
		this.customerId = customerId;
		this.status = status;
		this.orderDate = orderDate;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
}
