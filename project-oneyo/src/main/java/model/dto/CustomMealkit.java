package model.dto;

public class CustomMealkit {
	private Mealkit mealkitInfo;
	private int customMealkitId;
	private int customerId;
	private int quantity;			
	private int price;			
	private int totalCalorie;
	
	public CustomMealkit(Mealkit mealkitInfo, int customMkId, int customerId, int price, int quantity, int totalCalorie)
	{
		this.mealkitInfo = mealkitInfo;
		this.customMealkitId = customMkId;
		this.customerId = customerId;
		this.quantity = quantity;
		this.price = price;
		this.totalCalorie = totalCalorie;
	}
	
	public CustomMealkit(int customMkId, Mealkit mealkitInfo, int price, int quantity)
	{
		this.customMealkitId = customMkId;
		this.mealkitInfo = mealkitInfo;
		this.quantity = quantity;
		this.price = price;
	}
	
	public Mealkit getOriginalMealkit() {
		return mealkitInfo;
	}
	public void setOriginalMealkit(Mealkit originalMealkit) {
		this.mealkitInfo = originalMealkit;
	}
	public int getCustomMealkitId() {
		return customMealkitId;
	}
	public void setCustomMealkitId(int cusotmMealkitId) {
		this.customMealkitId = cusotmMealkitId;
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
