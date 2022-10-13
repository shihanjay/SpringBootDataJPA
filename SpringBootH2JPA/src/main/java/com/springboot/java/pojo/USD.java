package com.springboot.java.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "USD")
public class USD {

@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private int id;
private String code;
private String symbol;
private String rate;
private String description;
private String rate_float;





public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public String getSymbol() {
	return symbol;
}
public void setSymbol(String symbol) {
	this.symbol = symbol;
}
public String getRate() {
	return rate;
}
public void setRate(String rate) {
	this.rate = rate;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}

public String getRate_float() {
	return rate_float;
}
public void setRate_float(String rate_float) {
	this.rate_float = rate_float;
}



}
