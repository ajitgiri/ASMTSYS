package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.OrganizationHierarchySetup;
import com.sd.setup.service.OrganizationHierarchySetupService;
import com.sd.setup.dao.OrganizationHierarchySetupDao;

@Service
@Transactional
public class OrganizationHierarchySetupServiceImpl implements OrganizationHierarchySetupService{

	@Autowired
	private OrganizationHierarchySetupDao orgSetupDao;
	
	public void addOrganizationHierarchySetup(
			OrganizationHierarchySetup organizationHierarchySetup) {
		orgSetupDao.addOrganizationHierarchySetup(organizationHierarchySetup);

	}

	public List<OrganizationHierarchySetup> getOrganizationHierarchySetupList() {
		return orgSetupDao.getOrganizationHierarchySetupList();
	}

	public OrganizationHierarchySetup getOrganizationHierarchySetupById(int id) {
		return orgSetupDao.getOrganizationHierarchySetupById(id);
	}

	public void deleteOrganizationHierarchySetup(int uid) {
		orgSetupDao.deleteOrganizationHierarchySetup(uid);

	}

	public void disableOrganizationHierarchySetup(int uid) {

	}

	public void enableOrganizationHierarchySetup(int uid) {
		// TODO Auto-generated method stub

	}
}
