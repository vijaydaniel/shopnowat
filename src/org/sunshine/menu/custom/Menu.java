package org.sunshine.menu.custom;
import java.util.Arrays;
import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;

public class Menu {
	private String id;
	private String name;
	private List<Menu> menu;
	
	public Menu() {
		
	}
	
	public Menu(String id, String name, Menu ... child) {
		this.id=id;
		this.name=name;
		this.menu=child==null? null : Arrays.asList(child);
	}

	public String getId() {
		return id;
	}

	@XmlAttribute
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	@XmlAttribute
	public void setName(String name) {
		this.name = name;
	}

	public List<Menu> getMenu() {
		return menu;
	}

	@XmlElement
	public void setMenu(List<Menu> menu) {
		this.menu = menu;
	}
	
	@Override
	public String toString() {
		return "{"+id+","+name+(menu==null? "":","+menu.toString())+"}";
	}

}
