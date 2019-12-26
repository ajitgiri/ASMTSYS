package com.sd.setup.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

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

import com.sd.setup.model.SpaceTypeMaster;
import com.sd.setup.service.SpaceTypeMasterService;

@Controller
public class SpaceTypeMasterController {

	@Autowired
	private SpaceTypeMasterService spaceTypeMasterService;
	
	SpaceTypeMaster spaceTypeMasterOBJ= new SpaceTypeMaster();
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	 SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	 dateFormat.setLenient(false);
	 webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }
	
	@RequestMapping(value="/space_type_master.html")
	public String showForm(Model model){
		System.out.println("inside show Form---------");
		String response="";
		response="spaceTypeMaster";
		model.addAttribute("mappedModel",spaceTypeMasterOBJ);
		model.addAttribute("spaceTypMsServList",spaceTypeMasterService.getSpaceTypeMasterList());
		return response;
	}
	
	@RequestMapping(value="/save_space_type_master.html", method = RequestMethod.POST)
	public String handleSubmit(@ModelAttribute("mappedModel")SpaceTypeMaster mappedModel){
		System.out.println("inside handleSubmit--------");
		mappedModel.setStatus(1);
		mappedModel.setCreatedOn(new Date());
		spaceTypeMasterService.addSpaceTypeMaster(mappedModel);
		return "redirect:/space_type_master.html";
	}
	
	
	
	@RequestMapping(value = "/delete_space_type_master.html")
	public String deletSpaceTypeMasterDetail(
			@RequestParam(value = "spTypMsId", required = true) Integer id) {
	//	System.out.println("Inside Delete------------>");
		spaceTypeMasterService.deleteSpaceTypeMaster(id);
		return "redirect:/space_type_master.html";
	}

	@RequestMapping(value = "/disable_space_type_master.html")
	public String disableSpaceTypeMasterDetail(
			@RequestParam(value = "spTypMsId", required = true) Integer id) {
		//System.out.println("Inside Delete------------>");
		spaceTypeMasterService.disableSpaceTypeMaster(id);
		return "redirect:/space_type_master.html";
	}

	@RequestMapping(value = "/enable_space_type_master.html")
	public String enableSpaceTypeMasterDetail(
			@RequestParam(value = "spTypMsId", required = true) Integer id) {
		//System.out.println("Inside Delete------------>");
		spaceTypeMasterService.enableSpaceTypeMaster(id);
		return "redirect:/space_type_master.html";
	}
	
	@RequestMapping(value="/space_type_masterdit.html")
	public @ResponseBody String editSpaceTypeMasterDetail(@RequestParam("spTypMsId") Integer id,HttpServletRequest request){
		String spaceTypeMasterDetail=null;
		SpaceTypeMaster spaceTypeMasterId=null;
		System.out.println("Inside spaceTypeMasterDetail------------>"+id);
		if(id != null){
			//int uid=Integer.parseInt(id);
			try{
				 ObjectMapper objectMapper = new ObjectMapper();
				 spaceTypeMasterId=(SpaceTypeMaster)spaceTypeMasterService.getSpaceTypeMasterById(id);
				if(spaceTypeMasterId != null){
					spaceTypeMasterDetail = objectMapper.writeValueAsString(spaceTypeMasterId);
				}
			}catch(Exception e){
				return spaceTypeMasterDetail;
			}
		}
		return spaceTypeMasterDetail;
		
	}
}
