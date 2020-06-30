package se.iuh.btl.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import se.iuh.btl.service.cartservice.CartBeanService;
import se.iuh.btl.service.cartservice.CartBeanServiceImpl;
import se.iuh.btl.entities.CartChocolate;
import se.iuh.btl.entities.Chocolate;
import se.iuh.btl.service.chocolateservice.ChocolateService;

@Controller
public class ShoppingCartController {

	private ChocolateService chocolateService;

	@Autowired(required = true)
	public void setChocolateService(ChocolateService chocolateService) {
		this.chocolateService = chocolateService;
	}
//	@GetMapping("/cart")
//	public String cart()
//	{
//		return "cart";
//	}
	//	@GetMapping("/cart/deletecart")
	//	public String deleteToCart(Model model,HttpServletRequest req,@RequestParam(name = "choco_id") int product_id)
	//	{
	//		HttpSession session = req.getSession();
	//		CartBean cartBean = null;
	//		Object objCart = session.getAttribute("cart");
	//		
	//	}
	@GetMapping("/cart/addToCart")
	public String addToCart(Model model,HttpServletRequest req,@RequestParam(name = "choco_id") int choco_id,@RequestParam(name = "quantity" )int qua)
	{
		HttpSession session = req.getSession();
		CartBeanService cartBean = null;
		Object objCart = session.getAttribute("cart");
		Chocolate c = chocolateService.getChocoLate(choco_id);
		if(objCart!=null)
		{
			cartBean = (CartBeanService) objCart;
		}
		else
		{
			cartBean= new CartBeanServiceImpl();
			session.setAttribute("cart", cartBean);
		}
		//		CartChocolate item= new CartChocolate(choco_id,qua);
		CartChocolate item = new CartChocolate(choco_id, c.getName(), c.getCost(), c.getImage(), c.getDiscount(), qua, qua*c.getCost());
		System.out.println(item);
		cartBean.addCartItem(item);
		model.addAttribute("cart",cartBean);
		return "cart";
	}
	@GetMapping("/cart/updateCart")
	public String updateCart(Model model,HttpServletRequest req,@RequestParam(name = "choco_id") int choco_id,@RequestParam(name ="quantity") int qua)
	{
		System.out.println("update");
		HttpSession session = req.getSession();
		CartBeanService cartBean = null;
		Object objCart = session.getAttribute("cart");
		Chocolate c = chocolateService.getChocoLate(choco_id);
		if(objCart!=null)
		{
			cartBean= (CartBeanService) objCart;
		}
		else
		{
			cartBean= new CartBeanServiceImpl();
			session.setAttribute("cart", cartBean);
		}
		//		CartChocolate item= new CartChocolate(choco_id,qua);
		CartChocolate item = new CartChocolate(choco_id, c.getName(), c.getCost(), c.getImage(), c.getDiscount(), qua, qua*c.getCost());
		cartBean.updateCartItem(item);
		model.addAttribute("cart",cartBean);
		return "cart";
	}
	@GetMapping("/cart/removeCart")
	public String removeCart(Model model,HttpServletRequest req,@RequestParam(name = "choco_id") int choco_id)
	{
		HttpSession session = req.getSession();
		CartBeanService cartBean = null;
		Object objCart = session.getAttribute("cart");
		Chocolate c = chocolateService.getChocoLate(choco_id);
		if(objCart!=null)
		{
			cartBean= (CartBeanService) objCart;
		}
		else
		{
			cartBean= new CartBeanServiceImpl();
			session.setAttribute("cart", cartBean);
		}
		cartBean.deleteCartItem(choco_id);
		System.out.println(choco_id);
		model.addAttribute("cart",cartBean);
		return "cart";
	}
}
