package sidream.team.mail.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sidream.team.mail.entity.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {

	//need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;


	@Override
	public List<Message> getMessages() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		//create a query ... sort by senderEmail
		Query<Message> theQuery = currentSession.createQuery("from Message order by senderUsername", 
				Message.class);

		//execute query and get result list
		List<Message> messages = theQuery.getResultList();

		//return the results			
		return messages;
	}

	@Override
	public void saveMessage(Message theMessage) {

		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		//save/update the user
		currentSession.saveOrUpdate(theMessage);


	}

	@Override
	public Message getMessage(int theId) {

		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		//retrieve/ read from the database using the primary key 
		Message theMessage = currentSession.get(Message.class, theId);

		return theMessage;
	}

	@Override
	public void deleteMessage(int theId) {

		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		//delete object from the database using the primary key 
		Query theQuery = currentSession.createQuery("delete from Message where id=:messageId");
		theQuery.setParameter("messageId", theId);

		theQuery.executeUpdate();		
	}

	@Override
	public List<Message>searchMessages (String theSearchKey){

		//get the current hibernate session 
		Session currentSession = sessionFactory.getCurrentSession();

		Query theQuery = null;

		//Only search by senderId if theSearchKey is not empty
		if (theSearchKey != null && theSearchKey.trim().length()>0) {

			//search for the  of the sender  ... case insensitive
			theQuery = currentSession.createQuery("from Message where lower(senderUsername) like :theKey", Message.class);
			theQuery.setParameter("theKey", "%" + theSearchKey.toLowerCase() + "%");
		}
		else {
			//theSearchKey is empty ... so just get all the messages
			theQuery = currentSession.createQuery("from Message", Message.class);
		}

		//execute query and get result list
		List<Message>messages = theQuery.getResultList();

		//return the results
		return messages;
	}

}
