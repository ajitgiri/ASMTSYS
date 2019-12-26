/**
 * 
 */
package com.sd.setup.service;

import java.util.List;

import com.sd.setup.model.AssetMajorCategory;

/**
 * @author SONY
 *
 */
public interface AssetMajorCategoryService {

	List<AssetMajorCategory> getAssetMajorCategoryList();

	AssetMajorCategory getAssetMajorCategoryById(Integer id);

}
