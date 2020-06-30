package se.iuh.btl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import se.iuh.btl.entities.User;
import se.iuh.btl.service.userservice.UserService;

@Controller
@RequestMapping({"/registerController", "/"})
public class RegisterController {
	
	@Autowired(required = true)
	private UserService userService;
	
	@Autowired(required = true)
    private JavaMailSender mailSender;
	
	private String host;
	private String port;
	private String username;
	private String password;
	private String javaMailProperties;
	
	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getJavaMailProperties() {
		return javaMailProperties;
	}

	public void setJavaMailProperties(String javaMailProperties) {
		this.javaMailProperties = javaMailProperties;
	}
	
	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public UserService getUserService() {
		return userService;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@GetMapping(value = "/register") 
	public String displayLogin(Model model) { 
		User user = new User();
	    model.addAttribute("user", user); 
	    return "login-register"; 
	}
	
	@GetMapping(value = {"/listUsers"})
	public String listUser(Model model) {
		List<User> users = userService.getListUsers();
		model.addAttribute("users", users);
		return "listUser";
	}
	
	@RequestMapping(value= "/saveUser", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User user) {
		userService.addUser(user);
		
		String emailto = user.getEmail();
		String subject = "REGISTER MEMBER OF CHOCOLATE STORE";
		String message = "Congratulations! You are becoming a member of the Chocolate Store";
		
		System.out.println("Email to: " + user.getEmail());
		
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(emailto);
		email.setSubject(subject);
		email.setText(message);
		
		mailSender.send(email);
		
		System.out.println("Send mail to " + emailto + " is success!");
		
		return "index";
	}

}
