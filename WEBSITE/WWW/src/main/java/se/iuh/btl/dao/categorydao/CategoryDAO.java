package se.iuh.btl.dao.categorydao;

import java.util.List;

import se.iuh.btl.entities.Category;

public interface CategoryDAO {

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
	public Category getCategoryByName(String name);
}
