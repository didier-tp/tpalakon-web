package springMVC2.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springMVC2.model.Produit;

@Controller
@RequestMapping("/produit")
public class ProduitController {

	private List<Produit> liste = new ArrayList<>();

	@RequestMapping("/list")
	public String listProduit(Model model) {
		model.addAttribute("liste", liste);
		return "produit/list";
	}

	@RequestMapping("/edit")
	public String editProduit(@RequestParam(name = "id", required = false) Integer index, Model model) {
		if (index == null) {
			model.addAttribute("unProduit", new Produit());
			model.addAttribute("index", -1);
		} else {
			model.addAttribute("unProduit", liste.get(index));
			model.addAttribute("index", index);
		}
		return "produit/edit";
	}

	@RequestMapping("/save")
	public String saveProduit(@ModelAttribute("unProduit") @Valid Produit produit, BindingResult br,
			@RequestParam(name = "index", required = false) Integer index, Model model) {
		if (br.hasErrors()) {
			model.addAttribute("index", index);
			return "produit/edit";
		}
		if (index == -1) {
			liste.add(produit);
		} else {
			liste.remove((int) index);
			liste.add(produit);
		}
		model.addAttribute("liste", liste);
		return "produit/list";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam(name = "id", required = true) Integer index, Model model) {
		liste.remove((int) index);
		model.addAttribute("liste", liste);
		return "produit/list";
	}

}
