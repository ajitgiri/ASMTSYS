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

import com.sd.setup.model.TagPrefix;
import com.sd.setup.dao.TagPrefixDao;


/**
 * @author SONY
 *
 */
@Repository
public class TagPrefixDaoImpl implements TagPrefixDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<TagPrefix> getTagPrefixList() {
		// TODO Auto-generated method stub
		List<TagPrefix> tagPrefixList=null;
		try{
		Criteria criteria=sessionFactory.getCurrentSession().createCriteria(TagPrefix.class).add(Restrictions.not(Restrictions.eq("status",2)));
		tagPrefixList=criteria.list();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return tagPrefixList;
	}

	@SuppressWarnings("unchecked")
	public List<TagPrefix> getTagPrefixList(int sfId) {
		// TODO Auto-generated method stub
		List<TagPrefix> leList;
		leList = sessionFactory.getCurrentSession()
                .createQuery("from TagPrefix  where legalentityMaster.id=:liId")
                .setInteger("liId", sfId).list();

		return leList;
	}

	public void addTagPrefix(TagPrefix tagPrefix) {
		// TODO Auto-generated method stub
		try{
			sessionFactory.getCurrentSession().saveOrUpdate(tagPrefix);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

	public TagPrefix getTagPrefixById(int dfid) {
		// TODO Auto-generated method stub
		TagPrefix tagPrefix=null;
		try{
		tagPrefix=(TagPrefix) sessionFactory.getCurrentSession().get(TagPrefix.class, dfid);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return tagPrefix;
	}

	public void disableTagPrefix(Integer id) {
		// TODO Auto-generated method stub
		TagPrefix  tagPrefix=(TagPrefix) sessionFactory.getCurrentSession().load(TagPrefix.class,id);
		tagPrefix.setStatus(1);
		sessionFactory.getCurrentSession().saveOrUpdate(tagPrefix);
		
	}

	public void enableTagPrefix(Integer id) {
		// TODO Auto-generated method stub
		TagPrefix  tagPrefix=(TagPrefix) sessionFactory.getCurrentSession().load(TagPrefix.class,id);
		tagPrefix.setStatus(0);
		sessionFactory.getCurrentSession().saveOrUpdate(tagPrefix);
		
	}

	public void deleteTagPrefix(Integer id) {
		// TODO Auto-generated method stub
		TagPrefix  tagPrefix=(TagPrefix) sessionFactory.getCurrentSession().load(TagPrefix.class,id);
		tagPrefix.setStatus(2);
		sessionFactory.getCurrentSession().saveOrUpdate(tagPrefix);

	}

}
