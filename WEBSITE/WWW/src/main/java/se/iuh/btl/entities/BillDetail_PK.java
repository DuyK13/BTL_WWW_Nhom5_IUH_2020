package se.iuh.btl.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

@Embeddable
public class BillDetail_PK implements Serializable {

	private static final long serialVersionUID = 8549084451106277688L;
	@ManyToOne(cascade = CascadeType.ALL)
	private Bill bill;
	@ManyToOne(cascade = CascadeType.ALL)
	private Chocolate chocolate;

	public BillDetail_PK(Bill bill, Chocolate chocolate) {
		super();
		this.bill = bill;
		this.chocolate = chocolate;
	}

	public BillDetail_PK() {
		super();
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public Chocolate getChocolate() {
		return chocolate;
	}

	public void setChocolate(Chocolate chocolate) {
		this.chocolate = chocolate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bill == null) ? 0 : bill.hashCode());
		result = prime * result + ((chocolate == null) ? 0 : chocolate.hashCode());
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
		BillDetail_PK other = (BillDetail_PK) obj;
		if (bill == null) {
			if (other.bill != null)
				return false;
		} else if (!bill.equals(other.bill))
			return false;
		if (chocolate == null) {
			if (other.chocolate != null)
				return false;
		} else if (!chocolate.equals(other.chocolate))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BillDetail_PK [bill=" + bill + ", chocolate=" + chocolate + "]";
	}
}
