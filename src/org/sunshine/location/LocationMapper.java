package org.sunshine.location;

import java.util.List;
import org.sunshine.domain.Location;

public abstract interface LocationMapper {
	public abstract List<Location> getAllLocations();

	public abstract List<Location> getAllLocationsByName(String name);

	public abstract void updateLocationInShoppingCart(String name,
			String previousName);

}