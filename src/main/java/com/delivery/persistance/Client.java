package com.delivery.persistance;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Client {
	
	/*@GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
	@Column(name = "uuid", unique = true)
	private String uuid;*/
	
	@Id
	private String id;
 
    @Indexed(unique = true, dropDups=true)
    private String cedula;
    
    private String contactName;
    private String cellphone_number;
    private String phone_number;
    private String address;
    
    public Client() {
	}
    
    public Client(String id, String firstname, String lastname, String cedula, String cellphone_number,
			String phone_number, String address) {
		super();
		this.id = id;
		this.contactName = firstname;
		this.cedula = cedula;
		this.cellphone_number = cellphone_number;
		this.phone_number = phone_number;
		this.address = address;
	}

	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}

	public String getCellphone_number() {
		return cellphone_number;
	}

	public void setCellphone_number(String cellphone_number) {
		this.cellphone_number = cellphone_number;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
}
