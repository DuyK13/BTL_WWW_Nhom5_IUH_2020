package se.iuh.btl.dao.categorydao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.sun.mail.util.QEncoderStream;

import se.iuh.btl.entities.Category;

@SuppressWarnings("unchecked")
@Repository
public class CategoryDAOImpl implements CategoryDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Category> getCategories() {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<Category> cq = cb.createQuery(Category.class);
		Root<Category> root = cq.from(Category.class);
		cq.select(root);
		Query query = session.createQuery(cq);
		return query.getResultList();
	}

	@Override
	public void saveCategory(Category category) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(category);
	}

	@Override
	public Category getCategory(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Category category = currentSession.get(Category.class, id);
		return category;
	}

	@Override
	public void deleteCategory(int id) {
		Session session = sessionFactory.getCurrentSession();
		Category category = session.byId(Category.class).load(id);
		session.delete(category);
	}

	@Override
	public Category getCategoryByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<Category> cq = cb.createQuery(Category.class);
		Root<Category> root = cq.from(Category.class);
		Expression<String> a = root.get("name");
		cq.select(root).where(cb.like(a, "%" + name + "%"));
		Query query = session.createQuery(cq);
		System.out.println(query.toString());
		return (Category) query.getSingleResult();
	}

}
