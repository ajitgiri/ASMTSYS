/**
 * 
 */
package com.sd.setup.service;

import java.util.List;

import com.sd.setup.model.Country;


/**
 * @author SONY
 *
 */
public interface CountryService {

	List<Country> getCountryList();

	void addcountry(Country countryModel);

	Country getCountryDetail(int uid);

	void editCountryDetail(Country countrymodel);

	void deleteCountry(int uid);

	void disableCountry(int uid);

	void enableCountry(int uid);

}
