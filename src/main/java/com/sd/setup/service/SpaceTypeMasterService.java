package com.sd.setup.service;

import java.util.List;

import com.sd.setup.model.SpaceTypeMaster;

public interface SpaceTypeMasterService {

	void addSpaceTypeMaster (SpaceTypeMaster spaceTypeMaster);

	List<SpaceTypeMaster> getSpaceTypeMasterList();

	SpaceTypeMaster getSpaceTypeMasterById(int id);

	void deleteSpaceTypeMaster(int id);

	void disableSpaceTypeMaster(int id);

	void enableSpaceTypeMaster(int id);
}
