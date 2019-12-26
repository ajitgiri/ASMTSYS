package com.sd.setup.dao.impl;

import java.util.List;

import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.impl.Log4JLogger;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sd.setup.dao.LegalEntityMasterDao;
import com.sd.setup.model.LegalEntityMaster;

@Repository
public class LegalEntityMasterDaoImpl implements LegalEntityMasterDao {

	Log4JLogger logger= (Log4JLogger)LogFactory.getLog(LegalEntityMasterDaoImpl.class);
	 @Autowired
	    private SessionFactory sessionFactory;
	 
	public void addLegalEntityMaster(LegalEntityMaster legalEntityMaster) {
		logger.info("inside addLegalEntityMaster---method");
		try{
			logger.info("inside addLegalEntityMaster---method");
			sessionFactory.getCurrentSession().saveOrUpdate(legalEntityMaster);
			
		}catch(Exception e){
			e.printStackTrace();
		}

	}

	@SuppressWarnings("unchecked")
	public List<LegalEntityMaster> getLegalEntityMasterList() {
		List<LegalEntityMaster> legalEntityMasterDetails=null;
		try{
			//Criteria critera= sessionFactory.getCurrentSession().createCriteria(LegalEntityMaster.class);
			Criteria critera= sessionFactory.getCurrentSession().createCriteria(LegalEntityMaster.class).
				add(Restrictions.not(Restrictions.eq("status",2)));
			legalEntityMasterDetails = (List<LegalEntityMaster>) critera.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("Size >>>>>LegalEntityMasterDaoImpl>>>>>>>> : "+legalEntityMasterDetails.size());
		    return legalEntityMasterDetails;
	}

	public LegalEntityMaster getLegalEntityMasterById(int id) {
		LegalEntityMaster legalEntityMstrById=null;
		try{
			legalEntityMstrById=(LegalEntityMaster)sessionFactory.getCurrentSession().get(LegalEntityMaster.class, id);
		}catch(Exception e){
		return legalEntityMstrById;
		}
		return legalEntityMstrById;
	}

	public void deleteLegalEntityMaster(int id) {
		logger.info("inside--deleteLegalEntityMaster----");
		LegalEntityMaster legalEntityMaster = (LegalEntityMaster) sessionFactory.getCurrentSession().load(
				LegalEntityMaster.class, id);
		legalEntityMaster.setStatus(2);
		sessionFactory.getCurrentSession().saveOrUpdate(legalEntityMaster);
	}

	public void disableLegalEntityMaster(int id) {
		// TODO Auto-generated method stub

	}

	public void enableLegalEntityMaster(int id) {
		// TODO Auto-generated method stub

	}
}
