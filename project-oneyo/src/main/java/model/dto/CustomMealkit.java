package model.dto;

import java.util.ArrayList;
import java.util.List;

public class CustomMealkit {

	private Mealkit mealkitInfo;
	private int customMealkitId;
	private int customerId;
	private int quantity;			
	private int price;		
	private int calorie;
	private int sharestatus;
	private List<Ingredient> ingredients;
	

	public CustomMealkit(Mealkit mealkitInfo, int customMealkitId, int customerId, int quantity, int price, int calorie, List<Ingredient> ingredients) {
		this.mealkitInfo = mealkitInfo;
		this.customMealkitId = customMealkitId;
		this.customerId = customerId;
		this.quantity = quantity;
		this.price = price;
		this.calorie = calorie;
		this.ingredients = ingredients;
	}
	
	public CustomMealkit(Mealkit mealkitInfo, int customerId) {
		this(mealkitInfo, 0, customerId, 0, 0, 0, new ArrayList<Ingredient>());
	}
	
	public CustomMealkit(Mealkit mealkitInfo, int customerId, int price, int quantity, int totalCalorie, List<Ingredient> ingredient)
	{
		this(mealkitInfo, 0, customerId, quantity, price, totalCalorie, ingredient);
	}

	public CustomMealkit(Mealkit mealkitInfo, int customMkId, int customerId, int price, int quantity, int totalCalorie)
	{
		this(mealkitInfo, customMkId, customerId, quantity, price, totalCalorie, new ArrayList<Ingredient>());
	}
	
	public CustomMealkit(int customMkId, Mealkit mealkitInfo, int price, int quantity, int calorie, int sharestatus)
	{
		this(mealkitInfo, customMkId, 0, quantity, price, calorie, new ArrayList<Ingredient>());
	}
	
	public CustomMealkit(int customMkId, Mealkit mealkitInfo, int price, int quantity, int sharestatus)
	{
		this(mealkitInfo, customMkId, 0, quantity, price, 0, new ArrayList<Ingredient>());
		this.sharestatus = sharestatus;
	}
	
	public CustomMealkit(Mealkit mealkitInfo, int customerId, int customMkId, int price, int calorie) {
		this(mealkitInfo, customMkId, customerId, 0, price, calorie, new ArrayList<Ingredient>());
	}

	public CustomMealkit(Mealkit mealkitInfo, int customMkId, int price, int quantity) {
		this(mealkitInfo, customMkId, 0, price, quantity, 0);
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
		return calorie;
	}
	public void setTotalCalorie(int totalCalorie) {
		this.calorie = totalCalorie;
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
			result += ing.getIngName() + "(" + ing.getIngQuantity() + "개)";
		}
		return result;
	}
	
	public String printCustomIng() {
		String result = "";
		for (Ingredient ing : ingredients) {
			if (ing != ingredients.get(0))
				result += ", ";
			result += ing.getIngName() + "(" + ing.getIngQuantity() + "개)";
		}
		return result;
	}

	public int getSharestatus() {
		return sharestatus;
	}

	public void setSharestatus(int sharestatus) {
		this.sharestatus = sharestatus;
	}
}
