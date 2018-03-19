<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<h3>第八章	  Nashorn JavaScript</h3>
<p>
在Java 8中，Nashorn引入了一个大大改进的JavaScript引擎，用于替换现有的Rhino。 Nashorn提供的性能提高2到10倍，因为它直接编译内存中的代码并将字节码传递给JVM。 Nashorn使用Java 7中引入的invoke动态特性来提高性能。
</p>

<div><strong>jjs</strong></div>
<p>
对于Nashorn引擎，JAVA 8引入了一个新的命令行工具jjs，以在控制台执行javascript代码。
</p>

<div><strong>解释 js 文件</strong></div>
<strong>sample.js</strong>
<br/>
<code>
print('Hello World!');
</code>
<p>
输入命令行命令<br/>
<code>
C:\JAVA>jjs sample.js
</code>
</p>

<h5>输出结果</h5>
<pre>
C:\JAVA>jjs
jjs> print("Hello, World!")
Hello, World!
jjs> quit()
>>
</pre>

<h5>传递参数</h5>
<p>输入命令行命令</p>
<pre>
C:\JAVA> jjs -- a b c
jjs> print('letters: ' +arguments.join(", "))
letters: a, b, c
jjs>
</pre>


<div><strong>从Java调用JavaScript</strong></div>
<p>使用ScriptEngineManager，JavaScript代码可以在Java中调用和解释。</p>

<h5>例子</h5>
<pre>
import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;
import javax.script.ScriptException;

public class Java8Tester {

   public static void main(String args[]) {
      ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
      ScriptEngine nashorn = scriptEngineManager.getEngineByName("nashorn");
		
      String name = "Mahesh";
      Integer result = null;
      
      try {
         nashorn.eval("print('" + name + "')");
         result = (Integer) nashorn.eval("10 + 2");
         
      } catch(ScriptException e) {
         System.out.println("Error executing script: "+ e.getMessage());
      }
      System.out.println(result.toString());
   }
}
</pre>


<h5>运行结果</h5>
<pre>
Mahesh
12
</pre>


<div><strong>从JavaScript调用Java</strong></div>
<p>以下示例说明如何在javascript中导入和使用Java类。</p>
<strong>sample.js</strong>
<pre>
var BigDecimal = Java.type('java.math.BigDecimal');

function calculate(amount, percentage) {

   var result = new BigDecimal(amount).multiply(new BigDecimal(percentage)).divide(
      new BigDecimal("100"), 2, BigDecimal.ROUND_HALF_EVEN);
   
   return result.toPlainString();
}
var result = calculate(568000000000000000023,13.9);
print(result);
</pre>

<h5>输入命令行命令</h5>
<p>
<code>
C:\JAVA>jjs sample.js
</code>
</p>

<h5>运行结果</h5>
<p>
<code>
78952000000000000003.20
</code>
</p>
