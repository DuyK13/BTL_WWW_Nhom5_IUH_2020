package se.iuh.btl.service.cartservice;

import se.iuh.btl.entities.CartChocolate;

public interface CartBeanService {
	public int getItemCount();
	public void FinalTotal();
	public void deleteCartItem(int strIndex);
	public void updateCartItem(CartChocolate cartChocolate);
	public void addCartItem(CartChocolate cartChocolate);
	public CartChocolate getCartItem(int index);
}
