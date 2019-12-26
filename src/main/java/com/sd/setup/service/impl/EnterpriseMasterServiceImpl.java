package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.EnterpriseMaster;
import com.sd.setup.service.EnterpriseMasterService;
import com.sd.setup.dao.EnterpriseMasterDao;

@Service
@Transactional
public class EnterpriseMasterServiceImpl implements EnterpriseMasterService {

	@Autowired
	private EnterpriseMasterDao enterpriseMasterDao;
	
	public void addEnterpriseMaster(EnterpriseMaster enterpriseMaster) {
		enterpriseMasterDao.addEnterpriseMaster(enterpriseMaster);

	}

	public List<EnterpriseMaster> getEnterpriseMasterList() {
		// TODO Auto-generated method stub
		return enterpriseMasterDao.getEnterpriseMasterList();
	}

	public EnterpriseMaster getEnterpriseMasterById(int id) {
		// TODO Auto-generated method stub
		return enterpriseMasterDao.getEnterpriseMasterById(id);
	}

	public void deleteEnterpriseMaster(int uid) {
		enterpriseMasterDao.deleteEnterpriseMaster(uid);

	}

	public void disableEnterpriseMaster(int uid) {
		// TODO Auto-generated method stub

	}

	public void enableEnterpriseMaster(int uid) {
		// TODO Auto-generated method stub

	}

}
