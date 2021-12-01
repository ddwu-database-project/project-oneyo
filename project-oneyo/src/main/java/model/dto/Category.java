package model.dto;

public class Category {
	private int categoryId;
	private String name;
	
	public Category(int ctgId, String ctgName) {
		this.categoryId = ctgId;
		this.name = ctgName;
	}
	
	public Category(int ctgId) {
		this(ctgId, "");
	}
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
