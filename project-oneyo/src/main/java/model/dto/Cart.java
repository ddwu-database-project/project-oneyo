package model.dto;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private int cartId;
	private int customerId;
	private List<CustomMealkit> customMealkits;
	
	public Cart() {
		customMealkits = new ArrayList<>();
	}

	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public List<CustomMealkit> getCustomMealkits() {
		return customMealkits;
	}
	public void setCustomMealkits(List<CustomMealkit> customMealkits) {
		this.customMealkits = customMealkits;
	}

	public int getTotalPrice() {
		int totalPrice = 0;
		for (CustomMealkit cm : customMealkits) {
			totalPrice += cm.getPrice() * cm.getQuantity();
		}
		return totalPrice;
	}
}
