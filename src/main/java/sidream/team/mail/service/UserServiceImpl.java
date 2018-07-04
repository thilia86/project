package sidream.team.mail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sidream.team.mail.dao.UserDAO;
import sidream.team.mail.entity.User;

@Service
public class UserServiceImpl implements UserService {

	//need to inject the user dao
	@Autowired
	private UserDAO userDAO;


	@Override
	@Transactional
	public List<User> getUsers() {		
		return userDAO.getUsers();
	}

	@Override
	@Transactional
	public void saveUser(User theUser) {
		userDAO.saveUser(theUser);

	}

	@Override
	@Transactional
	public User getUser(String theId) {
		return userDAO.getUser(theId);
	}

	@Override
	@Transactional
	public void deleteUser(String theId) {
		userDAO.deleteUser(theId);
	}

	@Override
	@Transactional
	public List<User>searchUsers (String theSearchName){
		return userDAO.searchUsers(theSearchName);
	}

}
