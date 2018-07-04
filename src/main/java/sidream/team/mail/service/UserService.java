package sidream.team.mail.service;

import java.util.List;

import sidream.team.mail.entity.User;

public interface UserService {
	
	public List <User> getUsers();

	public void saveUser(User theUser);

	public User getUser(String theId);

	public void deleteUser(String theId);
	
	public List<User> searchUsers (String theSearchName);

}
