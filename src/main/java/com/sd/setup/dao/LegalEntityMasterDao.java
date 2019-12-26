package com.sd.setup.dao;

import java.util.List;

import com.sd.setup.model.LegalEntityMaster;

public interface LegalEntityMasterDao {

	void addLegalEntityMaster (LegalEntityMaster legalEntityMaster);

	List<LegalEntityMaster> getLegalEntityMasterList();

	LegalEntityMaster getLegalEntityMasterById(int id);

	void deleteLegalEntityMaster(int id);

	void disableLegalEntityMaster(int id);

	void enableLegalEntityMaster(int id);
}
