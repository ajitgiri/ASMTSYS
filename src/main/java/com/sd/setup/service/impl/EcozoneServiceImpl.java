package com.sd.setup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.setup.model.Ecozone;
import com.sd.setup.dao.EcozoneDao;
import com.sd.setup.service.EcozoneService;

@Service
@Transactional
public class EcozoneServiceImpl implements EcozoneService {

	@Autowired
	private EcozoneDao ecozoneDao;
	
	public void addEcozone(Ecozone ecozone) {
		ecozoneDao.addEcozone(ecozone);
	}

	public List<Ecozone> getEcozoneList() {
		return ecozoneDao.getEcozoneList();
	}

	public Ecozone getEcozoneById(int id) {
		return ecozoneDao.getEcozoneById(id);
	}

	public void deleteEcozone(int id) {
		ecozoneDao.deleteEcozone(id);
	}

	public void disableEcozone(int id) {
		ecozoneDao.disableEcozone(id);
	}

	public void enableEcozone(int id) {
		ecozoneDao.enableEcozone(id);
	}

}
