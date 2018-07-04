package sidream.team.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AppController {

	@GetMapping("/")
	public String showIndex() {
		return "index";
	}


	//add request mapping for /supervisor
	@GetMapping("/supervisor")
	public String showSupervisor() {
		return "supervisor";
	}

	//add request mapping for /admin
	@GetMapping("/list-users")
	public String showAdmin() {
		return "list-users";
	}

	//add request mapping for /god
	@GetMapping("/list-messages")
	public String showGod() {
		return "list-messages";
	}

	//add request mapping for /simpleusers
	@GetMapping("/sendmsg-form")
	public String showSimpleusers() {
		return "sendmsg-form";
	}
	
	@GetMapping("static/**")
	public String showcss() {
		return "index";
		
	}
	

}
