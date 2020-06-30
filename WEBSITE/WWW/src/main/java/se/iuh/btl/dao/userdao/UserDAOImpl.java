package se.iuh.btl.dao.userdao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

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
		User u = session.load(User.class, user.getId());

		if (u != null) {
			session.delete(u);
		}
	}

	@Override
	public List<User> getListUsers() {
		Session session = this.sessionFactory.getCurrentSession();
		List<User> list = session.createNamedQuery("FROM User", User.class).getResultList();
		System.out.println(list);
		return list;
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
	public User getUserByName(int name) {
		Session session = this.sessionFactory.getCurrentSession();
		User u = session.createNamedQuery("FROM User where name=:name", User.class).setParameter("name", name).getSingleResult();
		System.out.println(u);
		if(u==null) {
			return null;
		}
		return u;
	}

}
