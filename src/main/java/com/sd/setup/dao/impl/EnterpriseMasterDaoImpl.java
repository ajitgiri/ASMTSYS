package com.sd.setup.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sd.setup.dao.EnterpriseMasterDao;
import com.sd.setup.model.EnterpriseMaster;

@Repository
public class EnterpriseMasterDaoImpl implements EnterpriseMasterDao {

	@Autowired
    private SessionFactory sessionFactory;

public void addEnterpriseMaster(EnterpriseMaster enterpriseMaster) {
	try{
		sessionFactory.getCurrentSession().saveOrUpdate(enterpriseMaster);
	}catch(Exception e){
		e.printStackTrace();
	}

}

@SuppressWarnings("unchecked")
public List<EnterpriseMaster> getEnterpriseMasterList() {
	List<EnterpriseMaster> EnterpriseMasterDetails=null;
	try{
		Criteria critera= sessionFactory.getCurrentSession().createCriteria(EnterpriseMaster.class).
			add(Restrictions.not(Restrictions.eq("status",2)));
		EnterpriseMasterDetails = (List<EnterpriseMaster>) critera.list();
	}catch(Exception e){
		e.printStackTrace();
	}
    return EnterpriseMasterDetails;
}

public EnterpriseMaster getEnterpriseMasterById(int id) {
	EnterpriseMaster EnterpriseMasterById=null;
	try{
		EnterpriseMasterById=(EnterpriseMaster)sessionFactory.getCurrentSession().get(EnterpriseMaster.class, id);
	}catch(Exception e){
	return EnterpriseMasterById;
	}
	return EnterpriseMasterById;
}

public void deleteEnterpriseMaster(int uid) {
	EnterpriseMaster enterpriseMaster = (EnterpriseMaster) sessionFactory.getCurrentSession().load(
			EnterpriseMaster.class, uid);
	enterpriseMaster.setStatus(2);
	sessionFactory.getCurrentSession().saveOrUpdate(enterpriseMaster);

}

public void disableEnterpriseMaster(int uid) {
	// TODO Auto-generated method stub

}

public void enableEnterpriseMaster(int uid) {
	// TODO Auto-generated method stub

}

}
