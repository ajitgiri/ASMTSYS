package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.EnterpriseSetup;
import com.sd.setup.service.EnterpriseSetupService;
import com.sd.setup.dao.EnterpriseSetupDao;

@Transactional
@Service
public class EnterpriseSetupServiceImpl implements EnterpriseSetupService {

	@Autowired
	private EnterpriseSetupDao enterpriseSetupDao;
	
	public void addEnterpriseSetup(EnterpriseSetup enterpriseSetup) {
		enterpriseSetupDao.addEnterpriseSetup(enterpriseSetup);

	}

	public List<EnterpriseSetup> getEnterpriseSetupList() {
		// TODO Auto-generated method stub
		return enterpriseSetupDao.getEnterpriseSetupList();
	}

	public EnterpriseSetup getEnterpriseSetupById(int id) {
		// TODO Auto-generated method stub
		return enterpriseSetupDao.getEnterpriseSetupById(id);
	}

	public void deleteEnterpriseSetup(int id) {
		enterpriseSetupDao.deleteEnterpriseSetup(id);
	}

	public void disableEnterpriseSetup(int id) {
		// TODO Auto-generated method stub

	}

	public void enableEnterpriseSetup(int id) {
		// TODO Auto-generated method stub

	}

}
