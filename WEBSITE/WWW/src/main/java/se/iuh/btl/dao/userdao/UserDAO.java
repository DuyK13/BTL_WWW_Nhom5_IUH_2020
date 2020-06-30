package se.iuh.btl.dao.userdao;

import java.util.List;

import se.iuh.btl.entities.User;

public interface UserDAO {

	public void addUser(User user);
	public void updateUser(User user);
	public void removeUser(User user);
	public List<User> getListUsers();
	public User getUserById(int id);
	public User getUserByName(int name);
	
}