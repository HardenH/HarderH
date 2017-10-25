
public class Testsend {
public static void main(String[] args) {
	Girls gg = new Girls("小花");
	//创建一个boy对象
	Boy boy = new Boy("小明",gg);
	Surperman sp = new Surperman(boy);
	sp.sendflower();
	sp.sendmoney();
	sp.sendself();
	
}
}
