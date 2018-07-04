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

import sidream.team.mail.entity.User;
import sidream.team.mail.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	//need to inject the customer service
	@Autowired
	private UserService userService;

	@GetMapping("/list")
	public String listUsers(Model theModel) {

		//get users from the service
		List<User> theUsers = userService.getUsers();

		//add the users to the model
		theModel.addAttribute("users", theUsers);

		return "list-users";
	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd (Model theModel) {

		//create model attribute to bind form data
		User theUser = new User();

		theModel.addAttribute("user", theUser);

		return "register-form";
	}	

	@PostMapping("/saveUser")
	public String saveUser (@ModelAttribute("user") User theUser) {
		
		//save the user using our service
		userService.saveUser(theUser); 

		return "redirect:/";
	}
	
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate (@RequestParam("userId") String theId, Model theModel) {
		
		//get the user from the service
		User theUser = userService.getUser(theId);
		
		//set user as a model attribute to pre-populate the form
		theModel.addAttribute("user", theUser);

		// send over to the form
		return "update-form";
	}	
		
	@GetMapping("/delete")
	public String deleteUser (@RequestParam("userId") String theId) {
		
		//delete the user
		userService.deleteUser(theId);
		
		return "redirect:/user/list";
	}	

	@PostMapping("/search")
	public String searchUsers(@RequestParam("theSearchName") String theSearchName,
									Model theModel) {

		// search users from the service
		List<User> theUsers = userService.searchUsers(theSearchName);
				
		// add the users to the model
		theModel.addAttribute("users", theUsers);

		return "list-users";		
	}
	
}
