import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.service.Userservice;

public class TestAOP {
BeanFactory context = null;
	@org.aspectj.lang.annotation.Before
public void before() {
	context = new ClassPathXmlApplicationContext("aopContext.xml");
}
	@Test
	public void method() {
		Userservice us = (Userservice) context.getBean("us");
		us.add();
	}
}
