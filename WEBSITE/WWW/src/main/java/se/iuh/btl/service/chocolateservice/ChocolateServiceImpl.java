package se.iuh.btl.service.chocolateservice;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import se.iuh.btl.dao.chocolatedao.ChocolateDAO;
import se.iuh.btl.entities.Chocolate;

@Service
public class ChocolateServiceImpl implements ChocolateService {

	private ChocolateDAO chocolateDAO;
	
	public void setChocolateDAO(ChocolateDAO chocolateDAO) {
		this.chocolateDAO = chocolateDAO;
	}

	@Override
	@Transactional
	public List<Chocolate> getChocoLates() {
		return chocolateDAO.getChocoLates();
	}

	@Override
	@Transactional
	public void saveChocoLate(Chocolate chocolate) {
		chocolateDAO.saveChocoLate(chocolate);
	}

	@Override
	@Transactional
	public Chocolate getChocoLate(int id) {
		return chocolateDAO.getChocoLate(id);
	}

	@Override
	@Transactional
	public void deleteChocoLate(int id) {
		chocolateDAO.deleteChocoLate(id);
	}

	@Override
	@Transactional
	public List<Chocolate> getChocolatesByName(String name) {
		return chocolateDAO.getChocolatesByName(name);
	}

	@Override
	@Transactional
	public String saveImage(MultipartFile file) {
		return chocolateDAO.saveImage(file);
	}

}
