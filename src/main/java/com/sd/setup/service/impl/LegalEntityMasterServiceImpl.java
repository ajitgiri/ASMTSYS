package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.LegalEntityMaster;
import com.sd.setup.service.LegalEntityMasterService;
import com.sd.setup.dao.LegalEntityMasterDao;

@Transactional
@Service
public class LegalEntityMasterServiceImpl implements LegalEntityMasterService {

	@Autowired
	private LegalEntityMasterDao legalEntityMasterDao;
	
	public void addLegalEntityMaster(LegalEntityMaster legalEntityMaster) {
		legalEntityMasterDao.addLegalEntityMaster(legalEntityMaster);
	}

	public List<LegalEntityMaster> getLegalEntityMasterList() {
		// TODO Auto-generated method stub
		return legalEntityMasterDao.getLegalEntityMasterList();
	}

	public LegalEntityMaster getLegalEntityMasterById(int id) {
		// TODO Auto-generated method stub
		return legalEntityMasterDao.getLegalEntityMasterById(id);
	}

	public void deleteLegalEntityMaster(int id) {
		legalEntityMasterDao.deleteLegalEntityMaster(id);

	}

	public void disableLegalEntityMaster(int id) {
		// TODO Auto-generated method stub

	}

	public void enableLegalEntityMaster(int id) {
		// TODO Auto-generated method stub

	}

}
