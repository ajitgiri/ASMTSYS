package com.sd.setup.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sd.setup.dao.EnterpriseSetupDao;
import com.sd.setup.model.EnterpriseSetup;
import com.sd.setup.model.LegalEntityMaster;

@Repository
public class EnterpriseSetupDaoImpl implements EnterpriseSetupDao {

	@Autowired
    private SessionFactory sessionFactory;
	
	public void addEnterpriseSetup(EnterpriseSetup enterpriseSetup) {
		try{
			sessionFactory.getCurrentSession().saveOrUpdate(enterpriseSetup);
		}catch(Exception e){
			e.printStackTrace();
		}

	}

	@SuppressWarnings("unchecked")
	public List<EnterpriseSetup> getEnterpriseSetupList() {
		List<EnterpriseSetup> enterpriseSetupDetails=null;
		try{
			Criteria critera= sessionFactory.getCurrentSession().createCriteria(EnterpriseSetup.class).
				add(Restrictions.not(Restrictions.eq("status",2)));
			enterpriseSetupDetails = (List<EnterpriseSetup>) critera.list();
		}catch(Exception e){
			e.printStackTrace();
		}
	    return enterpriseSetupDetails;
	}

	public EnterpriseSetup getEnterpriseSetupById(int id) {
		EnterpriseSetup enterpriseSetupById=null;
		try{
			enterpriseSetupById=(EnterpriseSetup)sessionFactory.getCurrentSession().get(EnterpriseSetup.class, id);
		}catch(Exception e){
		return enterpriseSetupById;
		}
		return enterpriseSetupById;
	}

	public void deleteEnterpriseSetup(int id) {
		EnterpriseSetup enterpriseSetup = (EnterpriseSetup) sessionFactory.getCurrentSession().load(
				LegalEntityMaster.class, id);
		enterpriseSetup.setStatus(2);
		sessionFactory.getCurrentSession().saveOrUpdate(enterpriseSetup);

	}

	public void disableEnterpriseSetup(int id) {
		// TODO Auto-generated method stub

	}

	public void enableEnterpriseSetup(int id) {
		// TODO Auto-generated method stub

	}
	
}
