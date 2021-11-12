package model.dto;

import java.util.List;

public class Order {
	private int orderId;
	private int customerId;
	private int status;
	private String orderDate;
	private ShippingDetail shippingDetail;
	private List<CustomMealkit> orderCustomMk;

	public Order() {}

	
	
	public List<CustomMealkit> getOrderCustomMk() {
		return orderCustomMk;
	}



	public void setOrderCustomMk(List<CustomMealkit> orderCustomMk) {
		this.orderCustomMk = orderCustomMk;
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
	
	public int calcCalorie(List<CustomMealkit> l) {
		int result = 0;
		for(CustomMealkit item : l) {
			result += item.getTotalCalorie();
		}
		return result;
	}
	public int calcTotalPrice(List<CustomMealkit> l) {
		int result = 0;
		for(CustomMealkit item : l) {
			result += item.getPrice();
		}
		return result;
	}
}
