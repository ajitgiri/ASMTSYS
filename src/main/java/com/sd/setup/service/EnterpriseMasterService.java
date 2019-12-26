package com.sd.setup.service;

import java.util.List;

import com.sd.setup.model.EnterpriseMaster;

public interface EnterpriseMasterService {

	void addEnterpriseMaster (EnterpriseMaster enterpriseMaster);

	List<EnterpriseMaster> getEnterpriseMasterList();

	EnterpriseMaster getEnterpriseMasterById(int id);

	void deleteEnterpriseMaster(int uid);

	void disableEnterpriseMaster(int uid);

	void enableEnterpriseMaster(int uid);
}
