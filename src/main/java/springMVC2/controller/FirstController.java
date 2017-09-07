package springMVC2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FirstController {

	@RequestMapping(value = "/hello")
	public String hello(Model model,
			@RequestParam(name = "name", required = false, defaultValue = "John Doe") String name) {
		model.addAttribute("name", name);
		return "hello";
	}

	@RequestMapping(value = "/bye")
	public String bye(Model model) {
		model.addAttribute("bye", "bye");
		return "bye";
	}

}
