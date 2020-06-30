package se.iuh.btl.dao.chocolatedao;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import se.iuh.btl.entities.Chocolate;

@SuppressWarnings("unchecked")
@Repository
public class ChocolateDAOImpl implements ChocolateDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Chocolate> getChocoLates() {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<Chocolate> cq = cb.createQuery(Chocolate.class);
		Root<Chocolate> root = cq.from(Chocolate.class);
		cq.select(root);
		Query query = session.createQuery(cq);
		return query.getResultList();
	}

	@Override
	public void saveChocoLate(Chocolate chocolate) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(chocolate);
	}

	@Override
	public Chocolate getChocoLate(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Chocolate chocolate = currentSession.get(Chocolate.class, id);
		return chocolate;
	}

	@Override
	public void deleteChocoLate(int id) {
		Session session = sessionFactory.getCurrentSession();
		Chocolate chocolate = session.byId(Chocolate.class).load(id);
		session.delete(chocolate);
	}

	@Override
	public List<Chocolate> getChocolatesByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<Chocolate> cq = cb.createQuery(Chocolate.class);
		Root<Chocolate> root = cq.from(Chocolate.class);
		Expression<String> a = root.get("name");
		cq.select(root).where(cb.like(a, "%" + name + "%"));
		Query query = session.createQuery(cq);
		return query.getResultList();
	}

	@Override
	public String saveImage(MultipartFile file) {
		System.out.println(file.toString());
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get("/resources/image" + File.separator + file.getOriginalFilename());
			Files.write(path, bytes);
			return file.getOriginalFilename();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

}
