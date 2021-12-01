package model.dto;

import java.util.ArrayList;
import java.util.List;

public class Mealkit {
	private int mkId;
	private String mkName;
	private int defaultCal;
	private int defaultPrice;
	private Category Category;
	private List<Ingredient> ingredients;	
	
	public Mealkit(int mkId, String mkName) {
		this.mkId = mkId;
		this.mkName = mkName;
		ingredients = new ArrayList<>();
	}
	public Mealkit(int mkId, String mkName, int defaultCal, int defaultPrice) {
		this.mkId = mkId;
		this.mkName = mkName;
		this.defaultCal = defaultCal;
		this.defaultPrice = defaultPrice;
		ingredients = new ArrayList<>();
	}
	
	public Mealkit(String mkName, int deCal, int dePrice, Category cat) {
		this(0, mkName, deCal, dePrice);
		this.Category = cat;
	}
	public Mealkit() {
		super();
	}
	public int getMkId() {
		return mkId;
	}
	public void setMkId(int mkId) {
		this.mkId = mkId;
	}
	public String getMkName() {
		return mkName;
	}
	public void setMkName(String mkName) {
		this.mkName = mkName;
	}
	public int getDefaultCal() {
		return defaultCal;
	}
	public void setDefaultCal(int defaultCal) {
		this.defaultCal = defaultCal;
	}
	public int getDefaultPrice() {
		return defaultPrice;
	}
	public void setDefaultPrice(int defaultPrice) {
		this.defaultPrice = defaultPrice;
	}
	public Category getCategory() {
		return Category;
	}
	public void setCategory(Category category) {
		Category = category;
	}

	public List<Ingredient> getIngredients() {
		return ingredients;
	}

	public void setIngredients(List<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}
}
