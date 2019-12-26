/**
 * 
 */
package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.Country;
import com.sd.setup.service.CountryService;
import com.sd.setup.dao.CountryDao;

/**
 * @author SONY
 *
 */
@Service
@Transactional
public class CountryServiceImpl implements CountryService{

	@Autowired
	private CountryDao countryDao;

	public List<Country> getCountryList() {
		// TODO Auto-generated method stub
		return countryDao.getCountryList();
	}


	public void addcountry(Country countryModel) {
		// TODO Auto-generated method stub
		countryDao.addCountry(countryModel);
	}


	public Country getCountryDetail(int uid) {
		// TODO Auto-generated method stub
		return countryDao.getCountryDetail(uid);
	}


	public void editCountryDetail(Country countrymodel) {
		// TODO Auto-generated method stub
		countryDao.editCountryDetail(countrymodel);
	}


	public void deleteCountry(int uid) {
		// TODO Auto-generated method stub
		countryDao.deleteCountry(uid);
	}


	public void disableCountry(int uid) {
		// TODO Auto-generated method stub
		countryDao.disableCountry(uid);
	}


	public void enableCountry(int uid) {
		// TODO Auto-generated method stub
		countryDao.enableCountry(uid);
	}

}
