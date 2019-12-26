package com.sd.setup.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sd.setup.dao.OrganizationHierarchySetupDao;
import com.sd.setup.model.OrganizationHierarchySetup;
@Repository
public class OrganizationHierarchySetupDaoImpl implements OrganizationHierarchySetupDao{

	@Autowired
    private SessionFactory sessionFactory;

   public void addOrganizationHierarchySetup(
		OrganizationHierarchySetup organizationHierarchySetup) {

	try{
		sessionFactory.getCurrentSession().saveOrUpdate(organizationHierarchySetup);
	}catch(Exception e){
		e.printStackTrace();
	}

}

@SuppressWarnings("unchecked")
public List<OrganizationHierarchySetup> getOrganizationHierarchySetupList() {
	// TODO Auto-generated method stub
	return sessionFactory.getCurrentSession().createQuery("from OrganizationHierarchySetup").list();
}

public OrganizationHierarchySetup getOrganizationHierarchySetupById(int id) {
	OrganizationHierarchySetup orgsetupId= (OrganizationHierarchySetup) sessionFactory.getCurrentSession().get(OrganizationHierarchySetup.class, id);
	return orgsetupId ;
}

public void deleteOrganizationHierarchySetup(int uid) {
	sessionFactory.getCurrentSession().delete(uid);

}

public void disableOrganizationHierarchySetup(int uid) {
	// TODO Auto-generated method stub

}

public void enableOrganizationHierarchySetup(int uid) {
	// TODO Auto-generated method stub

}
}
