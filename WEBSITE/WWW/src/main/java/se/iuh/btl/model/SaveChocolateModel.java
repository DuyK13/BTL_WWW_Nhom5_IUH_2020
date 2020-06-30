package se.iuh.btl.model;

import java.util.List;

import se.iuh.btl.entities.BillDetail;
import se.iuh.btl.entities.Category;

public class SaveChocolateModel {

	private int id;
	private String name;
	private int amount;
	private double cost;
	private String description;
	private int discount;

	public SaveChocolateModel(int id, String name, int amount, double cost, String description, int discount) {
		super();
		this.id = id;
		this.name = name;
		this.amount = amount;
		this.cost = cost;
		this.description = description;
		this.discount = discount;
	}

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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}
}
