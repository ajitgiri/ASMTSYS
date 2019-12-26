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

import com.sd.setup.dao.CountryDao;
import com.sd.setup.model.Country;

/**
 * @author SONY
 *
 */
@Repository
public class CountryDaoImpl implements CountryDao {

	 @Autowired
	 private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Country> getCountryList() {
		// TODO Auto-generated method stub
		List<Country> countryDetails=null;
		try{
			Criteria critera= sessionFactory.getCurrentSession().createCriteria(Country.class).
				add(Restrictions.not(Restrictions.eq("status",2)));
			countryDetails=(List<Country>)critera.list();
		}catch(Exception e){
			e.printStackTrace();
		}
	    return countryDetails;
	}

	public void addCountry(Country countryModel) {
		// TODO Auto-generated method stub
		try{
			sessionFactory.getCurrentSession().save(countryModel);
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}

	public Country getCountryDetail(int uid) {
		// TODO Auto-generated method stub
		Country countrymodel=null;
		try{
			countrymodel=(Country)sessionFactory.getCurrentSession().get(Country.class, uid);
		}catch(Exception e){
		return countrymodel;
		}
		return countrymodel;
	}

	public void editCountryDetail(Country countrymodel) {
		// TODO Auto-generated method stub
		try{
			Country countryedit=(Country)sessionFactory.getCurrentSession().get(Country.class, countrymodel.getId());
			countryedit.setCountryName(countrymodel.getCountryName());
			sessionFactory.getCurrentSession().saveOrUpdate(countryedit);
		}catch(Exception e){
			
		}
		
	}

	public void deleteCountry(int uid) {
		// TODO Auto-generated method stub
		try{
			Country countrydelete=(Country)sessionFactory.getCurrentSession().get(Country.class, uid);
			countrydelete.setStatus(2);
			sessionFactory.getCurrentSession().saveOrUpdate(countrydelete);
		}catch(Exception e){
			
		}
		
	}

	public void disableCountry(int uid) {
		// TODO Auto-generated method stub
		try{
			Country countryDisable=(Country)sessionFactory.getCurrentSession().get(Country.class, uid);
			countryDisable.setStatus(1);
			sessionFactory.getCurrentSession().saveOrUpdate(countryDisable);
		}catch(Exception e){
			
		}
		
	}

	public void enableCountry(int uid) {
		// TODO Auto-generated method stub
		try{
			Country countryenable=(Country)sessionFactory.getCurrentSession().get(Country.class, uid);
			countryenable.setStatus(0);
			sessionFactory.getCurrentSession().saveOrUpdate(countryenable);
		}catch(Exception e){
			
		}
		
	}

}
