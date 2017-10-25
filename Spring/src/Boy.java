
public class Boy implements Isendthings{
private String name;
private Girls gg;
public Girls getGg() {
	return gg;
}

public void setGg(Girls gg) {
	this.gg = gg;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}
public Boy(String name, Girls gg) {
	super();
	this.name = name;
	this.gg = gg;
}

public void sendflower() {
	System.out.println(name+"给"+gg.getName()+"送了花");
}
public void sendmoney() {
	System.out.println(name+"给"+gg.getName()+"送了￥2220");
}
public void sendself() {
	System.out.println(name+"给"+gg.getName()+"打包了他自己");
}
}
