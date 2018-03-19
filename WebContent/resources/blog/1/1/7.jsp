<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<h3>第七章	  Optional 类</h3>
<p>
Optional是用于包含非空对象的容器对象。Optional对象用于表示缺少值的空值。 这个类有各种实用方法来帮助代码将值处理为'可用'或'不可用'，而不是检查空值。 它在Java 8中被引入，类似于Guava中的Optional。
</p>

<h5>类声明</h5>
<p>
<code>
public final class Optional<T> extends Object
</code>
</p>

<h5>类的方法</h5>
<strong>static &lt;T> Optional&lt;T> empty()</strong>
<p>Returns an empty Optional instance.</p>

<strong>boolean equals(Object obj)</strong>
<p>Indicates whether some other object is "equal to" this Optional.</p>

<strong>Optional&lt;T&gt; filter(Predicate&lt;? super &lt;T&gt; predicate)</strong>
<p>If a value is present and the value matches a given predicate, it returns an Optional describing the value, otherwise returns an empty Optional.</p>

<strong>&lt;U&gt; Optional&lt;U&gt; flatMap(Function&lt;? super T,Optional&lt;U&gt;&gt; mapper)</strong>
<p>If a value is present, it applies the provided Optional-bearing mapping function to it, returns that result, otherwise returns an empty Optional.</p>

<strong>T get()</strong>
<p>If a value is present in this Optional, returns the value, otherwise throws NoSuchElementException.</p>

<strong>int hashCode()</strong>
<p>Returns the hash code value of the present value, if any, or 0 (zero) if no value is present.</p>

<strong>void ifPresent(Consumer&lt;? super T&gt; consumer)</strong>
<p>If a value is present, it invokes the specified consumer with the value, otherwise does nothing.</p>

<strong>boolean isPresent()</strong>
<p>Returns true if there is a value present, otherwise false.

<strong>&lt;U&gt;Optional&lt;U&gt; map(Function&lt;? super T,? extends U&gt; mapper)</strong>
<p>If a value is present, applies the provided mapping function to it, and if the result is non-null, returns an Optional describing the result.</p>

<strong>static &lt;T&gt; Optional&lt;T&gt; of(T value)</strong>
<p>Returns an Optional with the specified present non-null value.</p>

<strong>static &lt;T&gt; Optional&lt;T&gt; ofNullable(T value)</strong>
<p>Returns an Optional describing the specified value, if non-null, otherwise returns an empty Optional.</p>

<strong>T orElse(T other)</strong>
<p>Returns the value if present, otherwise returns other.</p>

<strong>T orElseGet(Supplier&lt;? extends T&gt; other)</strong>
<p>Returns the value if present, otherwise invokes other and returns the result of that invocation.</p>

<strong>&lt;X extends Throwable&gt; T orElseThrow(Supplier&lt;? extends X&gt; exceptionSupplier)</strong>
<p>Returns the contained value, if present, otherwise throws an exception to be created by the provided supplier.</p>

<strong>String toString()</strong>
<p>Returns a non-empty string representation of this Optional suitable for debugging.</p>



<h5>例子</h5>
<pre>
import java.util.Optional;

public class Java8Tester {

   public static void main(String args[]) {
      Java8Tester java8Tester = new Java8Tester();
      Integer value1 = null;
      Integer value2 = new Integer(10);
		
      //Optional.ofNullable - allows passed parameter to be null.
      Optional<Integer> a = Optional.ofNullable(value1);
		
      //Optional.of - throws NullPointerException if passed parameter is null
      Optional<Integer> b = Optional.of(value2);
      System.out.println(java8Tester.sum(a,b));
   }
	
   public Integer sum(Optional<Integer> a, Optional<Integer> b) {
      //Optional.isPresent - checks the value is present or not
		
      System.out.println("First parameter is present: " + a.isPresent());
      System.out.println("Second parameter is present: " + b.isPresent());
		
      //Optional.orElse - returns the value if present otherwise returns
      //the default value passed.
      Integer value1 = a.orElse(new Integer(0));
		
      //Optional.get - gets the value, value should be present
      Integer value2 = b.get();
      return value1 + value2;
   }
}
</pre>

<h5>运行结果</h5>
<pre>
First parameter is present: false
Second parameter is present: true
10
</pre>