import java.lang.reflect.Proxy;

public class TestDynamicproxy {
public static void main(String[] args) {
	Girls gg = new Girls("小花");
	//创建一个boy对象
	Boy boy = new Boy("小明",gg);
	Dynamicproxy dp = new Dynamicproxy(boy);
   Isendthings igs =  (Isendthings) Proxy.newProxyInstance(dp.getClass().getClassLoader(), boy.getClass().getInterfaces(), dp);
igs.sendflower();
igs.sendmoney();
}
}
