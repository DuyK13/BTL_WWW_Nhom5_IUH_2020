package se.iuh.btl.dao.userdao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import se.iuh.btl.entities.Chocolate;
import se.iuh.btl.entities.User;


@Repository
public class UserDAOImpl implements UserDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addUser(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(user);
	}

	@Override
	public void updateUser(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(user);
	}

	@Override
	public void removeUser(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		User u = session.load(User.class, user.getUserId());
		if (u != null) {
			session.delete(u);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getListUsers() {
//		Session session = this.sessionFactory.getCurrentSession();
//		List<User> list = session.createNamedQuery("FROM User", User.class).getResultList();
//		System.out.println(list);
//		return list;
		
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<User> cq = cb.createQuery(User.class);
		Root<User> root = cq.from(User.class);
		cq.select(root);
		Query query = session.createQuery(cq);
		return query.getResultList();
	}

	@Override
	public User getUserById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		User u = session.load(User.class, new Integer(id));
		if (u == null) {
			return null;
		}
		return u;
	}

	@Override
	public User getUserByUserName(String username) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			User u = session.createNativeQuery("select * from Users u where u.username = :username", User.class).setParameter("username", username).getSingleResult();
			System.out.println(u);
			return u;	
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}		
	}

}
