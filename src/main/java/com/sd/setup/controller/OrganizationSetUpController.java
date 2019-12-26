package com.sd.setup.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.impl.Log4JLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sd.setup.model.OrganizationHierarchySetup;
import com.sd.setup.model.OrganizationHierarchySetupList;
import com.sd.setup.service.OrganizationHierarchySetupService;

	@Controller
	public class OrganizationSetUpController {

		Log4JLogger logger = (Log4JLogger) LogFactory.getLog(OrganizationSetUpController.class);

		@Autowired
		private OrganizationHierarchySetupService organizationSetupService;

		OrganizationHierarchySetupList OrgHierSetupList = new OrganizationHierarchySetupList();
		OrganizationHierarchySetup orgHierarchySetupOBJ= new OrganizationHierarchySetup();

		@RequestMapping(value = "organizational_hierarchy_setup.html", method = RequestMethod.GET)
		public String showFormFirst(Model model) {
			String response = "organizationSetup";
			int noOfL = 0;
			if (organizationSetupService.getOrganizationHierarchySetupList().size() != 0) {
				List<OrganizationHierarchySetup> orgSetupObj=organizationSetupService.getOrganizationHierarchySetupList();
				OrgHierSetupList.setOrganizationHierarchySetupLst(orgSetupObj);
				noOfL=orgSetupObj.size();
				logger.info("inside --out-- else----");
				model.addAttribute("mappedModel",OrgHierSetupList);
				logger.info("inside ---- list----"+organizationSetupService.getOrganizationHierarchySetupList());
				model.addAttribute("orgSetupServiceList", organizationSetupService.getOrganizationHierarchySetupList());
			}
			model.addAttribute("NoOfLevels", noOfL);
			model.addAttribute("mappedModel", OrgHierSetupList);
			return response;
		}

		@RequestMapping(value = "noOf_Organaization.html", method = RequestMethod.POST)
		public String showNoOfForm(Model model, HttpServletRequest req) {
			logger.info("inside OraganizationSetupController showForm---111->>");
			@SuppressWarnings("unused")
			String response = "organizationSetup";
			int noOfOrg=0;
			if(req.getParameter("nolevels") != ""){
			 noOfOrg = Integer.parseInt(req.getParameter("nolevels"));
			if (organizationSetupService.getOrganizationHierarchySetupList().size() == 0) {
				for (int i = 0; i < noOfOrg; i++) {
					logger.info("inside for---" + i);
					OrganizationHierarchySetup orgSetupObj = new OrganizationHierarchySetup();
					organizationSetupService.addOrganizationHierarchySetup(orgSetupObj);
				}
			} else {
				logger.info("inside ---- else----");
				for (int j = 0; j < noOfOrg; j++) {
					logger.info("inside ---- else--for--"+j);
					OrganizationHierarchySetup orgSetupObj2 = new OrganizationHierarchySetup();
					organizationSetupService.addOrganizationHierarchySetup(orgSetupObj2);
				}
			}
			}else{
				response = "redirect:/organizational_hierarchy_setup.html";
			}
		
			List<OrganizationHierarchySetup> orgSetupObj=organizationSetupService.getOrganizationHierarchySetupList();
			OrgHierSetupList.setOrganizationHierarchySetupLst(orgSetupObj);
			
			//logger.info("inside --out-- else----");
			model.addAttribute("mappedModel",OrgHierSetupList);
			logger.info("inside ---- list----"+organizationSetupService.getOrganizationHierarchySetupList());
			model.addAttribute("orgSetupServiceList", organizationSetupService.getOrganizationHierarchySetupList());
			return response;
		}

		@RequestMapping(value = "/organizational_hierarchy_setup_submit.html", method = RequestMethod.POST)
		public String handleSubmit(@ModelAttribute("mappedModel") OrganizationHierarchySetupList mappedModel) {
			logger.info("inside handleSubmit-----");
			String response = "redirect:/organizational_hierarchy_setup.html";
			List<OrganizationHierarchySetup> OrganizationHierarchySetupL = mappedModel.getOrganizationHierarchySetupLst();

			for (OrganizationHierarchySetup orgSetup : OrganizationHierarchySetupL) {
				organizationSetupService.addOrganizationHierarchySetup(orgSetup);
				logger.info("inside handleSubmit---for--");
			}
			logger.info("inside handleSubmit-----"+ OrganizationHierarchySetupL.size());
			return response;
		}
		
		@RequestMapping(value = "organizational_hierarchy_setupdetails.html", method = RequestMethod.GET)
		public String showOrganizationList(Model model) {
			String response = "organizationSetupTable";
			int noOfL = 0;
		
			if (organizationSetupService.getOrganizationHierarchySetupList().size() != 0) {
				List<OrganizationHierarchySetup> orgSetupObj=organizationSetupService.getOrganizationHierarchySetupList();
				OrgHierSetupList.setOrganizationHierarchySetupLst(orgSetupObj);
				
				logger.info("inside --out-- else----");
				model.addAttribute("mappedModel",OrgHierSetupList);
				logger.info("inside ---- list----"+organizationSetupService.getOrganizationHierarchySetupList());
				model.addAttribute("orgSetupServiceList", organizationSetupService.getOrganizationHierarchySetupList());
			}
			model.addAttribute("NoOfLevels", noOfL);
			model.addAttribute("mappedModel", OrgHierSetupList);
			return response;
		}
	}

