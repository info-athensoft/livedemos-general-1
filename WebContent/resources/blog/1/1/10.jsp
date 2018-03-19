<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<h3>第十章	  Base64</h3>

<p>
在Java 8中，Base64终于得到了应有的效果。 Java 8现在具有用于Base64编码的内置编码器和解码器。 在Java 8中，我们可以使用三种类型的Base64编码。
</p>

<ul>
<li>
<strong>Simple</strong> - 输出映射到位于A-Za-z0-9 + /中的一组字符。 编码器不会在输出中添加换行符，并且解码器拒绝除A-Za-z0-9 + /以外的任何字符。
</li>
<li>
<strong>URL</strong> - 输出被映射到位于A-Za-z0-9 + _中的一组字符。 输出是URL和文件名安全。
</li>
<li>
<strong>MIME</strong> - 输出被映射为MIME友好格式。 输出以每行不超过76个字符的行表示，并使用回车'\ r'作为行分隔符，后接换行符'\ n'。 编码输出的末尾不存在行分隔符。
</li>
</ul>

<div><strong>嵌套类</strong></div>

<p>
<strong>static class Base64.Decoder</strong>
<br/>
This class implements a decoder for decoding byte data using the Base64 encoding scheme as specified in RFC 4648 and RFC 2045.

<br/><br/>

<strong>static class Base64.Encoder</strong>
<br/>
This class implements an encoder for encoding byte data using the Base64 encoding scheme as specified in RFC 4648 and RFC 2045.
</p>

<div><strong>方法</strong></div>
<p>
<strong>static Base64.Decoder getDecoder()</strong>
<br/>
Returns a Base64.Decoder that decodes using the Basic type base64 encoding scheme. <br/><br/>

<strong>static Base64.Encoder getEncoder()</strong>
<br/>
Returns a Base64.Encoder that encodes using the Basic type base64 encoding scheme. <br/><br/>


<strong>static Base64.Decoder getMimeDecoder()</strong>
<br/>
Returns a Base64.Decoder that decodes using the MIME type base64 decoding scheme. <br/><br/>

<strong>static Base64.Encoder getMimeEncoder()</strong>
<br/>
Returns a Base64.Encoder that encodes using the MIME type base64 encoding scheme. <br/><br/>


<strong>static Base64.Encoder getMimeEncoder(int lineLength, byte[] lineSeparator) </strong>
<br/>
Returns a Base64.Encoder that encodes using the MIME type base64 encoding scheme with specified line length and line separators. <br/><br/>

<strong>static Base64.Decoder getUrlDecoder()</strong>
<br/>
Returns a Base64.Decoder that decodes using the URL and Filename safe type base64 encoding scheme. <br/><br/>
<strong>static Base64.Encoder getUrlEncoder()</strong>
<br/>
Returns a Base64.Encoder that encodes using the URL and Filename safe type base64 encoding scheme.
</p>


<h5>例子</h5>
<pre>
import java.util.Base64;
import java.util.UUID;
import java.io.UnsupportedEncodingException;

public class HelloWorld {

   public static void main(String args[]) {

      try {
		
         // Encode using basic encoder
         String base64encodedString = Base64.getEncoder().encodeToString(
            "TutorialsPoint?java8".getBytes("utf-8"));
         System.out.println("Base64 Encoded String (Basic) :" + base64encodedString);
		
         // Decode
         byte[] base64decodedBytes = Base64.getDecoder().decode(base64encodedString);
		
         System.out.println("Original String: " + new String(base64decodedBytes, "utf-8"));
         base64encodedString = Base64.getUrlEncoder().encodeToString(
            "TutorialsPoint?java8".getBytes("utf-8"));
         System.out.println("Base64 Encoded String (URL) :" + base64encodedString);
		
         StringBuilder stringBuilder = new StringBuilder();
		
         for (int i = 0; i < 10; ++i) {
            stringBuilder.append(UUID.randomUUID().toString());
         }
		
         byte[] mimeBytes = stringBuilder.toString().getBytes("utf-8");
         String mimeEncodedString = Base64.getMimeEncoder().encodeToString(mimeBytes);
         System.out.println("Base64 Encoded String (MIME) :" + mimeEncodedString);

      } catch(UnsupportedEncodingException e) {
         System.out.println("Error :" + e.getMessage());
      }
   }
}

</pre>

<h5>运行结果</h5>
<pre>
Base64 Encoded String (Basic) :VHV0b3JpYWxzUG9pbnQ/amF2YTg=
Original String: TutorialsPoint?java8
Base64 Encoded String (URL) :VHV0b3JpYWxzUG9pbnQ_amF2YTg=
Base64 Encoded String (MIME) :YmU3NWY2ODktNGM5YS00ODlmLWI2MTUtZTVkOTk2YzQ1Njk1Y2EwZTg2OTEtMmRiZC00YTQ1LWJl
NTctMTI1MWUwMTk0ZWQyNDE0NDAwYjgtYTYxOS00NDY5LTllYTctNjc1YzE3YWJhZTk1MTQ2MDQz
NDItOTAyOC00ZWI0LThlOTYtZWU5YzcwNWQyYzVhMTQxMWRjYTMtY2MwNi00MzU0LTg0MTgtNGQ1
MDkwYjdiMzg2ZTY0OWU5MmUtZmNkYS00YWEwLTg0MjQtYThiOTQxNDQ2YzhhNTVhYWExZjItNjU2
Mi00YmM4LTk2ZGYtMDE4YmY5ZDZhMjkwMzM3MWUzNDMtMmQ3MS00MDczLWI0Y2UtMTQxODE0MGU5
YjdmYTVlODUxYzItN2NmOS00N2UyLWIyODQtMThlMWVkYTY4M2Q1YjE3YTMyYmItZjllMS00MTFk
LWJiM2UtM2JhYzUxYzI5OWI4
</pre>

