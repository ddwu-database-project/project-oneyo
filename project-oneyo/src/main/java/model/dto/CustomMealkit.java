package model.dto;

import java.util.List;

public class CustomMealkit {

	private Mealkit mealkitInfo;
	private int customMealkitId;
	private int customerId;
	private int quantity;			
	private int price;			
	private int totalCalorie;
	private List<Ingredient> ingredients;	
	
	public CustomMealkit(Mealkit mealkitInfo, int customerId, int price, int quantity, int totalCalorie, List<Ingredient> ingredient)
	{
		this.mealkitInfo = mealkitInfo;
		this.customerId = customerId;
		this.quantity = quantity;
		this.price = price;
		this.totalCalorie = totalCalorie;
		this.ingredients = ingredient;
	}

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
	public List<Ingredient> getIngredients() {
		return ingredients;
	}

	public void setIngredients(List<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}
	
	public String printIng() {
		List<Ingredient> ingList = mealkitInfo.getIngredients();
		String result = "";
		for (Ingredient ing : ingList) {
			if (ing != ingList.get(0))
				result += ", ";
			result += ing.getIngName() + "(" + ing.getIngQuantity() + "°³)";
		}
		return result;
	}
}
