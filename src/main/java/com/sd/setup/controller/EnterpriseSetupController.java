package com.sd.setup.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.impl.Log4JLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sd.setup.model.EnterpriseSetup;
import com.sd.setup.model.LegalEntityMaster;
import com.sd.setup.model.LegalEntitySM;
import com.sd.setup.service.EnterpriseSetupService;
import com.sd.setup.service.LegalEntityMasterService;


@Controller
public class EnterpriseSetupController {

	Log4JLogger logger=(Log4JLogger)LogFactory.getLog(EnterpriseSetupController.class);
	
	@Autowired
	private EnterpriseSetupService enterpriseSetupSerice;
	@Autowired
	private LegalEntityMasterService legalEntityMasterService;

	EnterpriseSetup enterpriseSetup = new EnterpriseSetup();
	LegalEntitySM legalSM= new LegalEntitySM();
	LegalEntityMaster legalMaster = new LegalEntityMaster();
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	 SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	 dateFormat.setLenient(false);
	 webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }
	
	@RequestMapping(value = "/enterprise_setup.html", method = RequestMethod.GET)
	public String showForm(Model model) {
		String response = "enterpriseSetup";
		//logger.info("EnterpriseSetupController--showForm----------");
		model.addAttribute("mappedModel", enterpriseSetup);
		if(enterpriseSetupSerice.getEnterpriseSetupList().size() != 0){
			model.addAttribute("enterpriseSetupSericeList",	enterpriseSetupSerice.getEnterpriseSetupList());
			//logger.info("\nEnterpriseSetupController--showForm------if----"+enterpriseSetupSerice.getEnterpriseSetupList().get(0).getMultipleLegalEntitys());
			model.addAttribute("mtplLe",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getMultipleLegalEntitys());
			model.addAttribute("emailServerAc",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getEmailAccross());
			model.addAttribute("serviceAc",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getServerAccross());
			model.addAttribute("noLe",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getNoOfLegalEntitys());
		}
		
		return response;
	}

	@RequestMapping(value = "/enterprise_setup_succes.html", method = RequestMethod.POST)
	public String handleSubmit(Model model,	@ModelAttribute("mappedModel") EnterpriseSetup mappedModel) {
		String response = "enterpriseSetup";
		
		// Cheking if Multiple LE is NO
		if(mappedModel.getMultipleLegalEntitys().equals("0")){
			mappedModel.setNoOfLegalEntitys(1);
			mappedModel.setTracking("1");
			enterpriseSetupSerice.addEnterpriseSetup(mappedModel);
		//	legalMaster.setLegalEntityName("Legal EntityName1");
		//	legalMaster.setLegalEntityCode("Legal EntityCode1");
		//	legalEntityMasterService.addLegalEntityMaster(legalMaster);
			response="redirect:/legal_entity_master.html";
		}
		
		// Cheking if Multiple LE is YES
		if(mappedModel.getMultipleLegalEntitys().equals("1")){
			
			System.out.println("mtpl LE----1-else-");
				if(enterpriseSetupSerice.getEnterpriseSetupList().size()!=0){
					Integer enterpriseId2=enterpriseSetupSerice.getEnterpriseSetupList().get(0).getId();
					Integer noLE1=enterpriseSetupSerice.getEnterpriseSetupList().get(0).getNoOfLegalEntitys();
					noLE1=noLE1+mappedModel.getNoOfLegalEntitys();
					mappedModel.setNoOfLegalEntitys(noLE1);
					mappedModel.setId(enterpriseId2);
					mappedModel.setTracking("1");

				}
				int leList=0;
				if(legalEntityMasterService.getLegalEntityMasterList().size()!=0){
					leList=leList+legalEntityMasterService.getLegalEntityMasterList().size();
				}
				
				int i=mappedModel.getNoOfLegalEntitys();
				enterpriseSetupSerice.addEnterpriseSetup(mappedModel);
				for(int j=leList;j<i;j++){
					LegalEntityMaster llms= new LegalEntityMaster();
					llms.setLegalEntityCode("code"+j);
					llms.setLegalEntityName("name"+j);
					legalEntityMasterService.addLegalEntityMaster(llms);
					
				}
				response="redirect:/legal_entity_master.html";
			
		}
		return response;
	}
	
	@RequestMapping(value="/enterprise_setup_back.html")
	public String showFormBack(Model model){
		String response = "enterpriseSetup";
		model.addAttribute("mappedModel", enterpriseSetup);
		if(enterpriseSetupSerice.getEnterpriseSetupList().size() != 0){
			model.addAttribute("enterpriseSetupSericeList",	enterpriseSetupSerice.getEnterpriseSetupList());
		//	logger.info("\nEnterpriseSetupController--showForm------if----"+enterpriseSetupSerice.getEnterpriseSetupList().get(0).getMultipleLegalEntitys());
			model.addAttribute("mtplLe",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getMultipleLegalEntitys());
			model.addAttribute("emailServerAc",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getEmailAccross());
			model.addAttribute("serviceAc",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getServerAccross());
			model.addAttribute("noLe",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getNoOfLegalEntitys());
		}
		
		return response;
	}
	
}
