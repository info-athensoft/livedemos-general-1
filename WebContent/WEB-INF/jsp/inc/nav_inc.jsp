<%@ page contentType="text/html; charset=utf-8"%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- page variables  -->
<c:set var="img_dir" value="/images"></c:set>
<c:set var="webapp_name" value="/livedemos/ecommerce/1"/>
<c:set var="demo_img_dir" value="/livedemos/ecommerce/1/demo_images/prod"/>
<!-- END page variables -->

<!-- i18n -->
<c:set var="loc" value="en_US"/>
<c:if test="${!(empty param.lang)}">
  <c:set var="loc" value="${param.lang}"/>
</c:if>
<fmt:setLocale value="${loc}" />
<!-- END i18n -->

<div class="header-nav">
	<div
		class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1">
		<nav class="collapse">
			<ul class="nav nav-pills" id="mainNav">
			
				<li class=""><a class="nav-link active" href="${webapp_name}/?lang=${loc}"> <spring:message code="menu-home"/> </a></li>
				
				<!-- menu - brands -->
				<!-- 
				<li class="dropdown">
					<a class="dropdown-item dropdown-toggle" href="#?lang=${loc}"> Brands </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#?lang=${loc}" target="_blank"> Brand 1 </a></li>
						<li><a class="dropdown-item" href="#?lang=${loc}" target="_blank"> Brand 2 </a></li>
					</ul>
				</li>
				 -->
				
				<!-- menu - category -->
				<li class="dropdown">
					<a class="dropdown-item dropdown-toggle" href="/graphic/index.html?lang=${loc}"> Category </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}" target="_blank"> Category 1 </a></li>
						<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}" target="_blank"> Category 2 </a></li>
						<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}" target="_blank"> Category 3 </a></li>
						<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}" target="_blank"> Category 4 </a></li>
					</ul>
				</li>
				
				
				<!-- menu - new-collection -->
				<!-- 
				<li class="dropdown">
					<a class="dropdown-item dropdown-toggle" href="/graphic/index.html?lang=${loc}"> New collection </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#?lang=${loc}" target="_blank"> Collection 1 </a></li>
						<li><a class="dropdown-item" href="#?lang=${loc}" target="_blank"> Collection 2 </a></li>
					</ul>
				</li>
				 -->
				
				<!-- menu - Trends -->
				<!-- 
				<li class="dropdown">
					<a class="dropdown-item dropdown-toggle" href="/graphic/index.html?lang=${loc}"> Trends </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#?lang=${loc}" target="_blank"> Trend 1 </a></li>
						<li><a class="dropdown-item" href="#?lang=${loc}" target="_blank"> Trend 2 </a></li>
					</ul>
				</li>
				 -->
				
				<!-- menu - category -->
				<li class="dropdown dropdown-mega">
					<a class="dropdown-item dropdown-toggle" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Category Mega </a>
					<ul class="dropdown-menu">
						<li>
							<div class="dropdown-mega-content">
								<div class="row">
									<div class="col-lg-3">
										<span class="dropdown-mega-sub-title">Brands</span>
										<ul class="dropdown-mega-sub-nav">
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Brand 1 <span class="tip">new</span></a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Brand 2 </a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Brand 3 </a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Brand 4 </a></li>
										</ul>
									</div>
									
									<div class="col-lg-3">
										<span class="dropdown-mega-sub-title">Category</span>
										<ul class="dropdown-mega-sub-nav">
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Category 1 <span class="tip">new</span></a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Category 2 </a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Category 3 </a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Category 4 </a></li>
										</ul>
									</div>
									
									<div class="col-lg-3">
										<span class="dropdown-mega-sub-title">New collection</span>
										<ul class="dropdown-mega-sub-nav">
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Collection 1 <span class="tip">new</span></a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Collection 2 </a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Collection 3 </a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Collection 4 </a></li>
										</ul>
									</div>
									
									<div class="col-lg-3">
										<span class="dropdown-mega-sub-title">Trends</span>
										<ul class="dropdown-mega-sub-nav">
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Trend 1 <span class="tip">new</span></a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Trend 2 </a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Trend 3 </a></li>
											<li><a class="dropdown-item" href="${webapp_name}/shop-sidebar.html?lang=${loc}"> Trend 4 </a></li>
										</ul>
									</div>
									
								</div>
							</div>
						</li>
					</ul>
				</li>
				
				<!-- menu - cart -->
				<li class="dropdown dropdown-mega dropdown-mega-shop" id="headerShop">
					<a class="dropdown-item dropdown-toggle" href="page-login.html">
						<i class="fa fa-user mr-1"></i> Cart (3) - $942
					</a>
					<ul class="dropdown-menu">
						<li>
							<div class="dropdown-mega-content">
								<table class="cart">
									<tbody>
										<tr>
											<td class="product-thumbnail">
												<a href="shop-product-sidebar.html">
													<img width="100" height="100" alt="" class="img-fluid" src="${demo_img_dir}/1/1.jpg">
												</a>
											</td>
											<td class="product-name">
												<a href="shop-product-sidebar.html">Mini Plant 1<br><span class="amount"><strong>$314</strong></span></a>
											</td>
											<td class="product-actions">
												<a title="Remove this item" class="remove" href="#">
													<i class="fa fa-times"></i>
												</a>
											</td>
										</tr>
										<tr>
											<td class="actions" colspan="6">
												<div class="actions-continue">
													<button onclick="viewShopCart();" class="btn btn-light">View All</button>
													<button onclick="proceedToCheckout();" id="btn_proceedToCheckout" class="btn float-right btn-primary">Proceed to Checkout <i class="fa fa-angle-right ml-1"></i></button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</li>
					</ul>
				</li>
				
				
 				<!-- menu - language -->
 				<!-- 
				<li class="dropdown">
					<a class="dropdown-item dropdown-toggle" href="#"> <spring:message code="menu-lang"/> </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="/index.html?lang=en_US"><img alt="English" src="${img_dir}/language/canada.gif"/>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="lang_en"/></a></li>
						<li><a class="dropdown-item" href="/index.html?lang=fr_CA"><img alt="French" src="${img_dir}/language/french.gif"/>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="lang_fr"/></a></li>
						<li><a class="dropdown-item" href="/index.html?lang=zh_CN"><img alt="Chinese Simplied" src="${img_dir}/language/chineseS.gif"/>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="lang_chs"/></a></li>
					</ul>
				</li>
				 -->
			</ul>
		</nav>
	</div>
	<!-- 
	<ul class="header-social-icons social-icons d-none d-sm-block">
		<li class="social-icons-facebook"><a href="http://www.facebook.com/info.athensoft" target="_blank" title="Facebook"><i class="fa fa-facebook"></i></a></li>
		<li class="social-icons-twitter"><a href="http://www.twitter.com/Athensoft" target="_blank" title="Twitter"><i class="fa fa-twitter"></i></a></li>
		<li class="social-icons-linkedin"><a href="http://www.linkedin.com/" target="_blank" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
	</ul>
	 -->
	<button class="btn header-btn-collapse-nav" data-toggle="collapse"
		data-target=".header-nav-main nav">
		<i class="fa fa-bars"></i>
	</button>
</div>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-113930092-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-113930092-1');
</script>

<script>
	function proceedToCheckout(){
		//alert("ok");
		var webapp = "${webapp_name}";
		window.location.href = webapp+"/shop-checkout.html";
	}
	
	function viewShopCart(){
		//alert("ok");
		var webapp = "${webapp_name}";
		window.location.href = webapp+"/shop-cart.html";
	}
</script>