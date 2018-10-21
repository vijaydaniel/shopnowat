package org.sunshine.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sunshine.database.HibernateDataAccess;
import org.sunshine.domain.Location;

@Service
public class LocationService {
	@Autowired
	private LocationDataAccess locationDataAccess;
	@Autowired
	private HibernateDataAccess hibernateDataAccess;

	public void setLocationDataAccess(LocationDataAccess locationDataAccess) {
		this.locationDataAccess = locationDataAccess;
	}

	public List<Location> getLocations() {
		return this.locationDataAccess.getAllLocations();
	}

	public List<Location> getLocations(String name) {
		return this.locationDataAccess.getAllLocations(name);
	}

	public void addLocation(Location location) {
		hibernateDataAccess.saveObject(location);
	}
	
	public void editLocation(Location command) {
		hibernateDataAccess.updateObject(command);
	}

	public void deleteLocation(Location command) {
		hibernateDataAccess.deleteObject(command);
	}

	public void updateLocationInShoppingCart(Location location,String previousName) {
		locationDataAccess.updateLocationInShoppingCart(location,previousName);		
	}
}