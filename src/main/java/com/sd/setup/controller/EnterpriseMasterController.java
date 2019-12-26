package com.sd.setup.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sd.setup.model.EnterpriseMaster;
import com.sd.setup.model.EnterpriseSetup;
import com.sd.setup.service.CountryService;
import com.sd.setup.service.EnterpriseMasterService;
import com.sd.setup.service.EnterpriseSetupService;

@Controller
public class EnterpriseMasterController {

	@Autowired
	private EnterpriseSetupService enterpriseSetupService;
	@Autowired
	private CountryService countryService; 
	@Autowired
	private EnterpriseMasterService enterpriseMasterService;
	EnterpriseSetup enterpriseSetupOBJ= new EnterpriseSetup();
	
	EnterpriseMaster enterpriseMasterOBJ= new EnterpriseMaster();
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	 SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	 dateFormat.setLenient(false);
	 webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }
	
	@RequestMapping(value="/enterprise_master.html")
	public String showForm(Model model){
		String response="";
		response="enterpriseMaster";
		String stsus="";
		enterpriseSetupOBJ=enterpriseSetupService.getEnterpriseSetupList().get(0);
		System.out.println("mail---"+enterpriseSetupOBJ.getEmailAccross());
		System.out.println("Server--"+enterpriseSetupOBJ.getServerAccross());
		
		
		if(enterpriseMasterService.getEnterpriseMasterList().size() == 0){
			model.addAttribute("status", stsus);
			model.addAttribute("mailReq",enterpriseSetupOBJ.getEmailAccross());
			model.addAttribute("serverAccross",enterpriseSetupOBJ.getServerAccross());
			model.addAttribute("countryList",countryService.getCountryList());
			model.addAttribute("mappedModel",enterpriseMasterOBJ);
		}else{
			System.out.println("inside else---");
			stsus="record";
			enterpriseMasterOBJ=enterpriseMasterService.getEnterpriseMasterList().get(0);
			model.addAttribute("status", stsus);
			model.addAttribute("mailReq",enterpriseSetupOBJ.getEmailAccross());
			model.addAttribute("serverAccross",enterpriseSetupOBJ.getServerAccross());
			model.addAttribute("countryList",countryService.getCountryList());
			model.addAttribute("mappedModel",enterpriseMasterOBJ);
			model.addAttribute("enterpriseMasterList", enterpriseMasterService.getEnterpriseMasterList().get(0));
		}
		return response;
	}
	
	@RequestMapping(value="/enter_master_update.html", method=RequestMethod.POST)
	public String handleSubmit(@ModelAttribute("mappedModel")EnterpriseMaster mappedModel){
		System.out.println("inside handle submit------");
		if(enterpriseMasterService.getEnterpriseMasterList().size()!=0){
			List<EnterpriseMaster> enterpriseMasterLST=enterpriseMasterService.getEnterpriseMasterList();
			Integer enterpriseMasterId=enterpriseMasterLST.get(0).getId();
			mappedModel.setId(enterpriseMasterId);
			//mappedModel.setUpdatedOn(new Date());
			System.out.println("inside handle submit---if---"+enterpriseMasterLST.get(0).getId());
			enterpriseMasterService.addEnterpriseMaster(mappedModel);
		}else{
			System.out.println("inside handle submit---else---");
			System.out.println("inside handle submit---else---"+mappedModel.getEnterpriseName());
			System.out.println("inside handle submit---else---"+mappedModel.getAddressLineFirst());
			mappedModel.setCreatedOn(new Date());
			enterpriseMasterService.addEnterpriseMaster(mappedModel);
		}
		
		System.out.println("inside handleSubmit---id--"+mappedModel.getId());
		return "redirect:/enterprise_master.html";
	}
}











