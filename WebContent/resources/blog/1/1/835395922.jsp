<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<p>
Java 8在接口中引入了默认方法实现的新概念。 为了向后兼容，添加了此功能，以便可以使用旧接口来利用Java 8的lambda表达式功能。
</p>
<p>
例如，'List'或'Collection'接口没有'forEach'方法声明。 因此，添加这样的方法只会破坏集合框架的实现。 Java 8引入了默认方法，以便List / Collection接口可以具有forEach方法的默认实现，并且实现这些接口的类不需要实现相同的方法。
</p>


<h5>语法</h5>
<pre>
public interface vehicle {

   default void print() {
      System.out.println("I am a vehicle!");
   }
}
</pre>


<h5>多默认方法</h5>
<p>通过接口中的默认功能，类有可能实现具有相同默认方法的两个接口。 以下代码解释了如何解决这种歧义。</p>
<pre>
public interface vehicle {

   default void print() {
      System.out.println("I am a vehicle!");
   }
}

public interface fourWheeler {

   default void print() {
      System.out.println("I am a four wheeler!");
   }
}
</pre>

<p>第一种解决方案是创建一个覆盖默认实现的自己的方法。</p>
<pre>
public class car implements vehicle, fourWheeler {

   default void print() {
      System.out.println("I am a four wheeler car vehicle!");
   }
}
</pre>

<p>第二种解决方案是使用super调用指定接口的默认方法。</p>
<pre>
public class car implements vehicle, fourWheeler {

   default void print() {
      vehicle.super.print();
   }
}
</pre>


<h5>静态默认方法</h5>
<p>Java 8及以后的版本,接口也可以有静态辅助方法。</p>
<pre>
public interface vehicle {

   default void print() {
      System.out.println("I am a vehicle!");
   }
	
   static void blowHorn() {
      System.out.println("Blowing horn!!!");
   }
}
</pre>



<h5>例子</h5>
<pre>
public class Java8Tester {

   public static void main(String args[]) {
      Vehicle vehicle = new Car();
      vehicle.print();
   }
}

interface Vehicle {

   default void print() {
      System.out.println("I am a vehicle!");
   }
	
   static void blowHorn() {
      System.out.println("Blowing horn!!!");
   }
}

interface FourWheeler {

   default void print() {
      System.out.println("I am a four wheeler!");
   }
}

class Car implements Vehicle, FourWheeler {

   public void print() {
      Vehicle.super.print();
      FourWheeler.super.print();
      Vehicle.blowHorn();
      System.out.println("I am a car!");
   }
}
</pre>

<h5>运行结果</h5>
<pre>
I am a vehicle!
I am a four wheeler!
Blowing horn!!!
I am a car!
</pre>