package se.iuh.btl.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import se.iuh.btl.entities.User;
import se.iuh.btl.service.userservice.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/user/listUser", method = RequestMethod.GET)
	public String listUser(Model model) {
		List<User> users = userService.getListUsers();
		model.addAttribute("users", users);
		return "list-users";
	}

	@RequestMapping(value = "/user/showForm", method = RequestMethod.GET)
	public String showFormForAdd(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "user-form";
	}

//    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
//    public String saveUser(@ModelAttribute("user") User user) {
//        customerService.saveCustomer(theCustomer);
//        return "redirect:/customer/list";
//    }
//
//    @GetMapping("/updateForm")
//    public String showFormForUpdate(@RequestParam("customerId") int theId,
//        Model theModel) {
//        Customer theCustomer = customerService.getCustomer(theId);
//        theModel.addAttribute("customer", theCustomer);
//        return "customer-form";
//    }
//
//    @GetMapping("/delete")
//    public String deleteCustomer(@RequestParam("customerId") int theId) {
//        customerService.deleteCustomer(theId);
//        return "redirect:/customer/list";
//    }

}
