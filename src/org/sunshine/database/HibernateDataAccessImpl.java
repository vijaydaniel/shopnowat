package org.sunshine.database;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class HibernateDataAccessImpl implements HibernateDataAccess {

	private HibernateTemplate hibernateTemplate;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	public void saveObject(Object object) {
		hibernateTemplate.saveOrUpdate(object);
	}

	public void saveAllObject(List<? extends Object> object) {
		hibernateTemplate.saveOrUpdateAll(object);
	}
	
	@Override
	public void updateObject(Object object) {
		hibernateTemplate.update(object);
	}

	@Override
	public void deleteObject(Object object) {
		hibernateTemplate.delete(object);
	}

	@Override
	public void executeUpdateQuery(final String sqlQuery) {
		try {
			hibernateTemplate.execute(new HibernateCallback<Integer>() {

				@Override
				public Integer doInHibernate(Session session) throws HibernateException,
						SQLException {
					Transaction tx = session.beginTransaction();
					System.out.println(sqlQuery);
					Query query = session.createQuery(sqlQuery);
					Integer updatedEntities = query.executeUpdate();
					tx.commit();
					return updatedEntities;
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void executeFind(String sqlQuery) {
		hibernateTemplate.find(sqlQuery);
	}

}
