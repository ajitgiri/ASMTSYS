/**
 * 
 */
package com.sd.setup.dao;

import java.util.List;

import com.sd.setup.model.Shift;

/**
 * @author SONY
 *
 */
public interface ShiftDao {

	List<Shift> getShiftList();

	void addShift(Shift shiftModel);

	Shift getShiftDetail(int uid);

	void editShiftDetail(Shift shiftmodel);

	void deleteShift(int uid);

	void disableShift(int uid);

	void enableShift(int uid);

	
}
