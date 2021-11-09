package model.dto;

public class Ingredient {
	private int ingId;
	private String ingName;
	private int price;
	private int calory;
	
	public Ingredient() {}
	
	public Ingredient(int ingId, String ingName, int price, int calory) {
		this.ingId = ingId;
		this.ingName = ingName;
		this.price = price;
		this.calory = calory;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCalory() {
		return calory;
	}
	public void setCalory(int calory) {
		this.calory = calory;
	}
	

}
