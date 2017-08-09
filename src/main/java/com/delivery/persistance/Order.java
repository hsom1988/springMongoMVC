package com.delivery.persistance;

import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Order {

	//@GeneratedValue(generator = "uuid")
    //@GenericGenerator(name = "uuid", strategy = "uuid2")
	//@Column(name = "uuid", unique = true)
	//private String uuid;
	
	@Id
	private String id;
	
    private Client client_id;
	
	private String nameReceiver;
	private String ciReceiver;
	private String number;
	private String destiny;
    private float price;
    private String priority;
	private Date date;
	
	private List<Package> packages;

	private String state;
	
	
	public Order() {
	}
	
	public Order(String id, Client client_id, String nameReceiver, String ciReceiver, String number, String destiny,
			float price, String priority, Date date, List<Package> packages) {
		super();
		this.id = id;
		this.client_id = client_id;
		this.nameReceiver = nameReceiver;
		this.ciReceiver = ciReceiver;
		this.number = number;
		this.destiny = destiny;
		this.price = price;
		this.priority = priority;
		this.date = date;
		this.packages = packages;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Client getClient_id() {
		return client_id;
	}

	public void setClient_id(Client client_id) {
		this.client_id = client_id;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getNameReceiver() {
		return nameReceiver;
	}

	public void setNameReceiver(String nameReceiver) {
		this.nameReceiver = nameReceiver;
	}

	public String getCiReceiver() {
		return ciReceiver;
	}

	public void setCiReceiver(String ciReceiver) {
		this.ciReceiver = ciReceiver;
	}

	public List<Package> getPackages() {
		return packages;
	}

	public void setPackages(List<Package> packages) {
		this.packages = packages;
	}
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getDestiny() {
		return destiny;
	}

	public void setDestiny(String destiny) {
		this.destiny = destiny;
	}

	public String getId() {
		return this.id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
}