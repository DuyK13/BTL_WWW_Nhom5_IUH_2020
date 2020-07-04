package se.iuh.btl;

public class Test {

	public static void main(String[] args) {
		ClassLoader c1 = Test.class.getClassLoader();
		System.out.println(c1.getResource("se/iuh/btl/Test.class"));
	}
}
