/**
 * 
 */
package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.Shift;
import com.sd.setup.service.ShiftService;
import com.sd.setup.dao.ShiftDao;

/**
 * @author SONY
 *
 */
@Service
@Transactional
public class ShiftServiceImpl implements ShiftService {

	@Autowired
	private ShiftDao shiftDao;
	

	public List<Shift> getShiftList() {
		// TODO Auto-generated method stub
		return shiftDao.getShiftList();
	}


	public void addshift(Shift shiftModel) {
		// TODO Auto-generated method stub
		shiftDao.addShift(shiftModel);
	}


	public Shift getShiftDetail(int uid) {
		// TODO Auto-generated method stub
		return shiftDao.getShiftDetail(uid);
	}


	public void editShiftDetail(Shift shiftmodel) {
		// TODO Auto-generated method stub
		shiftDao.editShiftDetail(shiftmodel);	
	}


	public void deleteShift(int uid) {
		// TODO Auto-generated method stub
		shiftDao.deleteShift(uid);
	}


	public void disableShift(int uid) {
		// TODO Auto-generated method stub
		shiftDao.disableShift(uid);
	}


	public void enableShift(int uid) {
		// TODO Auto-generated method stub
		shiftDao.enableShift(uid);
	}

}
