package com.sd.setup.dao;

import java.util.List;

import com.sd.setup.model.OrganizationHierarchySetup;

public interface OrganizationHierarchySetupDao {
	void addOrganizationHierarchySetup (OrganizationHierarchySetup organizationHierarchySetup);

	List<OrganizationHierarchySetup> getOrganizationHierarchySetupList();

	OrganizationHierarchySetup getOrganizationHierarchySetupById(int id);

	void deleteOrganizationHierarchySetup(int uid);

	void disableOrganizationHierarchySetup(int uid);

	void enableOrganizationHierarchySetup(int uid);
}
