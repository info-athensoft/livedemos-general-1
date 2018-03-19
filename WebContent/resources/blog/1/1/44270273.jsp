<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<p>
Lambda表达式在Java 8中引入，并被奉为Java 8的最大特性。Lambda表达式有助于函数式编程，并大大简化了开发。<br/>
</p>

<h5>语法</h5>
<p>lambda表达式有以下语法特征：</p>
<code>parameter -> expression body</code>
<ul>
  <li>类型声明可选 - 不需要声明参数的类型。 编译器可以从参数的值推断相同的类型。</li>
  <li>参数周围的圆括号可选 - 无需在括号中声明单个参数。 对于多个参数，需要括号。</li>
  <li>花括号可选 - 如果函数体包含单个语句，则不需要在函数体中使用花括号。</li>
  <li>返回关键字可选 - 若函数体为要返回单个表达式值则编译器自动返回该值。若要指明表达式返回一个值，则需要大括号。</li>
</ul>


<h5>例子</h5>
<pre>
public class Java8Tester {

   public static void main(String args[]) {
      Java8Tester tester = new Java8Tester();
		
      //with type declaration
      MathOperation addition = (int a, int b) -> a + b;
		
      //with out type declaration
      MathOperation subtraction = (a, b) -> a - b;
		
      //with return statement along with curly braces
      MathOperation multiplication = (int a, int b) -> { return a * b; };
		
      //without return statement and without curly braces
      MathOperation division = (int a, int b) -> a / b;
		
      System.out.println("10 + 5 = " + tester.operate(10, 5, addition));
      System.out.println("10 - 5 = " + tester.operate(10, 5, subtraction));
      System.out.println("10 x 5 = " + tester.operate(10, 5, multiplication));
      System.out.println("10 / 5 = " + tester.operate(10, 5, division));
		
      //without parenthesis
      GreetingService greetService1 = message ->
      System.out.println("Hello " + message);
		
      //with parenthesis
      GreetingService greetService2 = (message) ->
      System.out.println("Hello " + message);
		
      greetService1.sayMessage("Mahesh");
      greetService2.sayMessage("Suresh");
   }
	
   interface MathOperation {
      int operation(int a, int b);
   }
	
   interface GreetingService {
      void sayMessage(String message);
   }
	
   private int operate(int a, int b, MathOperation mathOperation) {
      return mathOperation.operation(a, b);
   }
}
</pre>

<h5>运行结果</h5>
<pre>
10 + 5 = 15
10 - 5 = 5
10 x 5 = 50
10 / 5 = 2
Hello Mahesh
Hello Suresh
</pre>

<h5>要点</h5>
<p>lambda表达式有以下语法特征：</p>
<ul>
  <li>Lambda表达式主要用于定义函数接口的内联实现，即仅使用单一方法的接口。 在上面的例子中，我们使用了各种类型的lambda表达式来定义MathOperation接口的操作方法。 然后我们定义了GreetingService的sayMessage的实现。</li>
  <li>Lambda表达式消除了匿名类的需要，并为Java提供了一个非常简单但功能强大的函数式编程功能。</li>
</ul>

<h5>Scope</h5>
<p>使用lambda表达式，您可以引用任何最终变量(final variable)或有效最终变量（仅分配一次）。 如果第二次为这类变量赋值，则Lambda表达式会引发编译错误。</p>

<h5>例子</h5>
<pre>
public class Java8Tester {

   final static String salutation = "Hello! ";
   
   public static void main(String args[]) {
      GreetingService greetService1 = message -> 
      System.out.println(salutation + message);
      greetService1.sayMessage("Mahesh");
   }
	
   interface GreetingService {
      void sayMessage(String message);
   }
}
</pre>

<h5>运行结果</h5>
<pre>
Hello! Mahesh
</pre>