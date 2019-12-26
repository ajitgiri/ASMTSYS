/**
 * 
 */
package com.sd.setup.dao;

import java.util.List;

import com.sd.setup.model.Country;

/**
 * @author SONY
 *
 */
public interface CountryDao {

	List<Country> getCountryList();

	void addCountry(Country countryModel);

	Country getCountryDetail(int uid);

	void editCountryDetail(Country countrymodel);

	void deleteCountry(int uid);

	void disableCountry(int uid);

	void enableCountry(int uid);

}
