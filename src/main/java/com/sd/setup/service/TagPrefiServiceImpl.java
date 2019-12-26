/**
 * 
 */
package com.sd.setup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.TagPrefix;
import com.sd.setup.dao.TagPrefixDao;
import com.sd.setup.service.impl.TagPrefixService;

/**
 * @author SONY
 *
 */
@Service
@Transactional
public class TagPrefiServiceImpl implements TagPrefixService{

	@Autowired
	private TagPrefixDao tagPrefixDao;
	
	public List<TagPrefix> getTagPrefixList() {
		// TODO Auto-generated method stub
		return tagPrefixDao.getTagPrefixList();
	}

	public List<TagPrefix> getTagPrefixList(int sfId) {
		// TODO Auto-generated method stub
		return tagPrefixDao.getTagPrefixList(sfId);
	}

	public void addTagPrefix(TagPrefix tagPrefix) {
		// TODO Auto-generated method stub
		tagPrefixDao.addTagPrefix(tagPrefix);
	}

	public TagPrefix getTagPrefixById(int dfid) {
		// TODO Auto-generated method stub
		return tagPrefixDao.getTagPrefixById(dfid);
	}

	public void disableTagPrefix(Integer id) {
		// TODO Auto-generated method stub
		tagPrefixDao.disableTagPrefix(id);
	}

	public void enableTagPrefix(Integer id) {
		// TODO Auto-generated method stub
		tagPrefixDao.enableTagPrefix(id);
	}


	public void deleteTagPrefix(Integer id) {
		// TODO Auto-generated method stub
		tagPrefixDao.deleteTagPrefix(id);
	}

}
