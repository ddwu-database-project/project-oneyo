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
	private String full_intro;
	private String short_intro;
	private String dir = null;
	private String filename = null;
	
	public Mealkit(int mkId, String mkName, int defaultCal, int defaultPrice, Category category,
			List<Ingredient> ingredients, String full_intro, String short_intro, String dir, String filename) {
		super();
		this.mkId = mkId;
		this.mkName = mkName;
		this.defaultCal = defaultCal;
		this.defaultPrice = defaultPrice;
		Category = category;
		this.ingredients = ingredients;
		this.full_intro = full_intro;
		this.short_intro = short_intro;
		this.dir = dir;
		this.filename = filename;
	}
	
	public Mealkit(int mkId, String mkName, int defaultCal, int defaultPrice, Category category, String full_intro,
			String short_intro, String dir, String filename) {
		this(mkId, mkName, defaultCal, defaultPrice, category, null, full_intro, short_intro, dir, filename);
	}
	
	public Mealkit(String mkName, int defaultCal, int defaultPrice, Category category, String full_intro,
			String short_intro, String dir, String filename) {
		this(0, mkName, defaultCal, defaultPrice, category, null, full_intro, short_intro, dir, filename);
	}

	public Mealkit(int mkId, String mkName, int defaultCal, int defaultPrice, Category category,
			List<Ingredient> ingredients) {
		this.mkId = mkId;
		this.mkName = mkName;
		this.defaultCal = defaultCal;
		this.defaultPrice = defaultPrice;
		Category = category;
		this.ingredients = ingredients;
	}
	
	public Mealkit(int mkId, String mkName, int defaultCal, int defaultPrice, Category category) {
		super();
		this.mkId = mkId;
		this.mkName = mkName;
		this.defaultCal = defaultCal;
		this.defaultPrice = defaultPrice;
		Category = category;
	}

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
	
	public Mealkit(int mkId, String mkName, int defaultCal, int defaultPrice, String full_intro, String short_intro,
			String dir, String filename) {
		this.mkId = mkId;
		this.mkName = mkName;
		this.defaultCal = defaultCal;
		this.defaultPrice = defaultPrice;
		ingredients = new ArrayList<>();
		this.full_intro = full_intro;
		this.short_intro = short_intro;
		this.dir = dir;
		this.filename = filename;
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
	public String getFull_intro() {
		return full_intro;
	}
	public void setFull_intro(String full_intro) {
		this.full_intro = full_intro;
	}
	public String getShort_intro() {
		return short_intro;
	}
	public void setShort_intro(String short_intro) {
		this.short_intro = short_intro;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
}
