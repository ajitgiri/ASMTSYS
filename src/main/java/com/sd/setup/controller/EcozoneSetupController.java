package com.sd.setup.controller;

import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.impl.Log4JLogger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sd.setup.model.Ecozone;
import com.sd.setup.service.EcozoneService;

@Controller
public class EcozoneSetupController {

	Log4JLogger logger=(Log4JLogger)LogFactory.getLog(EcozoneSetupController.class);
	
	@Autowired
	private EcozoneService ecozoneService;
	Ecozone ecozoneOBJ= new Ecozone();
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	 SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	 dateFormat.setLenient(false);
	 webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }
	
	@RequestMapping(value="/eco_zone.html")
	public String showForm(Model model){
		String response="";
		response="ecoZoneSetup";
		model.addAttribute("mappedModel",ecozoneOBJ);
		model.addAttribute("ecozoneList",ecozoneService.getEcozoneList());
		return response;
	}
	
	@RequestMapping(value="save_eco_zone.html", method = RequestMethod.POST)
	public String handleSubmit(@ModelAttribute("mappedModel")Ecozone mappedModel){
		mappedModel.setStatus(0);
		mappedModel.setCreatedOn(new Date());
		ecozoneService.addEcozone(mappedModel);
		return "redirect:/eco_zone.html";
	}
	
	
	
	@RequestMapping(value = "/delete_eco_setupe.html")
	public String deletEcozone(
			@RequestParam(value = "id", required = true) Integer id) {
		System.out.println("id="+id);
		ecozoneService.deleteEcozone(id);
		return "redirect:/eco_zone.html";
	}

	@RequestMapping(value = "/disable_eco_setupe.html")
	public String disableEcozone(
			@RequestParam(value = "id", required = true) Integer id) {
		//logger.info("Inside Delete------------>");
		ecozoneService.disableEcozone(id);
		return "redirect:/eco_zone.html";
	}

	@RequestMapping(value = "/enable_eco_setupe.html")
	public String enableEcozone(
			@RequestParam(value = "id", required = true) Integer id) {
		//logger.info("Inside Delete------------>");
		ecozoneService.enableEcozone(id);
		return "redirect:/eco_zone.html";
	}
	
	@RequestMapping(value="/eco_setupedit.html")
	public @ResponseBody String editEcoDetails(@RequestParam("id") String id,HttpServletRequest request){
		String ecoZoneDetail=null;
		Ecozone ecozone=null;
		System.out.println("Inside editEcoDetails------------>");
		if(id != null){
			int uid=Integer.parseInt(id);
			try{
				 ObjectMapper objectMapper = new ObjectMapper();
				 ecozone=(Ecozone)ecozoneService.getEcozoneById(uid);
				if(ecozone != null){
					ecoZoneDetail = objectMapper.writeValueAsString(ecozone);
				}
			}catch(Exception e){
				return ecoZoneDetail;
			}
		}
		return ecoZoneDetail;
		
	}
}
