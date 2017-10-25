package com.entity;

public class Aoplog {
public void before() {
	System.out.println("AopLog start"+System.currentTimeMillis());
}
public void after() {
	System.out.println("AopLog end"+System.currentTimeMillis());
}
}
