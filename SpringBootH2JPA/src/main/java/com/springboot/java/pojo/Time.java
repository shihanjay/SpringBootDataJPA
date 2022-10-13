package com.springboot.java.pojo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "TIME")
public class Time {

@Id
private String updated;
private String updatedISO;
private String updateduk;




public String getUpdated() {
	return updated;
}
public void setUpdated(String updated) {
	this.updated = updated;
}
public String getUpdatedISO() {
	return updatedISO;
}
public void setUpdatedISO(String updatedISO) {
	this.updatedISO = updatedISO;
}
public String getUpdateduk() {
	return updateduk;
}
public void setUpdateduk(String updateduk) {
	this.updateduk = updateduk;
}





}
