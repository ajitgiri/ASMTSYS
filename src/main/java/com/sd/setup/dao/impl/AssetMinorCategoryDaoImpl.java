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

import com.sd.setup.model.AssetMinorCategory;
import com.sd.setup.dao.AssetMinorCategoryDao;


/**
 * @author SONY
 *
 */
@Repository
public class AssetMinorCategoryDaoImpl implements AssetMinorCategoryDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<AssetMinorCategory> getAssetMinorCategoryDao() {
		// TODO Auto-generated method stub
		List<AssetMinorCategory> assetMinorCategoryrDetails=null;
		try{
			Criteria critera= sessionFactory.getCurrentSession().createCriteria(AssetMinorCategory.class).
				add(Restrictions.not(Restrictions.eq("status",2)));
			assetMinorCategoryrDetails = (List<AssetMinorCategory>) critera.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("Size >>>>>AssetMinorCategoryDaoImpl>>>>>>>> : "+assetMinorCategoryrDetails.size());
		    return assetMinorCategoryrDetails;
	}

	public AssetMinorCategory getAssetMinorCategoryDao(Integer id) {
		// TODO Auto-generated method stub
		AssetMinorCategory assetMinorCategoryById=null;
		try{
			assetMinorCategoryById=(AssetMinorCategory)sessionFactory.getCurrentSession().get(AssetMinorCategory.class, id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return assetMinorCategoryById;
	
	}

}
