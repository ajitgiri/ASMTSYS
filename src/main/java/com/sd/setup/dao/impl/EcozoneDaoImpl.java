package com.sd.setup.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sd.setup.model.Ecozone;
import com.sd.setup.dao.EcozoneDao;

@Repository
public class EcozoneDaoImpl implements EcozoneDao {

	 @Autowired
	    private SessionFactory sessionFactory;
	
	public void addEcozone(Ecozone ecozone) {
		try{
			sessionFactory.getCurrentSession().saveOrUpdate(ecozone);
		}catch(Exception e){
			e.printStackTrace();
		}

	}

	@SuppressWarnings("unchecked")
	public List<Ecozone> getEcozoneList() {
		List<Ecozone> ecoZoneetails=null;
		try{
			Criteria critera= sessionFactory.getCurrentSession().createCriteria(Ecozone.class).
				add(Restrictions.not(Restrictions.eq("status",2)));
			ecoZoneetails = (List<Ecozone>) critera.list();
		}catch(Exception e){
			e.printStackTrace();
		}
	    return ecoZoneetails;
	}

	public Ecozone getEcozoneById(int id) {
		Ecozone ecozoneId=null;
		try{
			ecozoneId=(Ecozone)sessionFactory.getCurrentSession().get(Ecozone.class, id);
		}catch(Exception e){
		return ecozoneId;
		}
		return ecozoneId;
	}

	public void deleteEcozone(int id) {
		Ecozone ecozone = (Ecozone) sessionFactory.getCurrentSession().load(
				Ecozone.class, id);
		ecozone.setStatus(2);
		sessionFactory.getCurrentSession().saveOrUpdate(ecozone);
	}

	public void disableEcozone(int id) {
		Ecozone ecozone = (Ecozone) sessionFactory.getCurrentSession().load(
				Ecozone.class, id);
		ecozone.setStatus(1);
		sessionFactory.getCurrentSession().saveOrUpdate(ecozone);
	}

	public void enableEcozone(int id) {
		Ecozone ecozone = (Ecozone) sessionFactory.getCurrentSession().load(
				Ecozone.class, id);
		ecozone.setStatus(0);
		sessionFactory.getCurrentSession().saveOrUpdate(ecozone);
	}

}
