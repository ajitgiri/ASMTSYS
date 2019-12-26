package com.sd.setup.dao;

import java.util.List;

import com.sd.setup.model.UomModel;

public interface UomDao {

	void adduom(UomModel uommodel);

	List<UomModel> getUomList();

	UomModel getUomDetail(int id);

	void editUomDetail(UomModel uommodel);

	void deleteUom(int uid);

	void disable(int uid);

	void enable(int uid);

}
