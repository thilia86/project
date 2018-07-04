package sidream.team.mail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sidream.team.mail.entity.Message;
import sidream.team.mail.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {

	//need to inject the message service
	@Autowired
	private MessageService messageService;

	@GetMapping("/list")
	public String listMessages(Model theModel) {

		//get messages from the service
		List<Message> theMessages = messageService.getMessages();

		//add the messages to the model
		theModel.addAttribute("messages", theMessages);

		return "list-messages";
	}

	@GetMapping("/showFormForSendingMsg")
	public String showFormForSendingMsg (Model theModel) {

		//create model attribute to bind form data
		Message theMessage = new Message();

		theModel.addAttribute("message", theMessage);

		return "sendmsg-form";
	}	

	@PostMapping("/saveMessage")
	public String saveMessage (@ModelAttribute("message") Message theMessage) {
		
		//save the message using our service
		messageService.saveMessage(theMessage); 

		return "inbox";
	}
	
	
	@GetMapping("/showFormForUpdateMsg")
	public String showFormForUpdateMsg (@RequestParam("messageId") int theId, Model theModel) {
		
		//get the message from the service
		Message theMessage = messageService.getMessage(theId);
		
		//set message as a model attribute to pre-populate the form
		theModel.addAttribute("message", theMessage);

		// send over to the form
		return "sendmsg-form";
	}	
	
	@GetMapping("/delete")
	public String deleteMessage (@RequestParam("messageId") int theId) {
		
		//delete the message
		messageService.deleteMessage(theId);
		
		return "redirect:/message/list";
	}	

	
	@PostMapping("/inbox")
	public String inboxMessages(@RequestParam("theSearchKey") String theSearchKey,
									Model theModel) {

		// search messages from the service
		List<Message> theMessages = messageService.searchMessages(theSearchKey);
				
		// add the messages to the model
		theModel.addAttribute("messages", theMessages);

		return "inbox";		
	}
	
	@PostMapping("/search")
	public String searchMessages(@RequestParam("theSearchKey") String theSearchKey,
									Model theModel) {

		// search messages from the service
		List<Message> theMessages = messageService.searchMessages(theSearchKey);
				
		// add the messages to the model
		theModel.addAttribute("messages", theMessages);

		return "list-messages";		
	}
	
}
