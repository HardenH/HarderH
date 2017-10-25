package com.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Girls;
import com.entity.Preson;

public class Test {
public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		Girls p = (Girls) context.getBean("GG");
		//u.setName("小白");
		System.out.println(p);

}
}
