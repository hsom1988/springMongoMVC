package com.delivery.persistance;

public class Package {

	private double weight;
	private String type;

	private String description;

	public Package() {
	}

	public Package(double weight, String description) {
		super();
		this.weight = weight;
		this.description = description;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
