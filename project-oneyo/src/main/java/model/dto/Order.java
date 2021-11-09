package model.dto;
//�ֹ� ������ ���� �ʿ��� ������ Ŭ����(VO) + a = DTO. MealkitOrder ���̺��� ������.

public class Order {
	private int orderId;
	private int customerId;
	private int status;
	private String orderDate;
	private ShippingDetail shippingDetail;

	public Order() {}


	public Order(int orderId, int customerId, int status, String orderDate) {
		super();
		this.orderId = orderId;
		this.customerId = customerId;
		this.status = status;
		this.orderDate = orderDate;
	}

	

	public Order(int orderId, int customerId, int status, String orderDate, ShippingDetail shippingDetail) {
		super();
		this.orderId = orderId;
		this.customerId = customerId;
		this.status = status;
		this.orderDate = orderDate;
		this.shippingDetail = shippingDetail;
	}

	
	
	public ShippingDetail getShippingDetail() {
		return shippingDetail;
	}


	public void setShippingDetail(ShippingDetail shippingDetail) {
		this.shippingDetail = shippingDetail;
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