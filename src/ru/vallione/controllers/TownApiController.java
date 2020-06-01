 package ru.vallione.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import ru.vallione.DAO.Shtuttgart;
import ru.vallione.DAO.TownService;

@Controller
@RequestMapping("api/shtuttgart")
public class TownApiController {
	
	private TownService townService;
	@Autowired
	public void setTownService(TownService townService) {
		this.townService= townService;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody 
	public List<Shtuttgart> list() {
		return townService.findAll();
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Shtuttgart findById(@PathVariable int id) {
		return townService.findById(id);
	}
	
	@RequestMapping(value="/", method = RequestMethod.POST)
	@ResponseBody
	public Shtuttgart create(@RequestBody Shtuttgart shtuttgart) {
		return townService.save(shtuttgart);
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public Shtuttgart update(@RequestBody Shtuttgart shtuttgart, @PathVariable int id) {
		return townService.save(shtuttgart);
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void delete(@PathVariable int id) {
		townService.delete(id);
	}

}
