package com.service;

import com.dao.Persondao;

public class Personservice {
private Persondao  persondao= new Persondao();

public Personservice(Persondao persondao) {
	super();
	this.persondao = persondao;
}

public Persondao getPersondao() {
	return persondao;
}

public void setPersondao(Persondao persondao) {
	this.persondao = persondao;
}


}
