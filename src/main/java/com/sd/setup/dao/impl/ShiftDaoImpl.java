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

import com.sd.setup.dao.ShiftDao;
import com.sd.setup.model.Shift;

/**
 * @author SONY
 *
 */
@Repository
public class ShiftDaoImpl implements ShiftDao{

	 @Autowired
	 private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")

	public List<Shift> getShiftList() {
		// TODO Auto-generated method stub
		List<Shift> shiftDetails=null;
		try{
			Criteria critera= sessionFactory.getCurrentSession().createCriteria(Shift.class).
				add(Restrictions.not(Restrictions.eq("status",2)));
			shiftDetails=(List<Shift>)critera.list();
		}catch(Exception e){
			e.printStackTrace();
		}
	    return shiftDetails;
	}


	public void addShift(Shift shiftModel) {
		// TODO Auto-generated method stub
		try{
			sessionFactory.getCurrentSession().save(shiftModel);
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}


	public Shift getShiftDetail(int uid) {
		// TODO Auto-generated method stub
		Shift shiftmodel=null;
		try{
			shiftmodel=(Shift)sessionFactory.getCurrentSession().get(Shift.class, uid);
		}catch(Exception e){
		return shiftmodel;
		}
		return shiftmodel;
	}


	public void editShiftDetail(Shift shiftmodel) {
		// TODO Auto-generated method stub
		try{
			Shift shiftedit=(Shift)sessionFactory.getCurrentSession().get(Shift.class, shiftmodel.getId());
			shiftedit.setShiftName(shiftmodel.getShiftName());
			shiftedit.setStartTime(shiftmodel.getStartTime());
			shiftedit.setEndTime(shiftmodel.getEndTime());
			sessionFactory.getCurrentSession().saveOrUpdate(shiftedit);
		}catch(Exception e){
			
		}
		
	}


	public void deleteShift(int uid) {
		// TODO Auto-generated method stub
		try{
			Shift shiftdelete=(Shift)sessionFactory.getCurrentSession().get(Shift.class, uid);
			shiftdelete.setStatus(2);
			sessionFactory.getCurrentSession().saveOrUpdate(shiftdelete);
		}catch(Exception e){
			
		}
		
	}


	public void disableShift(int uid) {
		// TODO Auto-generated method stub
		try{
			Shift shiftDisable=(Shift)sessionFactory.getCurrentSession().get(Shift.class, uid);
			shiftDisable.setStatus(1);
			sessionFactory.getCurrentSession().saveOrUpdate(shiftDisable);
		}catch(Exception e){
			
		}
		
	}


	public void enableShift(int uid) {
		// TODO Auto-generated method stub
		try{
			Shift shiftenable=(Shift)sessionFactory.getCurrentSession().get(Shift.class, uid);
			shiftenable.setStatus(0);
			sessionFactory.getCurrentSession().saveOrUpdate(shiftenable);
		}catch(Exception e){
			
		}
		
	}

	
}
