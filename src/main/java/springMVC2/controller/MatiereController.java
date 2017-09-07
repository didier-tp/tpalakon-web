package springMVC2.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import formation.jpa.dao.DaoMatiere;
import formation.jpa.model.Matiere;

@Controller
@RequestMapping("/matiere")
public class MatiereController {

	@Autowired
	private DaoMatiere daoMatiere;

	// @RequestMapping("/list")
	// public String listMatiere(Model model) {
	// model.addAttribute("liste", daoMatiere.findAll());
	// return "matiere/list";
	// }

	@RequestMapping("/list")
	public ModelAndView list() {
		return new ModelAndView("matiere/list", "liste", daoMatiere.findAll());
	}

	// @RequestMapping("/delete")
	// public String delete(@RequestParam(name = "code", required = true) Integer
	// code, Model model) {
	// Matiere mat = daoMatiere.find(code);
	// daoMatiere.delete(mat);
	// model.addAttribute("liste", daoMatiere.findAll());
	// return "matiere/list";
	// }

	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(name = "code", required = true) Integer code) {
		daoMatiere.delete(daoMatiere.find(code));
		return list();
	}

	// @RequestMapping("/edit")
	// public String editProduit(@RequestParam(name = "code", required = false)
	// Integer code, Model model) {
	// if (code == null) {
	// Matiere mat = new Matiere();
	// model.addAttribute("uneMatiere", mat);
	// } else {
	// model.addAttribute("uneMatiere", daoMatiere.find(code));
	// }
	// return "matiere/edit";
	// }

	@RequestMapping("/edit")
	public ModelAndView editProduit(@RequestParam(name = "code", required = false) Integer code) {
		ModelAndView modelAndView = new ModelAndView("matiere/edit");
		if (code == null) {
			modelAndView.addObject("uneMatiere", new Matiere());
		} else {
			modelAndView.addObject("uneMatiere", daoMatiere.find(code));
		}
		return modelAndView;
	}

	// @RequestMapping("/save")
	// public String saveProduit(@ModelAttribute("uneMatiere") @Valid Matiere
	// matiere, BindingResult br, Model model) {
	// if (br.hasErrors()) {
	// model.addAttribute("uneMatiere", matiere);
	// return "matiere/edit";
	// }
	// if (matiere.getCode() == null) {
	// daoMatiere.create(matiere);
	// model.addAttribute("liste", daoMatiere.findAll());
	// } else {
	// daoMatiere.update(matiere);
	// model.addAttribute("liste", daoMatiere.findAll());
	// }
	// return "matiere/list";
	// }

	@RequestMapping("/save")
	public ModelAndView saveProduit(@ModelAttribute("uneMatiere") @Valid Matiere matiere) {
		if (matiere.getCode() == null) {
			daoMatiere.create(matiere);
		} else {
			daoMatiere.update(matiere);
		}
		return new ModelAndView("redirect:list");
	}

}
