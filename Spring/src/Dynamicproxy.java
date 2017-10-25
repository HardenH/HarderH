import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;



public class Dynamicproxy implements InvocationHandler {
private Object object;
	public Object getObject() {
	return object;
}
public void setObject(Object object) {
	this.object = object;
}
	public Dynamicproxy(Object object) {
	super();
	this.object = object;
}
	@Override
		public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
			// TODO Auto-generated method stub
		System.out.println("DynamicProxy执行被代理的方法之前的代码");
		Object result = method.invoke(object, args);
		System.out.println("DynamicProxy执行被代理的方法之后的代码");
		return result;
		}

}
