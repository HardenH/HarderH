package com.testdao;

/*public class random {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 java.util.Random r=new java.util.Random(); 
		 System.out.println(r.nextInt());
		 for(int i=0;i<8;i++){ 
		     System.out.println(r.nextInt()); 
	}
	}
}*/
public class random
{
    public static int rand(int n)
    {
        int ans = 0;
        while(Math.log10(ans)+1<n)
            ans = (int)(Math.random()*Math.pow(10, n));
        return ans;
    }
    public static void main(String[] args)
    {
        for(int i=0;i<1;i++)
        {
            System.out.println(rand(8));
        }
    }
}