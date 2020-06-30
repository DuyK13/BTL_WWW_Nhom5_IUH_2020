package se.iuh.btl.entities;

import javax.persistence.Embeddable;

@Embeddable
public class Address {

	private String houseNumber;
	private String street;
	private String ward;
	private String district;
	private String province;
	public Address(String houseNumber, String street, String ward, String district, String province) {
		super();
		this.houseNumber = houseNumber;
		this.street = street;
		this.ward = ward;
		this.district = district;
		this.province = province;
	}
	public Address() {
		super();
	}
	public String getHouseNumber() {
		return houseNumber;
	}
	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getWard() {
		return ward;
	}
	public void setWard(String ward) {
		this.ward = ward;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	@Override
	public String toString() {
		return "Address [houseNumber=" + houseNumber + ", street=" + street + ", ward=" + ward + ", district="
				+ district + ", province=" + province + "]";
	}
}
