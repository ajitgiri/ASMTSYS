/**
 * 
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

import com.sd.setup.model.Shift;
import com.sd.setup.service.ShiftService;

/**
 * @author SONY
 *
 */
@RequestMapping(value="/shift")
@Controller
public class ShiftController {
	

		@Autowired
		private ShiftService shiftService;
		
		@RequestMapping(value="/addshift")
		   public ModelAndView add(@ModelAttribute("shiftbean") @Valid Shift shiftModel,BindingResult result,HttpServletRequest request,Model model){
			java.sql.Date ourJavaDateObject = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			shiftModel.setCreatedOn(ourJavaDateObject);
			shiftModel.setStatus(0);
			   if(result.hasErrors()){
				   List<Shift> shiftdetails=shiftService.getShiftList();
				   model.addAttribute("shiftdetails",shiftdetails);
				   return new ModelAndView("shift");
			   }
			   if(shiftModel.getShiftCode() != null || shiftModel.getShiftName() != null || shiftModel.getShiftCode() == "" || shiftModel.getShiftName() == ""){
				   try{
					   shiftService.addshift(shiftModel);
					}catch(Exception e){
						e.printStackTrace();
					}
			   }else{
			   }
			   return new ModelAndView("redirect:/shift/getshiftlist.html");
		   }
		@ModelAttribute("shiftbean")
		public Shift getShift(){
			return new Shift();
			
		}
		@RequestMapping(method=RequestMethod.GET)
		public String handleRequest(){
			return "shiftbean";
		}
		@ModelAttribute("shiftmodel")
		public Shift getShift1(){
			return new Shift();
			
		}
		@RequestMapping(method=RequestMethod.GET,value="/editshiftdetail11")
		public String handleRequest1(){
			return "shiftmodel";
		}
		
		/*
		 * returns UoM List object and set to attribute shiftdetails
		 */
		@RequestMapping(value="/getshiftlist")
		public ModelAndView getShiftList(HttpServletRequest request,Model model){
			List<Shift> shiftdetails=null;
			try{
				shiftdetails=shiftService.getShiftList();
			}catch(Exception e){
				e.printStackTrace();
				model.addAttribute("shiftdetails",null);
			}
			model.addAttribute("shiftdetails",shiftdetails);
			return new ModelAndView("shift");
			}
		
		/*
		 * return's specific UoM details 
		 */
		@RequestMapping(value="/getshiftdetail")
		public @ResponseBody String getShiftDetail(@RequestParam("id") String id,HttpServletRequest request){
			String shiftDetail=null;
			Shift shiftmodel=null;
			if(id != null){
				int uid=Integer.parseInt(id);
				try{
					 ObjectMapper objectMapper = new ObjectMapper();
					shiftmodel=shiftService.getShiftDetail(uid);
					if(shiftmodel != null){
						shiftDetail = objectMapper.writeValueAsString(shiftmodel);
					}
				}catch(Exception e){
					return shiftDetail;
				}
			}
			return shiftDetail;
			
		}
		/*
		 * Edit's only UoM Name corresponding to UoM ID
		 */
		@RequestMapping(value="/editshiftdetail")
		public ModelAndView editShiftDetail(@ModelAttribute("shiftmodel")@Valid Shift shiftmodel,BindingResult result,Model model)
		{
			if(result.hasErrors()){
				   List<Shift> shiftdetails=shiftService.getShiftList();
				   model.addAttribute("shiftdetails",shiftdetails);
				   return new ModelAndView("shift");
			   }
			if( shiftmodel.getShiftName() != null || shiftmodel.getShiftName() != ""){
				try{
					shiftService.editShiftDetail(shiftmodel);
				}catch(Exception e){
				    e.printStackTrace();
				}
			}
			return new ModelAndView("redirect:/shift/getshiftlist.html");
			
		}
		/*
		 * Delete's the shiftdetails means in status column it is updating 2
		 */
		@RequestMapping(value="/deleteshift")
		public ModelAndView deleteShift(@RequestParam("id") String id){
			if( id != null){
				int uid=Integer.parseInt(id);
				try{
					shiftService.deleteShift(uid);
				}catch(Exception e){
				
				}
			}
			return new ModelAndView("redirect:/shift/getshiftlist.html");
			
		}
		/*
		 * Disable's the shiftdetails means in status column it is updating 1
		 */
		@RequestMapping(value="/disableshift")
		public ModelAndView disableShift(@RequestParam("id") String id){
			if( id != null){
				int uid=Integer.parseInt(id);
				try{
					shiftService.disableShift(uid);
				}catch(Exception e){
				
				}
			}
			return new ModelAndView("redirect:/shift/getshiftlist.html");
		}
		/*
		 * Enable's the shiftdetails means in status column it is updating 0
		 */
		@RequestMapping(value="/enableshift")
		public ModelAndView enableShift(@RequestParam("id") String id){
			if( id != null){
				int uid=Integer.parseInt(id);
				try{
					shiftService.enableShift(uid);
				}catch(Exception e){
				
				}
			}
			return new ModelAndView("redirect:/shift/getshiftlist.html");
		}


}
