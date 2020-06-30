package se.iuh.btl.service.chocolateservice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import se.iuh.btl.entities.Chocolate;

public interface ChocolateService {
	public List<Chocolate> getChocoLates();

	public void saveChocoLate(Chocolate chocolate);

	public Chocolate getChocoLate(int id);

	public void deleteChocoLate(int id);
	
	public List<Chocolate> getChocolatesByName(String name);
	
	public String saveImage(MultipartFile file);
}
