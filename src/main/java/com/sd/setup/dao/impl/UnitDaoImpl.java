/**
 * 
 */
package com.sd.setup.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sd.setup.model.Unit;
import com.sd.setup.dao.UnitDao;

/**
 * @author SONY
 *
 */
@Repository
public class UnitDaoImpl implements UnitDao{

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<Unit> getUnitList() {
		// TODO Auto-generated method stub

		List<Unit> unitList=null;
		try{
		Criteria criteria=sessionFactory.getCurrentSession().createCriteria(Unit.class).add(Restrictions.not(Restrictions.eq("status",2)));
		unitList=criteria.list();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return unitList;
	}

	@SuppressWarnings("unchecked")
	public List<Unit> getUnitList(int leEntityId) {
		// TODO Auto-generated method stub
		List<Unit> leList;
		leList = sessionFactory.getCurrentSession().createQuery("from Unit  where legalentityMaster.id=:liId").setInteger("liId", leEntityId).list();

		return leList;
	}

	public void addUnit(Unit mappedModel) {
		// TODO Auto-generated method stub
		try{
			sessionFactory.getCurrentSession().saveOrUpdate(mappedModel);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

	public void deleteUnit(Integer id) {
		// TODO Auto-generated method stub
		Unit  unit=(Unit) sessionFactory.getCurrentSession().load(Unit.class,id);
		unit.setStatus(2);
		sessionFactory.getCurrentSession().saveOrUpdate(unit);
	
	}

	public void enableUnit(Integer id) {
		// TODO Auto-generated method stub
		Unit  unit=(Unit) sessionFactory.getCurrentSession().load(Unit.class,id);
		unit.setStatus(0);
		sessionFactory.getCurrentSession().saveOrUpdate(unit);
	
	}

	public void disableUnit(Integer id) {
		// TODO Auto-generated method stub
		Unit  unit=(Unit) sessionFactory.getCurrentSession().load(Unit.class,id);
		unit.setStatus(1);
		sessionFactory.getCurrentSession().saveOrUpdate(unit);

	}

	public Unit getUnitById(int unitid) {
		// TODO Auto-generated method stub
		Unit unit=null;
		try{
		unit=(Unit) sessionFactory.getCurrentSession().get(Unit.class, unitid);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return unit;
	}

}
