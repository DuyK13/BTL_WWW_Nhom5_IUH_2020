package se.iuh.btl.entities;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.MapsId;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "BillDetail")
public class BillDetail implements Serializable{

	private static final long serialVersionUID = 1569042832156018465L;

	@EmbeddedId
	private BillDetail_PK pk;

	@MapsId("id")
	private Bill bill;

	@MapsId("id")
	private Chocolate chocolate;
	
	private int quantity;

	public BillDetail_PK getPk() {
		return pk;
	}

	public void setPk(BillDetail_PK pk) {
		this.pk = pk;
	}

	public void setChocolate(Chocolate chocolate) {
		this.chocolate = chocolate;
	}

	public BillDetail(BillDetail_PK pk, int quantity) {
		super();
		this.pk = pk;
		this.quantity = quantity;
	}

	public BillDetail() {
		super();
	}

	public BillDetail_PK getId() {
		return pk;
	}

	public void setId(BillDetail_PK pk) {
		this.pk = pk;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Transient
	public Bill getBill() {
		return getId().getBill();
	}

	public void setBill(Bill bill) {
		getId().setBill(bill);
	}

	@Transient
	public Chocolate getChocolate() {
		return getId().getChocolate();
	}

	public void setBill(Chocolate chocolate) {
		getId().setChocolate(chocolate);
	}

	@Override
	public String toString() {
		return "BillDetail [pk=" + pk + ", quantity=" + quantity + "]";
	}
}
