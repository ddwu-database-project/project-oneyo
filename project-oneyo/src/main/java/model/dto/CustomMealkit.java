package model.dto;

import java.util.List;

public class CustomMealkit {
	private Mealkit originalMealkit;
	private int cusotmMealkitId;
	private int customerId;
	private int quantity;			
	private int price;			
	private int totalCalorie;
	
	public Mealkit getOriginalMealkit() {
		return originalMealkit;
	}
	public void setOriginalMealkit(Mealkit originalMealkit) {
		this.originalMealkit = originalMealkit;
	}
	public int getCusotmMealkitId() {
		return cusotmMealkitId;
	}
	public void setCusotmMealkitId(int cusotmMealkitId) {
		this.cusotmMealkitId = cusotmMealkitId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotalCalorie() {
		return totalCalorie;
	}
	public void setTotalCalorie(int totalCalorie) {
		this.totalCalorie = totalCalorie;
	}
	
}