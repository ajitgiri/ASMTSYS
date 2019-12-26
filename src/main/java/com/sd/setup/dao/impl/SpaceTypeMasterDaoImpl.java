package com.sd.setup.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sd.setup.dao.SpaceTypeMasterDao;
import com.sd.setup.model.SpaceTypeMaster;

@Repository
public class SpaceTypeMasterDaoImpl implements SpaceTypeMasterDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addSpaceTypeMaster(SpaceTypeMaster spaceTypeMaster) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(spaceTypeMaster);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@SuppressWarnings("unchecked")
	public List<SpaceTypeMaster> getSpaceTypeMasterList() {
		List<SpaceTypeMaster> spaceTypeMasterDetails = null;
		try {
			Criteria critera = sessionFactory.getCurrentSession()
					.createCriteria(SpaceTypeMaster.class)
					.add(Restrictions.not(Restrictions.eq("status", 2)));
			spaceTypeMasterDetails = (List<SpaceTypeMaster>) critera.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return spaceTypeMasterDetails;
	}

	public SpaceTypeMaster getSpaceTypeMasterById(int id) {
		SpaceTypeMaster spaceTypeMasterId = null;
		try {
			spaceTypeMasterId = (SpaceTypeMaster) sessionFactory
					.getCurrentSession().get(SpaceTypeMaster.class, id);
		} catch (Exception e) {
			return spaceTypeMasterId;
		}
		return spaceTypeMasterId;
	}

	public void deleteSpaceTypeMaster(int id) {
		SpaceTypeMaster spaceTypeMasterId = (SpaceTypeMaster) sessionFactory
				.getCurrentSession().load(SpaceTypeMaster.class, id);
		spaceTypeMasterId.setStatus(2);
		sessionFactory.getCurrentSession().saveOrUpdate(spaceTypeMasterId);
	}

	public void disableSpaceTypeMaster(int id) {
		SpaceTypeMaster spaceTypeMasterId = (SpaceTypeMaster) sessionFactory
				.getCurrentSession().load(SpaceTypeMaster.class, id);
		spaceTypeMasterId.setStatus(1);
		sessionFactory.getCurrentSession().saveOrUpdate(spaceTypeMasterId);
	}

	public void enableSpaceTypeMaster(int id) {
		SpaceTypeMaster spaceTypeMasterId = (SpaceTypeMaster) sessionFactory
				.getCurrentSession().load(SpaceTypeMaster.class, id);
		spaceTypeMasterId.setStatus(0);
		sessionFactory.getCurrentSession().saveOrUpdate(spaceTypeMasterId);
	}
}