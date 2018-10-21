package org.sunshine.hitrate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sunshine.database.HibernateDataAccess;

@Service
public class HitRateService {

	@Autowired
	private HibernateDataAccess hibernateDataAccess;
	
	public void setHibernateDataAccess(HibernateDataAccess hibernateDataAccess)	{
		this.hibernateDataAccess = hibernateDataAccess;
	}
	
	public void setHitRate(){
		hibernateDataAccess.executeUpdateQuery("update HitRate set counter = counter + 1");
	}
	
}
