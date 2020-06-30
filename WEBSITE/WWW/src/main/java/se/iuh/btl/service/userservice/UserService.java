package se.iuh.btl.service.userservice;

import java.util.List;

import se.iuh.btl.entities.User;

public interface UserService{
	public void addUser(User user);

	public void updateUser(User user);

	public void removeUser(User user);

	public List<User> getListUsers();

	public User getUserById(int id);

	public User getUserByUserName(String username);
}
