
public class Surperman implements Isendthings {
private Boy boy;

public Boy getBoy() {
	return boy;
}

public void setBoy(Boy boy) {
	this.boy = boy;
}

public Surperman(Boy boy) {
	super();
	this.boy = boy;
}
public void sendflower() {
	System.out.println("调用之前完成的方法");
	boy.sendflower();
	System.out.println("调用完成后的方法");
}
public void sendmoney() {
	System.out.println("调用之前完成的方法");
	boy.sendmoney();
	System.out.println("调用完成后的方法");
}
public void sendself() {
	System.out.println("调用之前完成的方法");
	boy.sendself();
	System.out.println("调用完成后的方法");
}
}
