/**
 * @author Ranjan Kumar Sahu
 * created on:26/06/2014
 * Service Interface for Uom(get,add,delete,update,disable,enable)
 */
package com.sd.setup.service;

import java.util.List;

import com.sd.setup.model.UomModel;


public interface UomService {
    /*
     * For addiing the UoM 
     */
	void adduom(UomModel uommodel);
    /*
     * For getting the UoM List
     */
	
	List<UomModel> getUomList();
	/*
     * For getting the UoM Details according to the Id
     */
	UomModel getUomDetail(int uid);
	/*
     * For saving the UoM Details after editing
     */
	void editUomDetail(UomModel uommodel);
	/*
     * For saving the UoM Details after editing
     */
	void deleteUom(int uid);

	void disableUom(int uid);

	void enableUom(int uid);

}
