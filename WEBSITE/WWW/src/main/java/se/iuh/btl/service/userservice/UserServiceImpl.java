package se.iuh.btl.service.userservice;

import java.util.List;

import se.iuh.btl.dao.userdao.UserDAO;
import se.iuh.btl.entities.User;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO;
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public void addUser(User user) {
		this.userDAO.addUser(user);
	}

	@Override
	public void updateUser(User user) {
		this.userDAO.updateUser(user);
	}

	@Override
	public void removeUser(User user) {
		this.userDAO.removeUser(user);
	}

	@Override
	public List<User> getListUsers() {
		return this.userDAO.getListUsers();
	}

	@Override
	public User getUserById(int id) {
		return this.userDAO.getUserById(id);
	}

	@Override
	public User getUserByName(int name) {
		return this.userDAO.getUserByName(name);
	}

}
