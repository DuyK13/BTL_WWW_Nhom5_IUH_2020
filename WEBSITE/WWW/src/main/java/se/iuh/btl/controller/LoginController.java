package se.iuh.btl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import se.iuh.btl.entities.User;
import se.iuh.btl.service.userservice.UserService;

@Controller
public class LoginController {
	
	@Autowired(required = true)
	private UserService userService;
	
	public UserService getUserService() {
		return userService;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping("/")
	public String getIndex() {
		return "index";
	}
	
	@GetMapping(value = "/loginController/login") 
	public String displayLogin(Model model) { 
		User user = new User();
	    model.addAttribute("user", user); 
	    return "login-register"; 
	}
	
	@GetMapping(value = "/loginController/logout")
	public String logoutUser(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
	    session.removeAttribute("userLogin");
		return "redirect:/";
	}
	
	@GetMapping(value = {"/loginController/listUserLogin"})
	public String listUser(Model model) {
		List<User> users = userService.getListUsers();
		model.addAttribute("users", users);
		return "listUser";
	}
	
	@RequestMapping(value= "/loginController/loginUser", method = RequestMethod.POST)
	public String loginUser(@ModelAttribute("user") User user, ModelMap model, HttpServletRequest request) {
		String userName = user.getUsername();
		User u = userService.getUserByUserName(userName);
		if(u != null) {
			System.out.println(u.getUsername() + u.getPassword());
			if(u.getPassword().equals(user.getPassword())) {
				System.out.println("Login success");
				HttpSession session = request.getSession();
				session.setAttribute("userLogin", userName);
				return "redirect:/loginController";
			}
			else {
				System.out.println("Login fail");
				String loginfail = "Nhập sai mật khẩu. Vui lòng kiểm tra lại!";
				model.addAttribute("message", loginfail);
				return "login-register";
			}
		}
		else {
			System.out.println("No user for user name to login");
			String loginfail = "Tài khoản chưa tồn tại. Vui lòng đăng ký tài khoản mới!";
			model.addAttribute("message", loginfail);
			return "login-register";
		}		
	}
}
