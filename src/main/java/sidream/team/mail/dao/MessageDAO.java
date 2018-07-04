package sidream.team.mail.dao;

import java.util.List;

import sidream.team.mail.entity.Message;

public interface MessageDAO {
	
	public List<Message> getMessages();

	public void saveMessage(Message theMessage);

	public Message getMessage(int theId);

	public void deleteMessage(int theId);

	public List<Message> searchMessages(String theSearchKey);
}
