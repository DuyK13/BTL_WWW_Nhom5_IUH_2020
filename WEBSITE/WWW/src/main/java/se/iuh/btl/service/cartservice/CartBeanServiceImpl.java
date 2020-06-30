package se.iuh.btl.service.cartservice;

import java.util.ArrayList;

import se.iuh.btl.entities.CartChocolate;

public class CartBeanServiceImpl implements CartBeanService {
	ArrayList<CartChocolate> cartItems = new ArrayList<CartChocolate>();
	private double total;
	public int getItemCount()
	{
		return cartItems.size();
	}

	public void FinalTotal()
	{
		double t = 0;
		for(CartChocolate c: cartItems)
			t+=c.getTotal();
		setTotal(t);
	}
	public void deleteCartItem(int strIndex)
	{
		try {
			CartChocolate c = new CartChocolate(strIndex);
			if(cartItems.contains(c))
			{
				cartItems.remove(cartItems.get(cartItems.indexOf(c)));
				FinalTotal();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void updateCartItem(CartChocolate cartChocolate)
	{
		int i=0;
		for (CartChocolate c: cartItems) {
			if(c.getId()==cartChocolate.getId())
			{
				cartItems.set(i, cartChocolate);
				FinalTotal();
			}
			else
				i++;
				
		}
	}
	public void addCartItem(CartChocolate cartChocolate)
	{
		boolean flag= true;
		for(CartChocolate c:cartItems)
		{
			if(c.getId() == cartChocolate.getId())
			{
				c.setQuantity(c.getQuantity()+cartChocolate.getQuantity());
				flag=false;
				break;
			}
		}
		if(flag==true)
			cartItems.add(cartChocolate);
		FinalTotal();
	}
	public CartChocolate getCartItem(int index)
	{
		CartChocolate cart=null;
		if(cartItems.size()>index)
			cart = cartItems.get(index);
		return cart;
	}
	public ArrayList<CartChocolate> getAll()
	{
		return cartItems;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public ArrayList<CartChocolate> getCartItems() {
		return cartItems;
	}
	public void setCartItems(ArrayList<CartChocolate> cartItems) {
		this.cartItems = cartItems;
	}
}
