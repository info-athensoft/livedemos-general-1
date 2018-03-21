<%@ page contentType="text/html; charset=utf-8"%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- page variables  -->
<c:set var="img_dir" value="/images"></c:set>
<!-- END page variables -->

<!-- i18n -->
<c:set var="loc" value="en_US"/>
<c:if test="${!(empty param.lang)}">
  <c:set var="loc" value="${param.lang}"/>
</c:if>
<fmt:setLocale value="${loc}" />
<!-- END i18n -->

<footer id="footer">
	<div class="container">
		<div class="row">
			<div class="footer-ribbon">
				<span>Get in Touch</span>
			</div>
			<div class="col-lg-3">
				<div class="">
					<h4><spring:message code="footer-title-resource"/></h4>
					<label><a href="${webapp_name}/rsc/siteindexes.html?lang=${loc}"><spring:message code="rsc-siteindex"/></a></label><br/>
					<label><a href="#"><spring:message code="rsc-download"/></a></label><br/>
					<label><a href="#"><spring:message code="rsc-developer"/></a></label><br/>
					<label><a href="#"><spring:message code="rsc-designer"/></a></label><br/>
					<label><a href="#"><spring:message code="rsc-entrepreneur"/></a></label><br/>
					<label><a href="#"><spring:message code="rsc-marketer"/></a></label><br/>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="newsletter">
					<h4><spring:message code="footer-title-followus"/></h4>
					<ul class="social-icons">
						<li class="social-icons-facebook"><a href="http://www.facebook.com/info.athensoft" target="_blank" title="Facebook"><i class="fa fa-facebook"></i></a></li>
						<li class="social-icons-twitter"><a href="http://www.twitter.com/Athensoft" target="_blank" title="Twitter"><i class="fa fa-twitter"></i></a></li>
						<li class="social-icons-linkedin"><a href="http://www.linkedin.com/" target="_blank" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
					</ul>
					<hr class="invisible mt-2 mb-2"/>
					<h4><spring:message code="footer-title-newsletter"/></h4>
					<p><spring:message code="footer-title-newsletter-content"/></p>

					<div class="alert alert-success d-none" id="newsletterSuccess">
						<strong>Success!</strong> You've been added to our email list.
					</div>

					<div class="alert alert-danger d-none" id="newsletterError"></div>

					<form id="subscribeForm" name="subscribeForm" method="POST">
						<div class="input-group">
							<input class="form-control form-control-sm" placeholder="Email Address" name="newsLetterEmail" id="newsLetterEmail" type="text">
							<span class="input-group-btn">
								<button class="btn btn-light" onclick="doSubscribe(); return false;">Go!</button>
							</span>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-3">
				<h4><spring:message code="footer-title-tweets"/></h4>
				<div id="tweet" class="twitter" data-plugin-tweets data-plugin-options="{'username': '', 'count': 2}">
					<!-- <p>Please wait...</p> -->
					<a class="twitter-timeline" 
						data-width="220" 
						data-height="220" 
						data-theme="dark" 
						data-chrome="nofooter noborders transparent noheader noscrollbar"
						href="https://twitter.com/Athensoft?ref_src=twsrc%5Etfw">Tweets by Athensoft</a> 
						<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
				</div>
			</div>
			<div class="col-lg-3">
				
				<div class="contact-details">
					<h4><spring:message code="footer-title-contactus"/></h4>
					<ul class="contact">
						<li><p><i class="fa fa-map-marker"></i> <strong><spring:message code="contact-address-name"/>:</strong> <spring:message code="contact-address"/></p></li>
						<li><p><i class="fa fa-phone"></i> <strong><spring:message code="contact-phone-name"/>:</strong> <spring:message code="contact-phone"/></p></li>
						<li><p><i class="fa fa-envelope"></i> <strong><spring:message code="contact-email-name"/>:</strong> <a href="mailto:info@athensoft.com"><spring:message code="contact-email"/></a></p></li>
					</ul>
					<img alt="Informatique Athensoft" src="${img_dir}/logo/qr_code.png" width="40%">
				</div>
			</div>
			
		</div>
	</div>
	<div class="footer-copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<a href="index.html" class="logo">
						<img alt="Informatique Athensoft" class="img-fluid" src="${img_dir}/logo/logo-grey.png" width="80%">
					</a>
				</div>
				<div class="col-lg-6">
					<p><spring:message code="footer-copyright"/></p>
				</div>
				<div class="col-lg-4">
					<nav id="sub-menu">
						<ul>
							<!-- <li><a href="/support/faq.html?lang=${loc}" target="_blank"><spring:message code="footer-link-faq"/></a></li> -->
							<!-- <li><a href="/support/support.html?lang=${loc}" target="_blank"><spring:message code="footer-link-support"/></a></li> -->
							<!-- <li><a href="/about/sitemap.html?lang=${loc}" target="_blank"><spring:message code="footer-link-sitemap"/></a></li> -->
							<li><a href="/about/comingsoon.html?lang=${loc}"><spring:message code="footer-link-faq"/></a></li>
							<li><a href="/about/comingsoon.html?lang=${loc}"><spring:message code="footer-link-support"/></a></li>
							<li><a href="/about/comingsoon.html?lang=${loc}"><spring:message code="footer-link-sitemap"/></a></li>
							<li><a href="/support/contactus.html?lang=${loc}" target="_blank"><spring:message code="footer-link-contact"/></a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</footer>

<script>
function doSubscribe(){
	//alert("doSubscribe: /support/subscribe");
	var email = $("#newsLetterEmail").val();
	//alert(email);
	var sendData = 'email='+email;
	//alert(sendData);
	
	$.ajax({
        type: "POST",
        url: "/support/subscribe",
        data : sendData,
        dataType : "json",
        timeout: 5000,
        success: function(msg) {
        	//alert("ok");
        	window.location.reload();
        },
        error: function(request) {  
            //alert("Connection error:"+request.error);  
        }
    });
}
</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-113930092-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-113930092-1');
</script>