package com.sd.setup.service;

import java.util.List;

import com.sd.setup.model.EnterpriseSetup;

public interface EnterpriseSetupService {

	void addEnterpriseSetup (EnterpriseSetup enterpriseSetup);

	List<EnterpriseSetup> getEnterpriseSetupList();

	EnterpriseSetup getEnterpriseSetupById(int id);

	void deleteEnterpriseSetup(int id);

	void disableEnterpriseSetup(int id);

	void enableEnterpriseSetup(int id);
}
