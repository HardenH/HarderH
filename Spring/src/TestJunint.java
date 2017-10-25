import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Girls;

public class TestJunint {
	public void method() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
	Girls gg = (Girls) context.getBean("GG");
		gg.toString();
	}
}
