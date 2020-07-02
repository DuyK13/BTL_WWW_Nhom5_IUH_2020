package se.iuh.btl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import se.iuh.btl.entities.Category;
import se.iuh.btl.service.categoryservice.CategoryService;

@Controller
public class CategoryController {

	public CategoryService categoryService;

	@Autowired(required = true)
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	@GetMapping("/category/listcategories")
	public String listCategories(Model model) {
//		List<Category> categories = categoryService.getCategories();
		Category categories = categoryService.getCategoryByName("DUy");
		model.addAttribute("categories", categories);
		return "list-categories";
	}

	@GetMapping("/category/showCategoryForm")
	public String showFormForAdd(Model model) {
		Category category = new Category();
		model.addAttribute("category", category);
		return "category-form";
	}

	@PostMapping("/category/saveCategory")
	public String saveCategory(@ModelAttribute("category") Category category) {
		System.out.println(category);
		categoryService.saveCategory(category);
		return "redirect:/category/listcategories";
	}

	@GetMapping("/category/updateCategoryForm/{id}")
	public String showFormForUpdate(@PathVariable("id") int id, Model model) {
		Category category = categoryService.getCategory(id);
		model.addAttribute("category", category);
		return "Category-form";
	}

	@GetMapping("/category/deleteCategory/{id}")
	public String deleteCategory(@PathVariable("id") int id) {
		categoryService.deleteCategory(id);
		return "redirect:/category/listCategories";
	}
}
