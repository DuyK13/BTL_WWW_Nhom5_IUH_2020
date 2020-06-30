package se.iuh.btl.service.categoryservice;

import java.util.List;

import se.iuh.btl.entities.Category;

public interface CategoryService {
	public List<Category> getCategories();

	public void saveCategory(Category category);

	public Category getCategory(int id);

	public void deleteCategory(int id);

	/**
	 * tìm category bằng tên
	 * 
	 * @param name
	 * @return
	 */
	public List<Category> getCategoriesByName(String name);
}
