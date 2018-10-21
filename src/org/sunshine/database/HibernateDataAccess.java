package org.sunshine.database;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface HibernateDataAccess {

	public void saveObject(Object object);
	public void updateObject(Object object);
	public void deleteObject(Object object);
	public void executeUpdateQuery(String sqlQuery);
	public void executeFind(String sqlQuery);
	public void saveAllObject(List<? extends Object> object);
}
