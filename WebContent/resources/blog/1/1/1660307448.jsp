<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<p>
JAVA 8是 JAVA编程语言开发的一个主要功能版本。 它的最初版本于2014年3月18日发布。<br/>
随着Java 8的发布，Java为函数式编程， 新的JavaScript引擎，日期时间操纵的新API，新的流媒体API等提供了支持。<br/>
</p>

<h5>新功能</h5>
<ul>
  <li>Lambda表达式 - 为Java增加了函数处理能力。</li>
  <li>方法引用 - 通过名称引用函数，而不是直接调用它们。 使用函数作为参数。</li>
  <li>默认方法 - 具有默认方法实现的接口。</li>
  <li>新工具 - 添加新的编译器工具和实用程序，如'jdeps'以找出依赖关系。</li>
  <li>Stream API - 新的流API以方便流水线处理。</li>
  <li>日期时间API - 改进的日期时间API。</li>
  <li>可选 - 强调最佳实践以正确处理空值。</li>
  <li>Nashorn，JavaScript引擎 - 一种执行JavaScript代码的基于Java的引擎。</li>
</ul>


<h5>例子</h5>
<pre>
import java.util.Collections;
import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;

public class Java8Tester {

   public static void main(String args[]) {
   
      List&lt;String&gt; names1 = new ArrayList&ltString&gt;();
      names1.add("Mahesh ");
      names1.add("Suresh ");
      names1.add("Ramesh ");
      names1.add("Naresh ");
      names1.add("Kalpesh ");
		
      List&lt;String&gt; names2 = new ArrayList&lt;String&gt;();
      names2.add("Mahesh ");
      names2.add("Suresh ");
      names2.add("Ramesh ");
      names2.add("Naresh ");
      names2.add("Kalpesh ");
		
      Java8Tester tester = new Java8Tester();
      System.out.println("Sort using Java 7 syntax: ");
		
      tester.sortUsingJava7(names1);
      System.out.println(names1);
      System.out.println("Sort using Java 8 syntax: ");
		
      tester.sortUsingJava8(names2);
      System.out.println(names2);
   }
   
   //sort using java 7
   private void sortUsingJava7(List&lt;String&gt; names) {   
      Collections.sort(names, new Comparator&lt;String&gt;() {
         @Override
         public int compare(String s1, String s2) {
            return s1.compareTo(s2);
         }
      });
   }
   
   //sort using java 8
   private void sortUsingJava8(List&lt;String&gt; names) {
      Collections.sort(names, (s1, s2) -&gt; s1.compareTo(s2));
   }
}
</pre>
<h5>运行结果</h5>
<pre>
Sort using Java 7 syntax:
[ Kalpesh Mahesh Naresh Ramesh Suresh ]
Sort using Java 8 syntax:
[ Kalpesh Mahesh Naresh Ramesh Suresh ]
</pre>