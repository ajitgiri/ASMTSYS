/**
 * 
 */
package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.AssetMinorCategory;
import com.sd.setup.dao.AssetMinorCategoryDao;
import com.sd.setup.service.AssetMinorCategoryService;

/**
 * @author SONY
 *
 */
@Service
@Transactional
public class AssetMinorCategoryServiceImpl implements AssetMinorCategoryService {

	@Autowired
	private AssetMinorCategoryDao assetMinorCategoryDao;
	
	public List<AssetMinorCategory> getAssetMinorCategory() {
		// TODO Auto-generated method stub
		return assetMinorCategoryDao.getAssetMinorCategoryDao();
	}

	public AssetMinorCategory getAssetMinorCategoryById(Integer id) {
		// TODO Auto-generated method stub
		return assetMinorCategoryDao.getAssetMinorCategoryDao(id);
	}

}
