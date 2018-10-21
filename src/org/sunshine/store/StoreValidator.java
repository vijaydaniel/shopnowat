package org.sunshine.store;

import org.springframework.validation.Validator;
import org.springframework.validation.Errors;
import org.sunshine.domain.Store;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class StoreValidator implements Validator {

	/** Logger for this class and subclasses */
	protected final Log logger = LogFactory.getLog(getClass());

	public boolean supports(Class clazz) {
		return Store.class.equals(clazz);
	}

	public void validate(Object obj, Errors errors) {
	}

}
