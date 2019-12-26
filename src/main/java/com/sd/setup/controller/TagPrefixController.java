/**
 * 
 */
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

import com.sd.setup.model.AssetMajorCategory;
import com.sd.setup.model.AssetMinorCategory;
import com.sd.setup.model.TagPrefix;
import com.sd.setup.service.AssetMajorCategoryService;
import com.sd.setup.service.AssetMinorCategoryService;
import com.sd.setup.service.impl.TagPrefixService;

/**
 * @author SONY
 *
 */
@Controller
public class TagPrefixController {


	@Autowired
	private AssetMajorCategoryService assetMajorCategoryService;

	@Autowired
	private TagPrefixService tagPrefixService;

	@Autowired
	private AssetMinorCategoryService assetMinorCategoryService;

	Log4JLogger logger = (Log4JLogger) LogFactory.getLog(TagPrefix.class);

	TagPrefix tagPrefix = new TagPrefix();

	@RequestMapping(value = "/tag_prefix.html", method = RequestMethod.GET)
	public String showForm(Model model, HttpServletRequest request) {
		int sfId = 0;
		if (request.getParameter("id") != null) {
			sfId = Integer.parseInt(request.getParameter("id"));
		}
		logger.info("Inside TagPrefixController showForm------------");
		String result = "";
		if (sfId == 0) {
			logger.info("Inside TagPrefixController showForm----if--------");
			model.addAttribute("mappedModel", tagPrefix);
			model.addAttribute("tagPrefixList",tagPrefixService.getTagPrefixList());
			model.addAttribute("majorList",assetMajorCategoryService.getAssetMajorCategoryList());
			model.addAttribute("minorList", assetMinorCategoryService.getAssetMinorCategory());
		} else {
			logger.info("Inside TagPrefixController showForm----else--------");
			model.addAttribute("mappedModel", tagPrefix);
			model.addAttribute("tagPrefixList",tagPrefixService.getTagPrefixList(sfId));
			model.addAttribute("sId", sfId + "");
			model.addAttribute("majorList",assetMajorCategoryService.getAssetMajorCategoryList());
			model.addAttribute("minorList", assetMinorCategoryService.getAssetMinorCategory());

		}
		result="tagPrefix";
		return result;

	}

	@RequestMapping(value = "/addTag.html", method = RequestMethod.POST)
	public String addTagPrefix(@ModelAttribute("mappedModel") TagPrefix tagPrefix,HttpServletRequest request) {
		logger.info("Inside addTagPrefix() method....");
		AssetMajorCategory assetMajorCategory=assetMajorCategoryService.getAssetMajorCategoryById(tagPrefix.getAssetMajorCategory().getId());
		tagPrefix.setAssetMajorCategory(assetMajorCategory);
		AssetMinorCategory assetMinorCategory=assetMinorCategoryService.getAssetMinorCategoryById(tagPrefix.getAssetMinorCategory().getId());
		tagPrefix.setAssetMinorCategory(assetMinorCategory);
		tagPrefix.setStatus(0);
		tagPrefixService.addTagPrefix(tagPrefix);

		return "redirect:/tag_prefix.html";

	}
	
	@RequestMapping(value = "/editTag.html", method = RequestMethod.POST)
	public String editTagPrefix(@ModelAttribute("mappedModel") TagPrefix tagPrefix,HttpServletRequest request) {
		logger.info("Inside editTagPrefix() method....");
		AssetMajorCategory assetMajorCategory=assetMajorCategoryService.getAssetMajorCategoryById(tagPrefix.getAssetMajorCategory().getId());
		tagPrefix.setAssetMajorCategory(assetMajorCategory);
		AssetMinorCategory assetMinorCategory=assetMinorCategoryService.getAssetMinorCategoryById(tagPrefix.getAssetMinorCategory().getId());
	    tagPrefix.setAssetMinorCategory(assetMinorCategory);
		tagPrefix.setStatus(0);
		tagPrefixService.addTagPrefix(tagPrefix);

		return "redirect:/tag_prefix.html";

	}

	@RequestMapping(value="/tagPrefixEdit.html")
	public @ResponseBody String editTagPrefix(@RequestParam("tagPrefixId") String id,HttpServletRequest request){
			String sfDetail=null;
			TagPrefix sfMaster=null;
			logger.info("Inside editTagPrefix()-----"+id);
			if(id != null){
			int dfid=Integer.parseInt(id);
			System.out.println("id="+id);
			 try{
				 ObjectMapper objectMapper = new ObjectMapper();
				 sfMaster=tagPrefixService.getTagPrefixById(dfid);
				if(sfMaster != null){
			    	sfDetail = objectMapper.writeValueAsString(sfMaster);
				}
			}catch(Exception e){
					e.printStackTrace();
				}
			}
	return sfDetail;

}
	@RequestMapping(value = "/disable.html")
	public String disableTagPrefix(@RequestParam(value = "sfId", required = true) Integer id) {
		logger.info("Inside disableTagPrefix() method...");
		tagPrefixService.disableTagPrefix(id);
		return "redirect:/tag_prefix.html";
	}

	@RequestMapping(value = "/enable.html")
	public String enableTagPrefix(@RequestParam(value = "sfId", required = true) Integer id) {
		logger.info("Inside enableTagPrefix() method..");
		tagPrefixService.enableTagPrefix(id);
		return "redirect:/tag_prefix.html";
	}
	@RequestMapping(value = "/deleteTag.html")
	public String deleteTagPrefix(@RequestParam(value = "sfId", required = true) Integer id) {
		logger.info("Inside enableTagPrefix() method..");
		tagPrefixService.deleteTagPrefix(id);
		return "redirect:/tag_prefix.html";
	}
	
}
