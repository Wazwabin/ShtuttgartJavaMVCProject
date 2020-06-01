package ru.vallione.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.validation.BindingResult;
import javax.servlet.http.HttpServletRequest;


import ru.vallione.DAO.Shtuttgart;
import ru.vallione.DAO.TownService;

@Controller
@RequestMapping("/shtuttgart/") 
public class TownController {
	private final Logger logger = LoggerFactory.getLogger(TownController.class);
	
	private TownService townSer;
	
	@Autowired
	public void setContactService(TownService townSer) {
		this.townSer= townSer;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model uiModel) { 
		logger.info("Listing towninfo");
		List<Shtuttgart> places = townSer.findAll();
		uiModel.addAttribute ("places", places); 
		logger.info("No. of place: " + places.size());
		return "shtuttgart/place"; 
	}
	
	@PreAuthorize("hasRole('ROLE_USER')") 
	@RequestMapping(value = "delete/{id}",method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id, Model uiModel) {
			townSer.delete(id);
			logger.info("Deleted place: " + id);
		return "redirect:/shtuttgart/";
	}
	
	@RequestMapping(value = "update/{id}",method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") int id, Model uiModel) {
		uiModel.addAttribute ("place", townSer.findById(id));
		return "shtuttgart/edit";
	}
	
	@RequestMapping(value = "update/0",method = RequestMethod.GET)
	public String newForm( Model uiModel) {
		return "shtuttgart/edit";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "update/{id}", method = RequestMethod.POST)
	public String update(Shtuttgart place, BindingResult bindingResult,
				Model uiModel, HttpServletRequest httpServletRequest,
				RedirectAttributes redirectAttributes) {
		logger.info("Updating place");
		if (bindingResult.hasErrors()) {
			uiModel.addAttribute("place", place);
			return "shtuttgart/update";
		}
		townSer.save(place);
		return "redirect:/shtuttgart/";
	}

}
