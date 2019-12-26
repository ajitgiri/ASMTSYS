/**
 * 
 */
package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.Unit;
import com.sd.setup.dao.UnitDao;
import com.sd.setup.service.UnitService;

/**
 * @author SONY
 *
 */
@Service
@Transactional
public class UnitServiceImpl  implements UnitService{

	@Autowired
	private UnitDao unitDao;
	
	public List<Unit> getUnitList() {
		// TODO Auto-generated method stub
		return unitDao.getUnitList();
	}

	public List<Unit> getUnitList(int leEntityId) {
		// TODO Auto-generated method stub
		return unitDao.getUnitList(leEntityId);
	}

	public void addUnit(Unit mappedModel) {
		// TODO Auto-generated method stub
		unitDao.addUnit(mappedModel);
	}

	public void deleteUnit(Integer id) {
		// TODO Auto-generated method stub
		unitDao.deleteUnit(id);
	}

	public void enableUnit(Integer id) {
		// TODO Auto-generated method stub
		unitDao.enableUnit(id);
	}

	public void disableUnit(Integer id) {
		// TODO Auto-generated method stub
		unitDao.disableUnit(id);
	}

	public Unit getUnitById(int unitid) {
		// TODO Auto-generated method stub
		return unitDao.getUnitById(unitid);
	}

}
