package com.sd.setup.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.impl.Log4JLogger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sd.setup.model.Ecozone;
import com.sd.setup.model.LegalEntityMaster;
import com.sd.setup.model.Unit;
import com.sd.setup.service.EcozoneService;
import com.sd.setup.service.LegalEntityMasterService;
import com.sd.setup.service.UnitService;

@Controller
public class UnitController {

	@Autowired
	private LegalEntityMasterService legalEntityMasterService;

	@Autowired
	private UnitService unitService;

	@Autowired
	private EcozoneService ecoZoneService;

	Log4JLogger logger = (Log4JLogger) LogFactory
			.getLog(Unit.class);
	Unit unit = new Unit();

	@RequestMapping(value = "unit_master.html", method = RequestMethod.GET)
	public String showForm(Model model, HttpServletRequest request) {
		int sfId = 0;
		if (request.getParameter("id") != null) {
			sfId = Integer.parseInt(request.getParameter("id"));
		}
		logger.info("Inside UnitController showForm------------");
		String result = "";
		if (sfId == 0) {
			logger.info("Inside UnitController showForm----if--------");
			model.addAttribute("mappedModel", unit);
			model.addAttribute("unitList",unitService.getUnitList());
			model.addAttribute("legalentityList",legalEntityMasterService.getLegalEntityMasterList());
			model.addAttribute("employeeList", ecoZoneService.getEcozoneList());
		} else {
			logger.info("Inside UnitController showForm----else--------");
			model.addAttribute("mappedModel", unit);
			model.addAttribute("unitList",unitService.getUnitList(sfId));
			model.addAttribute("sId", sfId + "");
			model.addAttribute("legalentityList",legalEntityMasterService.getLegalEntityMasterList());
			model.addAttribute("employeeList", ecoZoneService.getEcozoneList());

		}
		result="unit";
		return result;

	}

	@RequestMapping(value = "/add.html", method = RequestMethod.POST)
	public String addUnit(@ModelAttribute("mappedModel") Unit unit,HttpServletRequest request) {
		logger.info("Inside addUnit() method....");
		LegalEntityMaster legalentityMaster=legalEntityMasterService.getLegalEntityMasterById(unit.getLegalentityMaster().getId());
		unit.setLegalentityMaster(legalentityMaster);
		Ecozone ecoZoneMaster=ecoZoneService.getEcozoneById(unit.getEcozone().getId());
		unit.setEcozone(ecoZoneMaster);
		unit.setStatus(0);
		unitService.addUnit(unit);

		return "redirect:/unit_master.html";

	}
	
	@RequestMapping(value = "/edit.html", method = RequestMethod.POST)
	public String editUnit(@ModelAttribute("mappedModel") Unit unit,HttpServletRequest request) {
		logger.info("Inside editUnit() method....");
		LegalEntityMaster legalentityMaster=legalEntityMasterService.getLegalEntityMasterById(unit.getLegalentityMaster().getId());
		unit.setLegalentityMaster(legalentityMaster);
		Ecozone ecoZoneMaster=ecoZoneService.getEcozoneById(unit.getEcozone().getId());
	    unit.setEcozone(ecoZoneMaster);
		unit.setStatus(0);
		unitService.addUnit(unit);

		return "redirect:/unit_master.html";

	}

	@RequestMapping(value="/unitEdit.html")
	public @ResponseBody String editUnit(@RequestParam("unitId") String id,HttpServletRequest request){
			String sfDetail=null;
			Unit sfMaster=null;
			logger.info("Inside editUnit()-----"+id);
			if(id != null){
			int dfid=Integer.parseInt(id);
			System.out.println("id="+id);
			 try{
				 ObjectMapper objectMapper = new ObjectMapper();
				 sfMaster=unitService.getUnitById(dfid);
				if(sfMaster != null){
			    	sfDetail = objectMapper.writeValueAsString(sfMaster);
				}
			}catch(Exception e){
					e.printStackTrace();
				}
			}
	return sfDetail;

}
	@RequestMapping(value = "/disableSF.html")
	public String disableUnit(@RequestParam(value = "sfId", required = true) Integer id) {
		logger.info("Inside disableUnit() method...");
		unitService.disableUnit(id);
		return "redirect:/unit_master.html";
	}

	@RequestMapping(value = "/enableSF.html")
	public String enableUnit(@RequestParam(value = "sfId", required = true) Integer id) {
		logger.info("Inside enableUnit() method..");
		unitService.enableUnit(id);
		return "redirect:/unit_master.html";
	}
	@RequestMapping(value = "/delete.html")
	public String deleteUnit(@RequestParam(value = "sfId", required = true) Integer id) {
		logger.info("Inside disableUnit() method...");
		unitService.deleteUnit(id);
		return "redirect:/unit_master.html";
	}


}
