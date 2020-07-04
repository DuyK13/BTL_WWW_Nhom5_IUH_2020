package se.iuh.btl.dao.chocolatedao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import se.iuh.btl.entities.Chocolate;

public interface ChocolateDAO {
	public List<Chocolate> getChocoLates();

	public void saveChocoLate(Chocolate chocolate);

	public Chocolate getChocoLate(int id);

	public void deleteChocoLate(int id);
	
	/**
	 * tìm chocolate bằng tên
	 * @param name
	 * @return
	 */
	public List<Chocolate> getChocolatesByName(String name);
	
	public boolean saveImage(MultipartFile file, String path, String fileName);
}
