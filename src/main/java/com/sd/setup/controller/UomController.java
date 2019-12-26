/*
 * File Created By : Ranjan Sahu
 * File Created on : 26/06/2014
 * Control layer for UoM Master (add,update,delete,enable & Disable)
 */
package com.sd.setup.controller;

import java.util.Calendar;
import java.util.List;




import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sd.setup.model.UomModel;
import com.sd.setup.service.UomService;

@RequestMapping(value="/uom")
@Controller
public class UomController {
	
	/*
	 * UomService is autowired to controller   
	 */
	@Autowired
	UomService uomservice;
	
	/*
	 * Request for adduom been handled where UoM Model is set and passed to service layer
	 * attributes
	 * UoM Code,UoM Name,Status,and created on  
	 */
	@RequestMapping(value="/adduom")
	   public ModelAndView add(@ModelAttribute("uombean") @Valid UomModel uomModel,BindingResult result,HttpServletRequest request,Model model){
		System.out.println("adduom()--------------");
		java.sql.Date ourJavaDateObject = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		uomModel.setCreated_on(ourJavaDateObject);
		uomModel.setStatus(0);
		   if(result.hasErrors()){
			   List<UomModel> uomdetails=uomservice.getUomList();
			   model.addAttribute("uomdetails",uomdetails);
			   return new ModelAndView("uomMaster");
		   }
		   if(uomModel.getUom_code() != null || uomModel.getUom_name() != null || uomModel.getUom_code() == "" || uomModel.getUom_name() == ""){
			   try{
				   uomservice.adduom(uomModel);
				}catch(Exception e){
					e.printStackTrace();
				}
		   }else{
		   }
		   return new ModelAndView("redirect:/uom/getuomlist.html");
	   }
	@ModelAttribute("uombean")
	public UomModel getUomModel(){
		return new UomModel();
		
	}
	@RequestMapping(method=RequestMethod.GET)
	public String handleRequest(){
		return "uombean";
	}
	@ModelAttribute("uommodel")
	public UomModel getUomModel1(){
		return new UomModel();
		
	}
	@RequestMapping(method=RequestMethod.GET,value="/edituomdetail11")
	public String handleRequest1(){
		return "uommodel";
	}
	
	/*
	 * returns UoM List object and set to attribute uomdetails
	 */
	@RequestMapping(value="/getuomlist")
	public ModelAndView getUomList(HttpServletRequest request,Model model){
		List<UomModel> uomdetails=null;
		try{
			uomdetails=uomservice.getUomList();
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("uomdetails",null);
		}
		model.addAttribute("uomdetails",uomdetails);
		return new ModelAndView("uomMaster");
		}
	
	/*
	 * return's specific UoM details 
	 */
	@RequestMapping(value="/getuomdetail")
	public @ResponseBody String getUomDetail(@RequestParam("id") String id,HttpServletRequest request){
		String uomDetail=null;
		UomModel uommodel=null;
		if(id != null){
			int uid=Integer.parseInt(id);
			try{
				 ObjectMapper objectMapper = new ObjectMapper();
				uommodel=uomservice.getUomDetail(uid);
				if(uommodel != null){
					uomDetail = objectMapper.writeValueAsString(uommodel);
				}
			}catch(Exception e){
				return uomDetail;
			}
		}
		return uomDetail;
		
	}
	/*
	 * Edit's only UoM Name corresponding to UoM ID
	 */
	@RequestMapping(value="/edituomdetail")
	public ModelAndView editUomDetail(@ModelAttribute("uommodel")@Valid UomModel uommodel,BindingResult result,Model model)
	{
		if(result.hasErrors()){
			   List<UomModel> uomdetails=uomservice.getUomList();
			   model.addAttribute("uomdetails",uomdetails);
			   return new ModelAndView("uomMaster");
		   }
		if( uommodel.getUom_name() != null || uommodel.getUom_name() != ""){
			try{
				uomservice.editUomDetail(uommodel);
			}catch(Exception e){
			    e.printStackTrace();
			}
		}
		return new ModelAndView("redirect:/uom/getuomlist.html");
		
	}
	/*
	 * Delete's the uomdetails means in status column it is updating 2
	 */
	@RequestMapping(value="/deleteuom")
	public ModelAndView deleteUom(@RequestParam("id") String id){
		if( id != null){
			int uid=Integer.parseInt(id);
			try{
				uomservice.deleteUom(uid);
			}catch(Exception e){
			
			}
		}
		return new ModelAndView("redirect:/uom/getuomlist.html");
		
	}
	/*
	 * Disable's the uomdetails means in status column it is updating 1
	 */
	@RequestMapping(value="/disableuom")
	public ModelAndView disableUom(@RequestParam("id") String id){
		if( id != null){
			int uid=Integer.parseInt(id);
			try{
				uomservice.disableUom(uid);
			}catch(Exception e){
			
			}
		}
		return new ModelAndView("redirect:/uom/getuomlist.html");
	}
	/*
	 * Enable's the uomdetails means in status column it is updating 0
	 */
	@RequestMapping(value="/enableuom")
	public ModelAndView enableUom(@RequestParam("id") String id){
		if( id != null){
			int uid=Integer.parseInt(id);
			try{
				uomservice.enableUom(uid);
			}catch(Exception e){
			
			}
		}
		return new ModelAndView("redirect:/uom/getuomlist.html");
	}
}
