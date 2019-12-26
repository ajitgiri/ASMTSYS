/**
 * 
 */
package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.AssetMajorCategory;
import com.sd.setup.dao.AssetMajorCategoryDao;
import com.sd.setup.service.AssetMajorCategoryService;

/**
 * @author SONY
 *
 */
@Service
@Transactional
public class AssetMajorCategoryServiceImpl implements AssetMajorCategoryService{

	@Autowired
	private AssetMajorCategoryDao assetMajorCategoryDao;
	
	public List<AssetMajorCategory> getAssetMajorCategoryList() {
		// TODO Auto-generated method stub
		return assetMajorCategoryDao.getAssetMajorCategory();
	}

	public AssetMajorCategory getAssetMajorCategoryById(Integer id) {
		// TODO Auto-generated method stub
		return assetMajorCategoryDao.getAssetMajorCategoryDao(id);
	}

}
