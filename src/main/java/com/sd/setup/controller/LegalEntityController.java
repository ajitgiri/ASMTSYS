package com.sd.setup.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.sd.setup.model.EnterpriseSetup;
import com.sd.setup.model.LegalEntityMaster;
import com.sd.setup.model.LegalEntitySM;
import com.sd.setup.service.EnterpriseSetupService;
import com.sd.setup.service.LegalEntityMasterService;

@Controller
public class LegalEntityController {

	
	@Autowired
	private LegalEntityMasterService legalEntityMasterService;
	@Autowired
	private EnterpriseSetupService enterpriseSetupService;
	
	EnterpriseSetup entrEnterpriseSetup= new EnterpriseSetup();
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	 SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	 dateFormat.setLenient(false);
	 webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }

	@RequestMapping(value = "/legal_entity_master.html", method = RequestMethod.GET)
	public String showForm(Model model,	@ModelAttribute("mappedModel") LegalEntitySM mappedModel ) {
		System.out.println("inside LegalEntityController showForm-----");
		String response = "legalEntityMasterSetup";
		//int noLeFromEnterSetup=enterpriseSetupService.getEnterpriseSetupList().get(0).getNoOfLegalEntitys();
		LegalEntitySM sm = new LegalEntitySM();
		List<LegalEntityMaster> smlist = legalEntityMasterService.getLegalEntityMasterList();
		if(enterpriseSetupService.getEnterpriseSetupList().get(0).getNoOfLegalEntitys()==1 & legalEntityMasterService.getLegalEntityMasterList().size()==1){
			System.out.println("inside LegalEntityController showForm---if--");
			sm.setLegalEntitySMList(smlist);
		}else if(enterpriseSetupService.getEnterpriseSetupList().get(0).getNoOfLegalEntitys()==1){
			System.out.println("inside LegalEntityController showForm---else--if--");
			smlist.add(new LegalEntityMaster());
			sm.setLegalEntitySMList(smlist);
		}else{
			System.out.println("inside LegalEntityController showForm---else--");
			int noOfle=enterpriseSetupService.getEnterpriseSetupList().get(0).getNoOfLegalEntitys();
			int leSize=legalEntityMasterService.getLegalEntityMasterList().size();
		for(int i=leSize; i < noOfle; i++){
			System.out.println("legal entity--for---"+i);
			smlist.add(new LegalEntityMaster());
		}
		sm.setLegalEntitySMList(smlist);
		}
		System.out.println("list size >>>>>>>>>>: "+smlist.size());
		
		
		model.addAttribute("mappedModel", sm);
		
	//	logger.info("legal entity--------name---list Size----"+legalEntityMasterService.getLegalEntityMasterList().size());
		
		return response;
	}
 
	@RequestMapping(method = RequestMethod.POST)
	public String handleSubmit(@ModelAttribute("mappedModel") LegalEntitySM mappedModel) {
	//	logger.info("inside LegalEntityController handleSubmit---enterprisesetupObj----"+mappedModel.getLegalEntitySMList().get(0).getEnterPriseSetup().getId());
	
		List<LegalEntityMaster> legalentitymasters=mappedModel.getLegalEntitySMList();
	
		for(LegalEntityMaster legalentitymaster:legalentitymasters ){
			legalEntityMasterService.addLegalEntityMaster(legalentitymaster);
		}
		System.out.println("End");
		//logger.info("inside LegalEntityController showForm----111111111111-"+request.getParameter("legalEntitynames2"));
		return"leMasterUpdateConfirm";
	}
	
	@RequestMapping(value="/legal_entity_master_dit")
	public @ResponseBody String getUomDetail(@RequestParam("LegalEntityId") String id,HttpServletRequest request){
		String legalEntityMasterDetail=null;
		System.out.println("Inside getUomDetail------------>");
		return legalEntityMasterDetail;
		
	}
	
	@RequestMapping(value="deleteLe.html")
	public String deleteLeDetails(@RequestParam(value = "id", required = false) Integer leId){
		String response="";
		System.out.println("id----"+leId);
		legalEntityMasterService.deleteLegalEntityMaster(leId);
		int noles=enterpriseSetupService.getEnterpriseSetupList().get(0).getNoOfLegalEntitys();
		noles=noles-1;
		Integer enterpriseId2=enterpriseSetupService.getEnterpriseSetupList().get(0).getId();
		
		entrEnterpriseSetup.setNoOfLegalEntitys(noles);
		entrEnterpriseSetup.setMultipleLegalEntitys("1");
		entrEnterpriseSetup.setId(enterpriseId2);
		System.out.println("id--bfr--");
		enterpriseSetupService.addEnterpriseSetup(entrEnterpriseSetup);
		//mappedModel.setNoOfLegalEntitys(noLE1);
		//mappedModel.setId(enterpriseId2);
		response="redirect:/legal_entity_master.html";
		return response;
	}
}

