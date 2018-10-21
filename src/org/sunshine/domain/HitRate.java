package org.sunshine.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="hitrate")
public class HitRate implements Serializable {

	private static final long serialVersionUID = 1L;
	private int counter;
	private int id;
	private String type;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
    public int getId() {
        return id;
    }

    public void setId(int i) {
        this.id = i;
    }
    
    @Column(name="count")
    public int getCount() {
        return counter;
    }

    public void setCount(int i) {
        this.counter = i;
    }

    @Column(name="type")
    public String getType() {
        return type;
    }

    public void setType(String i) {
        this.type = i;
    }
    
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("count: " + counter + ";");
        return buffer.toString();
    }
}