package com.qyy.hrma.domain;

import java.io.Serializable;

public class Dept implements Serializable {
  private Integer id;
  private String name;
  private String remarks;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRemarks() {
	return remarks;
}
public void setRemarks(String remarks) {
	this.remarks = remarks;
}
@Override
public String toString() {
	
    return "Dept [id=" + id + "name=" + name +"]" ;
}    
  
}
