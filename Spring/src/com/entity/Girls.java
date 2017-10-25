package com.entity;

import java.util.List;

public class Girls {
private String name;
private Preson p;
private List<Preson> bb;


public List<Preson> getBb() {
	return bb;
}


public void setBb(List<Preson> bb) {
	this.bb = bb;
}


public String getName() {
	return name;
}


public void setName(String name) {
	this.name = name;
}


public Preson getP() {
	return p;
}


public void setP(Preson p) {
	this.p = p;
}


@Override
public String toString() {
	return  name + "和 " + p + "在打代码";
}
}
