package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.SpaceTypeMaster;
import com.sd.setup.service.SpaceTypeMasterService;
import com.sd.setup.dao.SpaceTypeMasterDao;

@Service
@Transactional
public class SpaceTypeMasterServiceImpl implements SpaceTypeMasterService {

	@Autowired
	private SpaceTypeMasterDao spaceTypeMasterDao;
	

	public void addSpaceTypeMaster(SpaceTypeMaster spaceTypeMaster) {
		spaceTypeMasterDao.addSpaceTypeMaster(spaceTypeMaster);

	}


	public List<SpaceTypeMaster> getSpaceTypeMasterList() {
		// TODO Auto-generated method stub
		return spaceTypeMasterDao.getSpaceTypeMasterList();
	}


	public SpaceTypeMaster getSpaceTypeMasterById(int id) {
		// TODO Auto-generated method stub
		return spaceTypeMasterDao.getSpaceTypeMasterById(id);
	}


	public void deleteSpaceTypeMaster(int id) {
		spaceTypeMasterDao.deleteSpaceTypeMaster(id);

	}


	public void disableSpaceTypeMaster(int id) {
		spaceTypeMasterDao.disableSpaceTypeMaster(id);

	}


	public void enableSpaceTypeMaster(int id) {
		spaceTypeMasterDao.enableSpaceTypeMaster(id);

	}

}
