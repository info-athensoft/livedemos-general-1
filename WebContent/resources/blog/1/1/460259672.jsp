<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<p>
方法引用有助于通过名称指向方法。 使用“::”符号描述方法引用。 方法引用可以用来指出以下类型的方法
</p>

<ul>
  <li> 静态方法   Static methods </li>
  <li> 实例方法   Instance methods</li>
  <li> 使用new操作符的构造方法  （例如：TreeSet::new）  Constructors using new operator</li>
</ul>

<h5>例子</h5>
<pre>
import java.util.List;
import java.util.ArrayList;

public class Java8Tester {

   public static void main(String args[]) {
      List names = new ArrayList();
		
      names.add("Mahesh");
      names.add("Suresh");
      names.add("Ramesh");
      names.add("Naresh");
      names.add("Kalpesh");
		
      names.forEach(System.out::println);
   }
}
</pre>

<h5>运行结果</h5>
<pre>
Mahesh
Suresh
Ramesh
Naresh
Kalpesh
</pre>