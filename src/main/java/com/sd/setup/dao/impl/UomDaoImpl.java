package com.sd.setup.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sd.setup.dao.UomDao;
import com.sd.setup.model.UomModel;

@Repository
public class UomDaoImpl implements UomDao{
    @Autowired
    private SessionFactory sessionFactory;

	public void adduom(UomModel uommodel) {
		// TODO Auto-generated method stub
		try{
			sessionFactory.getCurrentSession().save(uommodel);
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}

	@SuppressWarnings("unchecked")
	public List<UomModel> getUomList() {
		// TODO Auto-generated method stub
		List<UomModel> uomdetails=null;
		try{
			Criteria critera= sessionFactory.getCurrentSession().createCriteria(UomModel.class).
				add(Restrictions.not(Restrictions.eq("status",2)));
			uomdetails=(List<UomModel>)critera.list();
		}catch(Exception e){
			e.printStackTrace();
		}
	    return uomdetails;
	}

	public UomModel getUomDetail(int id) {
		// TODO Auto-generated method stub
		UomModel uommodel=null;
		try{
			uommodel=(UomModel)sessionFactory.getCurrentSession().get(UomModel.class, id);
		}catch(Exception e){
		return uommodel;
		}
		return uommodel;
	}

	public void editUomDetail(UomModel uommodel) {
		// TODO Auto-generated method stub
		try{
			UomModel uommodledit=(UomModel)sessionFactory.getCurrentSession().get(UomModel.class, uommodel.getId());
			uommodledit.setUom_name(uommodel.getUom_name());
			sessionFactory.getCurrentSession().saveOrUpdate(uommodledit);
		}catch(Exception e){
			
		}
	}

	public void deleteUom(int uid) {
		// TODO Auto-generated method stub
		try{
			UomModel uommodeldelete=(UomModel)sessionFactory.getCurrentSession().get(UomModel.class, uid);
			uommodeldelete.setStatus(2);
			sessionFactory.getCurrentSession().saveOrUpdate(uommodeldelete);
		}catch(Exception e){
			
		}
	}

	public void disable(int uid) {
		// TODO Auto-generated method stub
		try{
			UomModel uommodeldelete=(UomModel)sessionFactory.getCurrentSession().get(UomModel.class, uid);
			uommodeldelete.setStatus(1);
			sessionFactory.getCurrentSession().saveOrUpdate(uommodeldelete);
		}catch(Exception e){
			
		}
	}

	public void enable(int uid) {
		// TODO Auto-generated method stub
		try{
			UomModel uommodeldelete=(UomModel)sessionFactory.getCurrentSession().get(UomModel.class, uid);
			uommodeldelete.setStatus(0);
			sessionFactory.getCurrentSession().saveOrUpdate(uommodeldelete);
		}catch(Exception e){
			
		}
	}

}
