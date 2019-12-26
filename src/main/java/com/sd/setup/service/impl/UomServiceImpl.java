package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.UomModel;
import com.sd.setup.service.UomService;
import com.sd.setup.dao.UomDao;

@Service
public class UomServiceImpl implements UomService{
	@Autowired
	UomDao uomdao;

	
	@Transactional
	public void adduom(UomModel uommodel) {
		// TODO Auto-generated method stub
		 uomdao.adduom(uommodel);
	}


	@Transactional
	public List<UomModel> getUomList() {
		// TODO Auto-generated method stub
		return uomdao.getUomList();
	}


	@Transactional
	public UomModel getUomDetail(int id) {
		// TODO Auto-generated method stub
		return uomdao.getUomDetail(id);
	}


	@Transactional
	public void editUomDetail(UomModel uommodel) {
		// TODO Auto-generated method stub
		 uomdao.editUomDetail(uommodel);
	}


	@Transactional
	public void deleteUom(int uid) {
		// TODO Auto-generated method stub
		uomdao.deleteUom(uid);
	}


	@Transactional
	public void disableUom(int uid) {
		// TODO Auto-generated method stub
		uomdao.disable(uid);
	}


	@Transactional
	public void enableUom(int uid) {
		// TODO Auto-generated method stub
		uomdao.enable(uid);
	}
}
