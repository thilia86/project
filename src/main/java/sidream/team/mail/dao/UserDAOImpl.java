package sidream.team.mail.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sidream.team.mail.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {

	//need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;


	@Override
	public List<User> getUsers() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		//create a query ... sort by last name
		Query<User> theQuery = currentSession.createQuery("from User order by lastName", 
				User.class);

		//execute query and get result list
		List<User> users = theQuery.getResultList();

		//return the results			
		return users;
	}

	@Override
	public void saveUser(User theUser) {

		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		String newpass ="{noop}"+theUser.getPassword();
		theUser.setPassword(newpass);
		//save/update the user
		currentSession.saveOrUpdate(theUser);


	}
	

	@Override
	public User getUser(String theId) {

		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		//retrieve/ read from the database using the primary key 
		User theUser = currentSession.get(User.class, theId);

		return theUser;
	}

	@Override
	public void deleteUser(String theId) {

		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		//delete object from the database using the primary key 
		Query theQuery = currentSession.createQuery("delete from User where id=:userId");
		theQuery.setParameter("userId", theId);

		theQuery.executeUpdate();		
	}

	@Override
	public List<User>searchUsers (String theSearchName){

		//get the current hibernate session 
		Session currentSession = sessionFactory.getCurrentSession();

		Query theQuery = null;

		//Only search by name if theSearchName is not empty
		if (theSearchName != null && theSearchName.trim().length()>0) {

			//search for the firstName or lastName ... case insensitive
			theQuery = currentSession.createQuery("from User where lower(firstName) like :theName or lower(lastName) like :theName", User.class);
			theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");
		}
		else {
			//theSearchName is empty ... so just get all the users
			theQuery = currentSession.createQuery("from User", User.class);
		}

		//execute query and get result list
		List<User>users = theQuery.getResultList();

		//return the results
		return users;
	}

}
