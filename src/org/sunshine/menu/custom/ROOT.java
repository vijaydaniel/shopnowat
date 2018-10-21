package org.sunshine.menu.custom;
import java.util.Arrays;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class ROOT {

	private Menu menu;

	public ROOT() {
		
	}

	public ROOT(Menu menu) {
		this.menu=menu;
	}

	public Menu getMenu() {
		return menu;
	}

	@XmlElement
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	
	@Override
	public String toString() {
		return menu.toString();
	}

}
