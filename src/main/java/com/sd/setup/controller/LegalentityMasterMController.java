package com.sd.setup.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sd.setup.model.LegalEntityMaster;
import com.sd.setup.service.CountryService;
import com.sd.setup.service.EnterpriseSetupService;
import com.sd.setup.service.LegalEntityMasterService;

@Controller
public class LegalentityMasterMController {
	@Autowired
	private EnterpriseSetupService enterpriseSetupSerice;
	
	@Autowired
	private CountryService countryService; 
	@Autowired
	private LegalEntityMasterService legalEntityMasterService;
	
	LegalEntityMaster legalEntityMasterOBJ=new LegalEntityMaster();
	
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	 SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	 dateFormat.setLenient(false);
	 webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }
	
	@RequestMapping(value="legal_entity_master_m.html")
	public String showForm(Model model){
		String response="legalEntityMaster";
		if(legalEntityMasterService.getLegalEntityMasterList().size()!=0){
		model.addAttribute("mtplLe",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getMultipleLegalEntitys());
		model.addAttribute("emailServerAc",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getEmailAccross());
		model.addAttribute("serviceAc",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getServerAccross());
		model.addAttribute("noLe",enterpriseSetupSerice.getEnterpriseSetupList().get(0).getNoOfLegalEntitys());
		
		model.addAttribute("legalEntityList",legalEntityMasterService.getLegalEntityMasterList());
		model.addAttribute("countryList",countryService.getCountryList());
		model.addAttribute("mappedModel",legalEntityMasterOBJ);
		}
		return response;
	}
	
	@RequestMapping(value="/leDetails.html", method=RequestMethod.GET)
	public @ResponseBody String retriveLegalEntityDetail(@RequestParam("selectLeId") Integer Leid,Model model){
		System.out.println("leDetails------------------->>>");
		String leDetail=null;
		if(Leid != null){
			try{
				 ObjectMapper objectMapper = new ObjectMapper();
				 legalEntityMasterOBJ=(LegalEntityMaster)legalEntityMasterService.getLegalEntityMasterById(Leid);
				if(legalEntityMasterOBJ != null){
					leDetail = objectMapper.writeValueAsString(legalEntityMasterOBJ);
				}
			}catch(Exception e){
			//	return leDetail;
			}
		
	}
		return leDetail;
	}
	
	
	@RequestMapping (value="update_legalentity_master.html", method=RequestMethod.POST)
	public String handleSubmit(HttpServletRequest request , @ModelAttribute ("mappedModel")LegalEntityMaster mappedModel){
		System.out.println("update_legalentity_master-----");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		MultipartFile multipartFile = multipartRequest.getFile("profileLogo");
		@SuppressWarnings("unused")
		LegalEntityMaster leId=legalEntityMasterService.getLegalEntityMasterById(mappedModel.getId());
		byte[] bFile = null;
		try {
			bFile = multipartFile.getBytes();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("inside handle Submit-----");
		mappedModel.setLogo(bFile);
		legalEntityMasterService.addLegalEntityMaster(mappedModel);
		return "redirect:/legal_entity_master_m.html";
	}
	
	 @RequestMapping(value="/Image.html", method=RequestMethod.GET)
		public @ResponseBody byte[] getImage(@RequestParam(value="id",required=false) Integer  id){
			System.out.println("inside--getImage------"+id);
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			byte[] photo;
				photo=legalEntityMasterService.getLegalEntityMasterById(id).getLogo();
			
				try {
					os.write(photo);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return os.toByteArray();
		}
			
}
