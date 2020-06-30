package se.iuh.btl.entities;

public class CartChocolate {
	private int id;
	private String name;
	private double cost;
	private String image;
	private int discount;
	private int quantity;
	private double total;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		total = cost*quantity;
	}

	public CartChocolate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public CartChocolate(int id, String name, double cost, String image, int discount, int quantity, double total) {
		super();
		this.id = id;
		this.name = name;
		this.cost = cost;
		this.image = image;
		this.discount = discount;
		this.quantity = quantity;
		this.total = total;
	}
	public CartChocolate(int id)
	{
		this(id,"",0.0,"",0,0,0.0);
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartChocolate other = (CartChocolate) obj;
		if (id != other.id)
			return false;
		return true;
	}
	public CartChocolate(int id, int quantity) {
		// TODO Auto-generated constructor stub
		this.id= id;
		this.quantity=quantity;
	}
	@Override
	public String toString() {
		return "CartChocolate [id=" + id + ", name=" + name + ", cost=" + cost + ", image=" + image + ", discount="
				+ discount + ", quantity=" + quantity + ", total=" + total + "]";
	}

	
}
