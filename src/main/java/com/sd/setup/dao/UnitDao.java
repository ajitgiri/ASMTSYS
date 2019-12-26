/**
 * 
 */
package com.sd.setup.dao;

import java.util.List;

import com.sd.setup.model.Unit;

/**
 * @author SONY
 *
 */
public interface UnitDao {

	List<Unit> getUnitList();

	List<Unit> getUnitList(int leEntityId);

	void addUnit(Unit mappedModel);

	void deleteUnit(Integer id);

	void enableUnit(Integer id);

	void disableUnit(Integer id);

	Unit getUnitById(int unitid);

}
