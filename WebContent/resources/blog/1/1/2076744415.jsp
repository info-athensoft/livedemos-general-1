<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<p>
功能接口具有可展示的单一功能。 例如，使用单个方法'compareTo'的Comparable接口用于比较目的。 Java 8已经定义了很多功能接口，以便在lambda表达式中广泛使用。 以下是java.util.Function包中定义的函数接口列表。<br/>
</p>

<h5>Java 8 定义的函数接口列表</h5>
<pre>
BiConsumer <T，U>
表示接受两个输入参数的操作，并且不返回结果。


双功能<T，U，R>
表示接受两个参数并产生结果的函数。


BinaryOperator <T>
表示对相同类型的两个操作数的操作，产生与操作数相同类型的结果。


BiPredicate <T，U>
表示两个参数的谓词（布尔值函数）。

BooleanSupplier

表示布尔值结果的提供者。

Supplier<T>
表示接受单个输入参数且不返回结果的操作。

DoubleBinaryOperator
表示对两个双值操作数进行操作并生成一个双值结果。

DoubleConsumer
表示接受单个双值参数且不返回结果的操作。

DoubleFunction <R>
表示接受双值参数并产生结果的函数。

DoublePredicate
表示一个双值参数的谓词（布尔值函数）。

DoubleSupplier
代表双值结果的供应商。

DoubleToIntFunction
表示接受双值参数并生成int值结果的函数。

DoubleToLongFunction
表示接受双值参数并生成长值结果的函数。

DoubleUnaryOperator
表示对单个双值操作数生成双值结果的操作。

Function<T，R>
表示接受一个参数并产生结果的函数。

IntBinaryOperator
表示对两个int值操作数的操作并生成一个int值的结果。

IntConsumer
表示接受单个int值参数且不返回结果的操作。

IntFunction <R>
表示接受int值参数并产生结果的函数。

IntPredicate
表示一个int值参数的谓词（布尔值函数）。

IntSupplier
代表一个int值结果的提供者。

IntToDoubleFunction
表示接受int值的参数并生成双值结果的函数。

IntToLongFunction
表示一个函数，它接受一个int值参数并生成一个长整型结果。

IntUnaryOperator
表示对单个int值操作数生成int值结果的操作。

LongBinaryOperator
表示对两个长值操作数的操作并生成一个长整型结果。

LongConsumer
表示接受单个长值参数且不返回结果的操作。

LongFunction <R>
表示接受长值参数并产生结果的函数。

LongPredicate
表示一个长值参数的谓词（布尔值函数）。

LongSupplier
代表长期结果的供应商。

LongToDoubleFunction
表示接受长整型参数并生成双值结果的函数。

LongToIntFunction
表示接受长整型参数并生成int值结果的函数。

LongUnaryOperator
表示对单个长值操作数生成一个长结果的操作。

ObjDoubleConsumer <T>
表示接受对象值和双值参数的操作，并且不返回结果。

ObjIntConsumer <T>
表示接受对象值和int值参数的操作，并且不返回结果。

ObjLongConsumer <T>
表示接受对象值和长值参数并且不返回结果的操作。

Predicate<T>
表示一个参数的谓词（布尔值函数）。

Supplier<T>
代表结果供应商。

ToDoubleBiFunction <T，U>
表示一个接受两个参数并产生一个双值结果的函数。

ToDoubleFunction <T>
表示产生双值结果的函数。

ToIntBiFunction <T，U>
表示接受两个参数并生成int值结果的函数。

ToIntFunction <T>
表示一个产生int值结果的函数。

ToLongBiFunction <T，U>
表示一个接受两个参数并产生一个长整型结果的函数。

ToLongFunction <T>
表示一个产生长期结果的函数。

UnaryOperator <T>
表示对单个操作数的操作，该操作数生成与其操作数相同类型的结果。
</pre>


<h5>例子</h5>
<p>
以Functional 接口为例.
这里我们已经通过了Predicate接口，它接受一个输入并返回布尔值。
</p>
<pre>
import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

public class Java8Tester {

   public static void main(String args[]) {
      List<Integer> list = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9);
		
      // Predicate<Integer> predicate = n -> true
      // n is passed as parameter to test method of Predicate interface
      // test method will always return true no matter what value n has.
		
      System.out.println("Print all numbers:");
		
      //pass n as parameter
      eval(list, n->true);
		
      // Predicate<Integer> predicate1 = n -> n%2 == 0
      // n is passed as parameter to test method of Predicate interface
      // test method will return true if n%2 comes to be zero
		
      System.out.println("Print even numbers:");
      eval(list, n-> n%2 == 0 );
		
      // Predicate<Integer> predicate2 = n -> n > 3
      // n is passed as parameter to test method of Predicate interface
      // test method will return true if n is greater than 3.
		
      System.out.println("Print numbers greater than 3:");
      eval(list, n-> n > 3 );
   }
	
   public static void eval(List<Integer> list, Predicate<Integer> predicate) {

      for(Integer n: list) {

         if(predicate.test(n)) {
            System.out.println(n + " ");
         }
      }
   }
}
</pre>

<h5>运行结果</h5>
<pre>
Print all numbers:
1
2
3
4
5
6
7
8
9
Print even numbers:
2
4
6
8
Print numbers greater than 3:
4
5
6
7
8
9
</pre>