package sidream.team.mail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sidream.team.mail.dao.MessageDAO;
import sidream.team.mail.entity.Message;

@Service
public class MessageServiceImpl implements MessageService {

	//need to inject the message dao
	@Autowired
	private MessageDAO messageDAO;

	@Override
	@Transactional
	public List<Message> getMessages() {		
		return messageDAO.getMessages();
	}

	@Override
	@Transactional
	public void saveMessage(Message theMessage) {
		messageDAO.saveMessage(theMessage);

	}

	@Override
	@Transactional
	public Message getMessage(int theId) {
		return messageDAO.getMessage(theId);
	}

	@Override
	@Transactional
	public void deleteMessage(int theId) {
		messageDAO.deleteMessage(theId);
	}

	@Override
	@Transactional
	public List<Message>searchMessages (String theSearchKey){
		return messageDAO.searchMessages(theSearchKey);
	}

}
