/**
 * 
 */
package com.sd.setup.dao;

import java.util.List;

import com.sd.setup.model.AssetMinorCategory;

/**
 * @author SONY
 *
 */
public interface AssetMinorCategoryDao {

	List<AssetMinorCategory> getAssetMinorCategoryDao();

	AssetMinorCategory getAssetMinorCategoryDao(Integer id);

}
