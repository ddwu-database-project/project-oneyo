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
	
	public Ingredient(int ingId, String ingName, int ingPrice, int ingCalorie) {
		this.ingId = ingId;
		this.ingName = ingName;
		this.ingPrice = ingPrice;
		this.ingCalorie = ingCalorie;
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
	
	public Ingredient(int ingId, String ingName, Category category) {
		this(ingId, ingName, 0, 0, 0, category);
	}
	
	public Ingredient(String ingName, int ingPrice, int ingCalorie, Category category) {
		this(0, ingName, ingPrice, ingCalorie, 0, category);
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

}
