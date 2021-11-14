package model.dto;

public class Ingredient {
	private int ingId;
	private String ingName;
	private int ingPrice;
	private int ingCalorie;
	private int ingQuantity;
	private Category Category;
	
	public Ingredient() {}
	
	public Ingredient(String ingName, int ingPrice, int ingCalorie, int ingQuantity) {
		this.ingName = ingName;
		this.ingPrice = ingPrice;
		this.ingCalorie = ingCalorie;
		this.ingQuantity = ingQuantity;
	}
	
	public Ingredient(int ingId, String ingName, int ingPrice, int ingCalorie, int ingQuantity) {
		this.ingId = ingId;
		this.ingName = ingName;
		this.ingPrice = ingPrice;
		this.ingCalorie = ingCalorie;
		this.ingQuantity = ingQuantity;
	}
	
	public Ingredient(int ingId, String ingName, int ingPrice, int ingCalorie, int ingQuantity, Category Category) {
		this.ingId = ingId;
		this.ingName = ingName;
		this.ingPrice = ingPrice;
		this.ingCalorie = ingCalorie;
		this.ingQuantity = ingQuantity;
		this.Category = Category;
	}
	
	public int getIngId() {
		return ingId;
	}
	public void setIngId(int ingId) {
		this.ingId = ingId;
	}
	public String getIngName() {
		return ingName;
	}
	public void setIngName(String ingName) {
		this.ingName = ingName;
	}
	public int getIngPrice() {
		return ingPrice;
	}
	public void setIngPrice(int ingPrice) {
		this.ingPrice = ingPrice;
	}
	public int getIngCalorie() {
		return ingCalorie;
	}
	public void setIngCalorie(int ingCalorie) {
		this.ingCalorie = ingCalorie;
	}
	public int getIngQuantity() {
		return ingQuantity;
	}
	public void setIngQuantity(int ingQuantity) {
		this.ingQuantity = ingQuantity;
	}
	public Category getCategory() {
		return Category;
	}
	public void setCategory(Category category) {
		Category = category;
	}
	
	public String toString() {
		return "재료명: " + this.getIngName() + ", 개수: " + this.getIngQuantity() + ", 가격: " + this.getIngPrice() +
				", 칼로리: " + this.getIngCalorie();
	}
	
	

}
