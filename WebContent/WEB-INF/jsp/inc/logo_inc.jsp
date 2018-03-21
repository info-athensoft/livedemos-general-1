<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- global variables settings -->
<c:set var="webapp_name" value=""/>
<!-- END global variables settings -->

<!-- i18n -->
<c:set var="loc" value="en_US"/>
<c:if test="${!(empty param.lang)}">
  <c:set var="loc" value="${param.lang}"/>
</c:if>
<fmt:setLocale value="${loc}" />
<!-- END i18n -->

<div class="header-row">
	<div class="header-logo">
		<a href="/index.html?lang=${loc}">
			<!-- 
			<img alt="Athensoft" 
			     width="64" height="64" 
			     data-sticky-width="40" 
			     data-sticky-height="40" 
			     data-sticky-top="33"
				src="${webapp_name}/images/logo/logo.gif">
			 -->	
			<img alt="Athensoft" 
			     height="64" 
			     data-sticky-height="40" 
			     data-sticky-top="36"
				src="${webapp_name}/images/logo/logo_text.png">
		</a>
	</div>
</div>