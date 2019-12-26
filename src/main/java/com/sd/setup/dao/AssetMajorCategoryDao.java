/**
 * 
 */
package com.sd.setup.dao;

import java.util.List;

import com.sd.setup.model.AssetMajorCategory;


/**
 * @author SONY
 *
 */
public interface AssetMajorCategoryDao {

	List<AssetMajorCategory> getAssetMajorCategory();

	AssetMajorCategory getAssetMajorCategoryDao(Integer id);

}
