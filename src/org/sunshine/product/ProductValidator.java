package org.sunshine.product;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.sunshine.domain.Product;

public class ProductValidator implements Validator {

	/** Logger for this class and subclasses */
	protected final Log logger = LogFactory.getLog(getClass());

	public boolean supports(Class clazz) {
		return Product.class.equals(clazz);
	}

	public void validate(Object obj, Errors errors) {
	}

}
