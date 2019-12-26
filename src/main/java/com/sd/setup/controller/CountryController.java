/**
 * 
 */
package com.sd.setup.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.impl.Log4JLogger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sd.setup.model.Country;
import com.sd.setup.service.CountryService;

/**
 * @author Ajit Kumar
 * 08-10-14
 *
 */
@Controller
public class CountryController {

	Log4JLogger logger=(Log4JLogger)LogFactory.getLog(CountryController.class);
	@Autowired
	private CountryService countryService;
	
	Country country =new Country();
	
	@RequestMapping(value="/country_setup.html",method=RequestMethod.GET)
	public String showForm(Model model){
		String resonse="country";
		List<Country> countryList=null;
		countryList=countryService.getCountryList();
		if(countryList!=null){
			model.addAttribute("countryLST",countryList);
			model.addAttribute("mappedModel",country);
		}else {
			model.addAttribute("mappedModel",country);
		}
		return resonse;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	   public String add(@Valid @ModelAttribute("mappedModel") Country mappedModel, BindingResult result){
		logger.info("inside submit-------------");
		mappedModel.setCreatedOn(new Date());
		mappedModel.setStatus(0);
		   /*if(result.hasErrors()){
			   logger.info("inside submit---------if----");
			  // List<Country> countrydetails=countryService.getCountryList();
			  // model.addAttribute("countrydetails",countrydetails);
			   return "redirect:/country_setup.html";
		    }else{
		    	logger.info("inside submit--------else-----");
		    	//countryService.addcountry(mappedModel);
		   }*/
		countryService.addcountry(mappedModel);
		   return "redirect:/country_setup.html";
	   }
	
	
	@RequestMapping(value="/getcountrylist")
	public ModelAndView getCountryList(HttpServletRequest request,Model model){
		List<Country> countrydetails=null;
		try{
			countrydetails=countryService.getCountryList();
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("countrydetails",null);
		}
		model.addAttribute("countrydetails",countrydetails);
		return new ModelAndView("country");
		}
	
	@RequestMapping(value="/getcountrydetail")
	public @ResponseBody String getCountryDetail(@RequestParam("id") String id,HttpServletRequest request){
		String countryDetail=null;
		Country countrymodel=null;
		if(id != null){
			int uid=Integer.parseInt(id);
			try{
				 ObjectMapper objectMapper = new ObjectMapper();
				countrymodel=countryService.getCountryDetail(uid);
				if(countrymodel != null){
					countryDetail = objectMapper.writeValueAsString(countrymodel);
				}
			}catch(Exception e){
				return countryDetail;
			}
		}
		return countryDetail;
		
	}
	
	@RequestMapping(value="/editcountrydetail")
	public ModelAndView editCountryDetail(@ModelAttribute("countrymodel")@Valid Country countrymodel,BindingResult result,Model model)
	{
		if(result.hasErrors()){
			   List<Country> countrydetails=countryService.getCountryList();
			   model.addAttribute("countrydetails",countrydetails);
			   return new ModelAndView("country");
		   }
		if( countrymodel.getCountryName() != null || countrymodel.getCountryName() != ""){
			try{
				countryService.editCountryDetail(countrymodel);
			}catch(Exception e){
			    e.printStackTrace();
			}
		}
		return new ModelAndView("redirect:/country/getcountrylist.html");
		
	}
	/*
	 * Delete's the countrydetails means in status column it is updating 2
	 */
	@RequestMapping(value="/deletecountry")
	public ModelAndView deleteCountry(@RequestParam("id") String id){
		if( id != null){
			int uid=Integer.parseInt(id);
			try{
				countryService.deleteCountry(uid);
			}catch(Exception e){
			
			}
		}
		return new ModelAndView("redirect:/country/getcountrylist.html");
		
	}
	/*
	 * Disable's the countrydetails means in status column it is updating 1
	 */
	@RequestMapping(value="/disablecountry")
	public ModelAndView disableCountry(@RequestParam("id") String id){
		if( id != null){
			int uid=Integer.parseInt(id);
			try{
				countryService.disableCountry(uid);
			}catch(Exception e){
			
			}
		}
		return new ModelAndView("redirect:/country/getcountrylist.html");
	}
	/*
	 * Enable's the countrydetails means in status column it is updating 0
	 */
	@RequestMapping(value="/enablecountry")
	public ModelAndView enableCountry(@RequestParam("id") String id){
		if( id != null){
			int uid=Integer.parseInt(id);
			try{
				countryService.enableCountry(uid);
			}catch(Exception e){
			
			}
		}
		return new ModelAndView("redirect:/country/getcountrylist.html");
	}

}
