package se.iuh.btl.service.categoryservice;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import se.iuh.btl.dao.categorydao.CategoryDAO;
import se.iuh.btl.entities.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	private CategoryDAO categoryDAO;
	
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	@Override
	@Transactional
	public List<Category> getCategories() {
		return categoryDAO.getCategories();
	}

	@Override
	@Transactional
	public void saveCategory(Category category) {
		categoryDAO.saveCategory(category);
	}

	@Override
	@Transactional
	public Category getCategory(int id) {
		return categoryDAO.getCategory(id);
	}

	@Override
	@Transactional
	public void deleteCategory(int id) {
		categoryDAO.deleteCategory(id);
	}

	@Override
	@Transactional
	public List<Category> getCategoriesByName(String name) {
		return categoryDAO.getCategoriesByName(name);
	}

}
