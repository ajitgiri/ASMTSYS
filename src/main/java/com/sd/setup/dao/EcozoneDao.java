package com.sd.setup.dao;

import java.util.List;

import com.sd.setup.model.Ecozone;

public interface EcozoneDao {

	void addEcozone (Ecozone ecozone);

	List<Ecozone> getEcozoneList();

	Ecozone getEcozoneById(int id);

	void deleteEcozone(int id);

	void disableEcozone(int id);

	void enableEcozone(int id);
}
