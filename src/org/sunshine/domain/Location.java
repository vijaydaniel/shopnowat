package org.sunshine.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="locations")
public class Location
  implements Serializable
{
  private int id;
  private String name;

  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  @Column(name="id")
  public int getId()
  {
    return this.id;
  }

  public void setId(int id) {
    this.id = id;
  }

  @Column(name="name")
  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }
  
  @Override
	public String toString() {
		return "id:"+id+"\tname:"+name;
	}
}