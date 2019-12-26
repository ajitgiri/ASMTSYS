/**
 * 
 */
package com.sd.setup.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sd.setup.model.AssetMajorCategory;
import com.sd.setup.dao.AssetMajorCategoryDao;

/**
 * @author SONY
 * 
 */
@Repository
public class AssetMajorCategoryDaoImpl implements AssetMajorCategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<AssetMajorCategory> getAssetMajorCategory() {
		// TODO Auto-generated method stub
		List<AssetMajorCategory> assetMajorCategoryrDetails = null;
		try {
			Criteria critera = sessionFactory.getCurrentSession()
					.createCriteria(AssetMajorCategory.class)
					.add(Restrictions.not(Restrictions.eq("status", 2)));
			assetMajorCategoryrDetails = (List<AssetMajorCategory>) critera
					.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Size >>>>>AssetMajorCategoryDaoImpl>>>>>>>> : "
				+ assetMajorCategoryrDetails.size());
		return assetMajorCategoryrDetails;
	}

	public AssetMajorCategory getAssetMajorCategoryDao(Integer id) {
		// TODO Auto-generated method stub
		AssetMajorCategory assetMajorCategoryById = null;
		try {
			assetMajorCategoryById = (AssetMajorCategory) sessionFactory
					.getCurrentSession().get(AssetMajorCategory.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return assetMajorCategoryById;

	}

}
