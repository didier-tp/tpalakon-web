package springMVC2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vol.metier.dao.VolDao;

@Controller
@RequestMapping("/vol")
public class VolController {

	@Autowired
	private VolDao daoVol;

	@RequestMapping("/list")
	public ModelAndView list() {
		return new ModelAndView("vol/list", "liste", daoVol.findAll());
	}

}
