<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<h3>第九章	  新 日期/时间 API</h3>

<p>在Java 8中，引入了新的日期时间API以涵盖旧的日期时间API的以下缺点。</p>

<ul>
<li><strong>不是线程安全的 </strong>- java.util.Date不是线程安全的，因此开发人员在使用日期时必须处理并发问题。 新的日期时间API是不可变的，并且没有setter方法。</li>

<li><strong>糟糕的设计</strong> - 默认日期从1900开始，月份从1开始，而日从0开始，因此没有统一性。 旧的API对日期操作的直接方法较少。 新的API为这些操作提供了许多实用方法。</li>

<li><strong>困难的时区处理</strong> - 开发人员必须编写大量代码来处理时区问题。 新的API已经开发出来，保持了特定领域的设计。</li>
</ul>

Java 8在java.time包下引入了一个新的日期时间API。 以下是java.time包中引入的一些重要类。
<ul>
<li><strong>Local</strong> - 简化的日期时间API，不需要复杂的时区处理。</li>
<li><strong>Zoned</strong> - 专门的日期时间API来处理各种时区。</li>
</ul>

<div><strong>Local Date-Time API</strong></div>
<p>LocalDate / LocalTime和LocalDateTime类简化了不需要时区的开发。</p>
<pre>
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.LocalDateTime;
import java.time.Month;

public class Java8Tester {

   public static void main(String args[]) {
      Java8Tester java8tester = new Java8Tester();
      java8tester.testLocalDateTime();
   }
	
   public void testLocalDateTime() {
      // Get the current date and time
      LocalDateTime currentTime = LocalDateTime.now();
      System.out.println("Current DateTime: " + currentTime);
		
      LocalDate date1 = currentTime.toLocalDate();
      System.out.println("date1: " + date1);
		
      Month month = currentTime.getMonth();
      int day = currentTime.getDayOfMonth();
      int seconds = currentTime.getSecond();
		
      System.out.println("Month: " + month +"day: " + day +"seconds: " + seconds);
		
      LocalDateTime date2 = currentTime.withDayOfMonth(10).withYear(2012);
      System.out.println("date2: " + date2);
		
      //12 december 2014
      LocalDate date3 = LocalDate.of(2014, Month.DECEMBER, 12);
      System.out.println("date3: " + date3);
		
      //22 hour 15 minutes
      LocalTime date4 = LocalTime.of(22, 15);
      System.out.println("date4: " + date4);
		
      //parse a string
      LocalTime date5 = LocalTime.parse("20:15:30");
      System.out.println("date5: " + date5);
   }
}
</pre>


<h5>运行结果</h5>
<pre>
Current DateTime: 2014-12-09T11:00:45.457
date1: 2014-12-09
Month: DECEMBERday: 9seconds: 45
date2: 2012-12-10T11:00:45.457
date3: 2014-12-12
date4: 22:15
date5: 20:15:30
</pre>

<div><strong>Zoned Date-Time API</strong></div>
<p>
Zoned日期时间API将在考虑时区时使用。
</p>
<pre>
import java.time.ZonedDateTime;
import java.time.ZoneId;

public class Java8Tester {

   public static void main(String args[]) {
      Java8Tester java8tester = new Java8Tester();
      java8tester.testZonedDateTime();
   }
	
   public void testZonedDateTime() {
      // Get the current date and time
      ZonedDateTime date1 = ZonedDateTime.parse("2007-12-03T10:15:30+05:30[Asia/Karachi]");
      System.out.println("date1: " + date1);
		
      ZoneId id = ZoneId.of("Europe/Paris");
      System.out.println("ZoneId: " + id);
		
      ZoneId currentZone = ZoneId.systemDefault();
      System.out.println("CurrentZone: " + currentZone);
   }
}
</pre>


<h5>运行结果</h5>
<pre>
date1: 2007-12-03T10:15:30+05:00[Asia/Karachi]
ZoneId: Europe/Paris
CurrentZone: Etc/UTC
</pre>


<div><strong>Chrono Units Enum</strong></div>
<p>
在Java 8中添加java.time.temporal.ChronoUnit枚举以替换旧API中使用的整数值来表示日，月等。
</p>
<pre>
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Java8Tester {

   public static void main(String args[]) {
      Java8Tester java8tester = new Java8Tester();
      java8tester.testChromoUnits();
   }
	
   public void testChromoUnits() {
      //Get the current date
      LocalDate today = LocalDate.now();
      System.out.println("Current date: " + today);
		
      //add 1 week to the current date
      LocalDate nextWeek = today.plus(1, ChronoUnit.WEEKS);
      System.out.println("Next week: " + nextWeek);
		
      //add 1 month to the current date
      LocalDate nextMonth = today.plus(1, ChronoUnit.MONTHS);
      System.out.println("Next month: " + nextMonth);
		
      //add 1 year to the current date
      LocalDate nextYear = today.plus(1, ChronoUnit.YEARS);
      System.out.println("Next year: " + nextYear);
		
      //add 10 years to the current date
      LocalDate nextDecade = today.plus(1, ChronoUnit.DECADES);
      System.out.println("Date after ten year: " + nextDecade);
   }
}
</pre>

<h5>运行结果</h5>
<pre>
Current date: 2014-12-10
Next week: 2014-12-17
Next month: 2015-01-10
Next year: 2015-12-10
Date after ten year: 2024-12-10
</pre>



<div><strong>Period and Duration</strong></div>
<p>
在Java 8中，引入了两个专门的类来处理时间差异。
<ul>
<li>Period - 它处理基于日期的时间量。</li>
<li>Duration - 它处理基于时间的时间量。</li>
</ul>
</p>
<pre>
import java.time.temporal.ChronoUnit;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Duration;
import java.time.Period;

public class Java8Tester {

   public static void main(String args[]) {
      Java8Tester java8tester = new Java8Tester();
      java8tester.testPeriod();
      java8tester.testDuration();
   }
	
   public void testPeriod() {
      //Get the current date
      LocalDate date1 = LocalDate.now();
      System.out.println("Current date: " + date1);
		
      //add 1 month to the current date
      LocalDate date2 = date1.plus(1, ChronoUnit.MONTHS);
      System.out.println("Next month: " + date2);
      
      Period period = Period.between(date2, date1);
      System.out.println("Period: " + period);
   }
	
   public void testDuration() {
      LocalTime time1 = LocalTime.now();
      Duration twoHours = Duration.ofHours(2);
		
      LocalTime time2 = time1.plus(twoHours);
      Duration duration = Duration.between(time1, time2);
		
      System.out.println("Duration: " + duration);
   }
}
</pre>


<h5>运行结果</h5>
<pre>
Current date: 2014-12-10
Next month: 2015-01-10
Period: P-1M
Duration: PT2H
</pre>


<div><strong>Temporal Adjusters</strong></div>
<p>
TemporalAdjuster用于执行日期计算。 例如，获取“本月的第二个星期六”或“下个星期二”。
</p>
<pre>
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.time.DayOfWeek;

public class Java8Tester {

   public static void main(String args[]) {
      Java8Tester java8tester = new Java8Tester();
      java8tester.testAdjusters();
   }
	
   public void testAdjusters() {
      //Get the current date
      LocalDate date1 = LocalDate.now();
      System.out.println("Current date: " + date1);
		
      //get the next tuesday
      LocalDate nextTuesday = date1.with(TemporalAdjusters.next(DayOfWeek.TUESDAY));
      System.out.println("Next Tuesday on : " + nextTuesday);
		
      //get the second saturday of next month
      LocalDate firstInYear = LocalDate.of(date1.getYear(),date1.getMonth(), 1);
      LocalDate secondSaturday = firstInYear.with(TemporalAdjusters.nextOrSame(
         DayOfWeek.SATURDAY)).with(TemporalAdjusters.next(DayOfWeek.SATURDAY));
      System.out.println("Second Saturday on : " + secondSaturday);
   }
}

</pre>

<h5>运行结果</h5>
<pre>
Current date: 2014-12-10
Next Tuesday on : 2014-12-16
Second Saturday on : 2014-12-13
</pre>


<div><strong>Backward Compatibility</strong></div>
<p>
将toInstant（）方法添加到原始的Date和Calendar对象中，这些对象可用于将它们转换为新的Date-Time API。 使用ofInstant（Insant，ZoneId）方法获取LocalDateTime或ZonedDateTime对象。
</p>
<pre>
import java.time.LocalDateTime;
import java.time.ZonedDateTime;

import java.util.Date;

import java.time.Instant;
import java.time.ZoneId;

public class Java8Tester {

   public static void main(String args[]) {
      Java8Tester java8tester = new Java8Tester();
      java8tester.testBackwardCompatability();
   }
	
   public void testBackwardCompatability() {
      //Get the current date
      Date currentDate = new Date();
      System.out.println("Current date: " + currentDate);
		
      //Get the instant of current date in terms of milliseconds
      Instant now = currentDate.toInstant();
      ZoneId currentZone = ZoneId.systemDefault();
		
      LocalDateTime localDateTime = LocalDateTime.ofInstant(now, currentZone);
      System.out.println("Local date: " + localDateTime);
		
      ZonedDateTime zonedDateTime = ZonedDateTime.ofInstant(now, currentZone);
      System.out.println("Zoned date: " + zonedDateTime);
   }
}
</pre>


<h5>运行结果</h5>
<pre>
Current date: Wed Dec 10 05:44:06 UTC 2014
Local date: 2014-12-10T05:44:06.635
Zoned date: 2014-12-10T05:44:06.635Z[Etc/UTC]
</pre>
