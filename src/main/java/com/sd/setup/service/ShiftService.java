/**
 * 
 */
package com.sd.setup.service;

import java.util.List;

import com.sd.setup.model.Shift;

/**
 * @author SONY
 *
 */
public interface ShiftService {

	List<Shift> getShiftList();

	void addshift(Shift shiftModel);

	Shift getShiftDetail(int uid);

	void editShiftDetail(Shift shiftmodel);

	void deleteShift(int uid);

	void disableShift(int uid);

	void enableShift(int uid);

}
