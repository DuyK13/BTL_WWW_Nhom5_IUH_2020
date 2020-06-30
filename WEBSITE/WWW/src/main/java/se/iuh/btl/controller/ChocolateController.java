package se.iuh.btl.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import se.iuh.btl.entities.Category;
import se.iuh.btl.entities.Chocolate;
import se.iuh.btl.model.SaveChocolateModel;
import se.iuh.btl.service.categoryservice.CategoryService;
import se.iuh.btl.service.chocolateservice.ChocolateService;

@Controller
public class ChocolateController {

	private ChocolateService chocolateService;
	private CategoryService categoryService;

	@Autowired(required = true)
	public void setChocolateService(ChocolateService chocolateService) {
		this.chocolateService = chocolateService;
	}

	@Autowired(required = true)
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	@GetMapping("/")
	public String getIndex() {
		return "index";
	}

	@GetMapping(value = { "/chocolate/listchocolates" })
	public String listChocolates(Model model) {
		List<Chocolate> chocolates = chocolateService.getChocoLates();
		model.addAttribute("chocolates", chocolates);
		return "list-chocolates";
	}

	@GetMapping("/chocolate/showChocolateForm")
	public String showFormForAdd(Model model) {
		Chocolate chocolate = new Chocolate();
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("categories", categories);
		model.addAttribute("chocolate", chocolate);
		return "chocolate-form";
	}

	@PostMapping("/chocolate/saveChocolate")
	public String saveChocolate(@ModelAttribute("chocolate") SaveChocolateModel chocolate,
			@RequestParam(value = "file") MultipartFile file, @RequestParam(value = "category") String category) {
		String image = chocolateService.saveImage(file);
		Chocolate realChocolate = new Chocolate(chocolate.getId(), chocolate.getName(), chocolate.getAmount(), chocolate.getCost(), chocolate.getDescription(), chocolate.getDiscount());
		realChocolate.setImage(image);
		System.out.println(category);
		chocolateService.saveChocoLate(realChocolate);
		return "redirect:/chocolate/listChocolates";
	}

	@GetMapping("/updateChocolateForm/{id}")
	public String showFormForUpdate(@PathVariable("id") int id, Model model) {
		Chocolate chocolate = chocolateService.getChocoLate(id);
		model.addAttribute("chocolate", chocolate);
		return "chocolate-form";
	}

	@GetMapping("/chocolate/deleteChocolate/{id}")
	public String deleteChocolate(@PathVariable("id") int id) {
		chocolateService.deleteChocoLate(id);
		return "redirect:/chocolate/listChocolates";
	}
}
