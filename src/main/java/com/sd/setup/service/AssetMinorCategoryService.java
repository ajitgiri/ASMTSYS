/**
 * 
 */
package com.sd.setup.service;

import java.util.List;

import com.sd.setup.model.AssetMinorCategory;

/**
 * @author SONY
 *
 */
public interface AssetMinorCategoryService {

	List<AssetMinorCategory> getAssetMinorCategory();

	AssetMinorCategory getAssetMinorCategoryById(Integer id);

}
