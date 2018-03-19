<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<h3>第六章	  Streams流</h3>
<p>
Stream是Java 8中引入的一个新的抽象层。使用流，您可以使用类似于SQL语句的声明方式处理数据。 例如，请考虑以下SQL语句。
</p>
<code>
SELECT max(salary), employee_id, employee_name FROM Employee
</code>

<p>
上面的SQL表达式会自动返回最大薪水员工的详细信息，而不会对开发人员做任何计算。 在Java中使用集合框架，开发人员必须使用循环并进行重复检查。 另一个问题是效率; 由于多核处理器可以轻松实现，因此Java开发人员必须编写并行代码处理，这些处理可能非常容易出错。
<br/>
为了解决这些问题，Java 8引入了流的概念，使开发人员可以声明性地处理数据并利用多核架构，而无需为其编写任何特定的代码。
</p>


<div><strong>什么是Stream？</strong></div>
<p>
什么是Stream？
流代表来自源的一系列对象，它支持聚合操作。以下是Stream的特点 - 
</p>

<ul>
	<li><strong>元素序列 </strong> - 流以顺序方式提供一组特定类型的元素。流按需获取/计算元素。它从不存储元素。 </li>
	<li><strong>Source</strong> - Stream将Collections，Arrays或I / O资源作为输入源。</li>
	<li><strong>聚合操作</strong> - Stream支持聚合操作，如过滤器，映射，限制，减少，查找，匹配等。</li>
	<li><strong>Pipelining</strong> - 大多数流操作本身返回流，以便它们的结果可以流水线化。这些操作被称为中间操作，它们的功能是接受输入，处理它们并将输出返回给目标。 collect()方法是终端操作，通常在流水线操作结束时出现以标记流的结束。</li>
	<li><strong>自动迭代</strong> - 流操作通过所提供的源元素在内部执行迭代，与需要显式迭代的集合相反。</li>
</ul>

<h5>生成流</h5>
<p>使用Java 8,  Collection接口有两种方法来生成Stream。</p>
<ul>
  <li><strong>stream()</strong> - 返回考虑集合作为源的顺序流。 </li>
  <li><strong>parallelStream()</strong> - 返回并行流考虑集合作为其源。 </li>
</ul>

<pre>
List<String> strings = Arrays.asList("abc", "", "bc", "efg", "abcd","", "jkl");
List<String> filtered = strings.stream().filter(string -> !string.isEmpty()).collect(Collectors.toList());
</pre>

<div><strong>forEach</strong></div>
<p>
Stream已经提供了一个新的方法forEach来迭代流的每个元素。 以下代码段显示如何使用forEach打印10个随机数。
</p>
<pre>
Random random = new Random();
random.ints().limit(10).forEach(System.out::println);
</pre>


<div><strong>map</strong></div>
<p>
'map'方法用于将每个元素映射到其相应的结果。 以下代码段使用映射打印唯一的数字正方形。
</p>
<pre>
List<Integer> numbers = Arrays.asList(3, 2, 2, 3, 7, 3, 5);
//get list of unique squares
List<Integer> squaresList = numbers.stream().map( i -> i*i).distinct().collect(Collectors.toList());
</pre>


<div><strong>filter</strong></div>
<p>
“过滤器”方法用于根据标准消除元素。 以下代码段使用过滤器打印空字符串的计数。
</p>
<pre>
List<String>strings = Arrays.asList("abc", "", "bc", "efg", "abcd","", "jkl");
//get count of empty string
int count = strings.stream().filter(string -> string.isEmpty()).count();
</pre>


<div><strong>limit</strong></div>
<p>
“限制”方法用于减少流的大小。 以下代码段显示如何使用限制打印10个随机数。
</p>
<pre>
Random random = new Random();
random.ints().limit(10).forEach(System.out::println);
</pre>


<div><strong>sorted</strong></div>
<p>
'sorted'方法用于对流进行排序。 以下代码段显示如何以排序顺序打印10个随机数。
</p>
<pre>
Random random = new Random();
random.ints().limit(10).sorted().forEach(System.out::println);
</pre>


<div><strong>Parallel Processing</strong></div>
<p>
parallelStream是并行处理流的替代方案。 看看下面的代码段，它使用parallelStream输出空字符串的计数。<br/>
在顺序流和并行流之间切换非常容易。
</p>
<pre>
List<String> strings = Arrays.asList("abc", "", "bc", "efg", "abcd","", "jkl");

//get count of empty string
int count = strings.parallelStream().filter(string -> string.isEmpty()).count();
</pre>


<div><strong>Collectors</strong></div>
<p>
收集器用于组合流的元素的处理结果。 收集器可用于返回列表或字符串。
</p>
<pre>
List<String>strings = Arrays.asList("abc", "", "bc", "efg", "abcd","", "jkl");
List<String> filtered = strings.stream().filter(string -> !string.isEmpty()).collect(Collectors.toList());

System.out.println("Filtered List: " + filtered);
String mergedString = strings.stream().filter(string -> !string.isEmpty()).collect(Collectors.joining(", "));
System.out.println("Merged String: " + mergedString);
</pre>

<div><strong>Statistics</strong></div>
<p>
使用Java 8时，引入统计信息收集器来计算流处理完成时的所有统计信息。
</p>

<h5>例子</h5>
<p>
使用Java 8时，引入统计信息收集器来计算流处理完成时的所有统计信息。
</p>
<pre>
import java.util.ArrayList;
import java.util.Arrays;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.Map;

public class Java8Tester {

   public static void main(String args[]) {
      System.out.println("Using Java 7: ");
		
      // Count empty strings
      List<String> strings = Arrays.asList("abc", "", "bc", "efg", "abcd","", "jkl");
      System.out.println("List: " +strings);
      long count = getCountEmptyStringUsingJava7(strings);
		
      System.out.println("Empty Strings: " + count);
      count = getCountLength3UsingJava7(strings);
		
      System.out.println("Strings of length 3: " + count);
		
      //Eliminate empty string
      List<String> filtered = deleteEmptyStringsUsingJava7(strings);
      System.out.println("Filtered List: " + filtered);
		
      //Eliminate empty string and join using comma.
      String mergedString = getMergedStringUsingJava7(strings,", ");
      System.out.println("Merged String: " + mergedString);
      List<Integer> numbers = Arrays.asList(3, 2, 2, 3, 7, 3, 5);
		
      //get list of square of distinct numbers
      List<Integer> squaresList = getSquares(numbers);
      System.out.println("Squares List: " + squaresList);
      List<Integer> integers = Arrays.asList(1,2,13,4,15,6,17,8,19);
		
      System.out.println("List: " +integers);
      System.out.println("Highest number in List : " + getMax(integers));
      System.out.println("Lowest number in List : " + getMin(integers));
      System.out.println("Sum of all numbers : " + getSum(integers));
      System.out.println("Average of all numbers : " + getAverage(integers));
      System.out.println("Random Numbers: ");
		
      //print ten random numbers
      Random random = new Random();
		
      for(int i = 0; i < 10; i++) {
         System.out.println(random.nextInt());
      }
		
      System.out.println("Using Java 8: ");
      System.out.println("List: " +strings);
		
      count = strings.stream().filter(string->string.isEmpty()).count();
      System.out.println("Empty Strings: " + count);
		
      count = strings.stream().filter(string -> string.length() == 3).count();
      System.out.println("Strings of length 3: " + count);
		
      filtered = strings.stream().filter(string ->!string.isEmpty()).collect(Collectors.toList());
      System.out.println("Filtered List: " + filtered);
		
      mergedString = strings.stream().filter(string ->!string.isEmpty()).collect(Collectors.joining(", "));
      System.out.println("Merged String: " + mergedString);
		
      squaresList = numbers.stream().map( i ->i*i).distinct().collect(Collectors.toList());
      System.out.println("Squares List: " + squaresList);
      System.out.println("List: " +integers);
		
      IntSummaryStatistics stats = integers.stream().mapToInt((x) ->x).summaryStatistics();
		
      System.out.println("Highest number in List : " + stats.getMax());
      System.out.println("Lowest number in List : " + stats.getMin());
      System.out.println("Sum of all numbers : " + stats.getSum());
      System.out.println("Average of all numbers : " + stats.getAverage());
      System.out.println("Random Numbers: ");
		
      random.ints().limit(10).sorted().forEach(System.out::println);
		
      //parallel processing
      count = strings.parallelStream().filter(string -> string.isEmpty()).count();
      System.out.println("Empty Strings: " + count);
   }
	
   private static int getCountEmptyStringUsingJava7(List<String> strings) {
      int count = 0;

      for(String string: strings) {
		
         if(string.isEmpty()) {
            count++;
         }
      }
      return count;
   }
	
   private static int getCountLength3UsingJava7(List<String> strings) {
      int count = 0;
		
      for(String string: strings) {
		
         if(string.length() == 3) {
            count++;
         }
      }
      return count;
   }
	
   private static List<String> deleteEmptyStringsUsingJava7(List<String> strings) {
      List<String> filteredList = new ArrayList<String>();
		
      for(String string: strings) {
		
         if(!string.isEmpty()) {
             filteredList.add(string);
         }
      }
      return filteredList;
   }
	
   private static String getMergedStringUsingJava7(List<String> strings, String separator) {
      StringBuilder stringBuilder = new StringBuilder();
		
      for(String string: strings) {
		
         if(!string.isEmpty()) {
            stringBuilder.append(string);
            stringBuilder.append(separator);
         }
      }
      String mergedString = stringBuilder.toString();
      return mergedString.substring(0, mergedString.length()-2);
   }
	
   private static List<Integer> getSquares(List<Integer> numbers) {
      List<Integer> squaresList = new ArrayList<Integer>();
		
      for(Integer number: numbers) {
         Integer square = new Integer(number.intValue() * number.intValue());
			
         if(!squaresList.contains(square)) {
            squaresList.add(square);
         }
      }
      return squaresList;
   }
	
   private static int getMax(List<Integer> numbers) {
      int max = numbers.get(0);
		
      for(int i = 1;i < numbers.size();i++) {
		
         Integer number = numbers.get(i);
			
         if(number.intValue() > max) {
            max = number.intValue();
         }
      }
      return max;
   }
	
   private static int getMin(List<Integer> numbers) {
      int min = numbers.get(0);
		
      for(int i= 1;i < numbers.size();i++) {
         Integer number = numbers.get(i);
		
         if(number.intValue() < min) {
            min = number.intValue();
         }
      }
      return min;
   }
	
   private static int getSum(List numbers) {
      int sum = (int)(numbers.get(0));
		
      for(int i = 1;i < numbers.size();i++) {
         sum += (int)numbers.get(i);
      }
      return sum;
   }
	
   private static int getAverage(List<Integer> numbers) {
      return getSum(numbers) / numbers.size();
   }
}
</pre>

<h5>运行结果</h5>
<pre>
Using Java 7:
List: [abc, , bc, efg, abcd, , jkl]
Empty Strings: 2
Strings of length 3: 3
Filtered List: [abc, bc, efg, abcd, jkl]
Merged String: abc, bc, efg, abcd, jkl
Squares List: [9, 4, 49, 25]
List: [1, 2, 13, 4, 15, 6, 17, 8, 19]
Highest number in List : 19
Lowest number in List : 1
Sum of all numbers : 85
Average of all numbers : 9
Random Numbers:
-1279735475
903418352
-1133928044
-1571118911
628530462
18407523
-881538250
-718932165
270259229
421676854
Using Java 8:
List: [abc, , bc, efg, abcd, , jkl]
Empty Strings: 2
Strings of length 3: 3
Filtered List: [abc, bc, efg, abcd, jkl]
Merged String: abc, bc, efg, abcd, jkl
Squares List: [9, 4, 49, 25]
List: [1, 2, 13, 4, 15, 6, 17, 8, 19]
Highest number in List : 19
Lowest number in List : 1
Sum of all numbers : 85
Average of all numbers : 9.444444444444445
Random Numbers:
-1009474951
-551240647
-2484714
181614550
933444268
1227850416
1579250773
1627454872
1683033687
1798939493
Empty Strings: 2
</pre>