package se.iuh.btl.dao.chocolatedao;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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
import javax.servlet.Servlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import org.apache.taglibs.standard.lang.jstl.test.PageContextImpl;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Repository;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import se.iuh.btl.entities.Chocolate;

@SuppressWarnings("unchecked")
@Repository
public class ChocolateDAOImpl implements ChocolateDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	HttpServletRequest request;
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
	public boolean saveImage(MultipartFile file, String path, String fileName) {
		try {
			String filename = file.getOriginalFilename();
			byte[] bytes = file.getBytes();
			BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(new File(path + File.separator + filename)));	
			outputStream.write(bytes);
			outputStream.flush();
			outputStream.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
