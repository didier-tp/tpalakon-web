package springMVC2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import formation.jpa.dao.DaoPersonne;
import formation.jpa.model.Civilite;
import formation.jpa.model.Eleve;
import formation.jpa.model.Formateur;
import formation.jpa.model.Personne;

@Controller
@RequestMapping("/personne")
public class PersonneController {

	@Autowired
	private DaoPersonne daoPersonne;

	@RequestMapping("/list")
	public ModelAndView list() {
		return new ModelAndView("personne/list", "list", daoPersonne.findAll());
	}

	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(name = "id", required = true) Integer id) {
		daoPersonne.delete(daoPersonne.find(id));
		return new ModelAndView("redirect:list");
	}

	@RequestMapping("/edit")
	public ModelAndView edit(@RequestParam(name = "id", required = true) Integer id) {
		return formPersonne(daoPersonne.find(id));
	}

	@RequestMapping("/createEleve")
	public ModelAndView createEleve() {
		return formPersonne(new Eleve());
	}

	@RequestMapping("/createFormateur")
	public ModelAndView createFormateur() {
		return formPersonne(new Formateur());
	}

	private ModelAndView formPersonne(Personne p) {
		ModelAndView modelAndView = new ModelAndView("personne/edit", "personne", p);
		modelAndView.addObject("civilites", Civilite.values());
		modelAndView.addObject("formateurs", daoPersonne.findAllFormateur());
		return modelAndView;
	}

	@RequestMapping("/saveEleve")
	public ModelAndView saveEleve(@ModelAttribute Eleve e) {
		return savePersonne(e);
	}

	@RequestMapping("/saveFormateur")
	public ModelAndView saveFormateur(@ModelAttribute Formateur f) {
		return savePersonne(f);
	}

	private ModelAndView savePersonne(Personne p) {
		if (p.getId() == null) {
			daoPersonne.create(p);
		} else {
			daoPersonne.update(p);
		}
		return list();
	}

}
