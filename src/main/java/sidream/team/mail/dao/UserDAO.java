package sidream.team.mail.dao;

import java.util.List;

import sidream.team.mail.entity.User;

public interface UserDAO {
	
	public List<User> getUsers();

	public void saveUser(User theUser);
	
	public User getUser(String theId);

	public void deleteUser(String theId);

	public List<User> searchUsers(String theSearchName);
}
