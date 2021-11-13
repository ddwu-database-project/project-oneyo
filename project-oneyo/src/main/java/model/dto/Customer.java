package model.dto;

public class Customer {
	private int customerId;
	private String customerName;
	private String password;
	private String phone;
	private String address;
	private String email;
//	private List<Ingredient> allergy;
	
	public Customer(String customerName, String password, String phone, String address, String email) {
		this.customerName = customerName;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}
	
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.password.equals(password);
	}
 
}
