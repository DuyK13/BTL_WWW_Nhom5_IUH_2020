<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Chocolate Store</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
	<!-- bootstrap -->
	<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link href="resources/themes/css/bootstrappage.css" rel="stylesheet" />
	
	<!-- global styles -->
	<link href="<c:url value="resources/themes/css/flexslider.css"/>" rel="stylesheet" />
	<link href="<c:url value="resources/themes/css/main.css"/>" rel="stylesheet" />
	
	<!-- scripts -->
	<%-- <script src="<c:url value="resources/themes/js/jquery-1.7.2.min.js"/>"></script>
	<script src="<c:url value="resources/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="resources/themes/js/superfish.js"/>"></script>
	<script src="<c:url value="resources/themes/js/jquery.scrolltotop.js"/>"></script> --%>
	
	<%-- <link rel="stylesheet" href="<c:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>" crossorigin="anonymous">
	<script src="<c:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"/>" crossorigin="anonymous"></script> --%>
	
</head>
<body>
	<div id="top-bar" class="container">
		<div class="row">
			<div class="span4">
				<form method="POST" class="search_form">
					<input type="text" class="input-block-level search-query"
						Placeholder="Bạn muốn tìm kiếm gì?">
				</form>
				<%-- <form:form method="POST" class="search_form">
					<form:input path="" type="text" class="input-block-level search-query"
						Placeholder="Bạn muốn tìm kiếm gì?"/>
				</form:form> --%>
			</div>
			<div class="span8">
				<div class="account pull-right">
					<ul class="user-menu">
						<li><label style="color: red; font-weight: bold; text-transform: uppercase;">${userLogin}</label></li>
						<li><a href="cart.html">Giỏ hàng</a></li>
						<li><a href="checkout.html">Thanh toán</a></li>
						<li><%-- <a href="<c:url value="/login"/>">Đăng nhập</a> --%>
							<c:choose>
								<c:when test="${empty userLogin}"><a href="<c:url value="/login"/>">Đăng nhập</a></c:when>
							</c:choose>
							<c:choose>
								<c:when test="${! empty userLogin}"><a href="<c:url value="/logout"/>">Đăng xuất</a></c:when>
							</c:choose>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="wrapper" class="container">
		<section class="navbar main-menu">
			<div class="navbar-inner main-menu">
				<a href="index.html" class="logo pull-left">
				<img src="resources/themes/images/chocolate_store.jpg" class="site_logo" alt=""></a>
				<nav id="menu" class="pull-right">
					<ul>
						<li><a href="./products.html">Trang chủ</a></li>
						<li><a href="<c:url value="/listchocolates"/>">Sản phẩm</a></li>
						<li class="nav-item dropdown dmenu">
							<a href="<c:url value="/listcategorys"/>" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Thể loại</a>
							<div class="dropdown-menu sm-menu" aria-labelledby="navbarDropdown">
								<a href="./products.html" class="dropdown-item">Socola Sữa</a>
								<a href="./products.html" class="dropdown-item">Socola Tươi</a>
								<a href="./products.html" class="dropdown-item">Socola Đắng</a>
								<a href="./products.html" class="dropdown-item">Socola Hạt</a>
								<a href="./products.html" class="dropdown-item">Socola Thanh</a>
							</div>
						</li>
						<li><a href="./products.html">Về chúng tôi</a></li>
						<li><a href="./products.html">Liên hệ</a></li>
					</ul>
				</nav>
			</div>
		</section>
		<div id="carouselExampleSlidesOnly" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<%-- <div class="carousel-item active">
					<img src="<c:url value="resources/themes/images/banner1.png"/>" alt="Banner1" />
				</div> --%>
				<div class="carousel-item">
					<img src="<c:url value="resources/themes/images/banner2.png"/>" alt="Banner2" />
					<div class="carousel-caption d-none d-md-block">
						<h1 style="color: red;">Mid season sale</h1>
							<p>
								<span>Up to 50% Off</span>
							</p>
							<p>
								<span>On selected items online and in stores</span>
							</p>
					</div>
				</div>
			</div>
		</div>
		<!-- <section class="header_text">
				We stand for top quality templates. Our genuine developers always optimized bootstrap commercial templates. 
				<br/>Don't miss to use our cheap abd best bootstrap templates.
			</section> -->
		<section class="main-content">
			<div class="row">
				<div class="span12">
					<div class="row">
						<div class="span12">
							<h4 class="title">
								<span class="pull-left"><span class="text"><span
										class="line">Feature <strong>Products</strong></span></span></span> 
								<!-- <span class="pull-right"> <a class="left button"
									href="#myCarousel" data-slide="prev"></a><a
									class="right button" href="#myCarousel" data-slide="next"></a>
								</span> -->
							</h4>
							<div id="myCarousel" class="myCarousel carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails">
											<c:forEach var="chocolate" items="${chocolates}">
												<li class="span3">
													<div class="product-box" style="height: 450px;">
														<span class="sale_tag"></span>
														<p>
															<a href="<c:url value='/${chocolate.name }'/>">
																<img alt="Chocolate Image" src="<c:url value="${chocolate.image}"/>">
															</a>
															<button class="btn btn-warning btn-sm" style="margin-top: 20px;">Add To Cart</button>
														</p>
														<a href="${pageContext.request.contextPath }/${chocolate.name }" class="title">${chocolate.name}</a>
														<br /> 
														<a href="products.html" class="category">${chocolate.category.name}</a>
														<p class="price">${chocolate.cost} VND</p>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br />
					<div class="row">
						<div class="span12">
							<h4 class="title">
								<span class="pull-left"><span class="text"><span
										class="line">Latest <strong>Products</strong></span></span></span> <span
									class="pull-right"> <a class="left button"
									href="#myCarousel-2" data-slide="prev"></a><a
									class="right button" href="#myCarousel-2" data-slide="next"></a>
								</span>
							</h4>
							<div id="myCarousel-2" class="myCarousel carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails">
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>
													<p>
														<a href="product_detail.html"><img
															src="resources/themes/images/cloth/bootstrap-women-ware2.jpg"
															alt="" /></a>
													</p>
													<a href="product_detail.html" class="title">Ut wisi
														enim ad</a><br /> <a href="products.html" class="category">Commodo
														consequat</a>
													<p class="price">$25.50</p>
													<button class="btn btn-warning btn-sm">Add To Cart</button>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">
													<p>
														<a href="product_detail.html"><img
															src="resources/themes/images/cloth/bootstrap-women-ware1.jpg"
															alt="" /></a>
													</p>
													<a href="product_detail.html" class="title">Quis
														nostrud exerci tation</a><br /> <a href="products.html"
														class="category">Quis nostrud</a>
													<p class="price">$17.55</p>
													<button class="btn btn-warning btn-sm">Add To Cart</button>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">
													<p>
														<a href="product_detail.html"><img
															src="resources/themes/images/cloth/bootstrap-women-ware6.jpg"
															alt="" /></a>
													</p>
													<a href="product_detail.html" class="title">Know
														exactly turned</a><br /> <a href="products.html"
														class="category">Quis nostrud</a>
													<p class="price">$25.30</p>
													<button class="btn btn-warning btn-sm">Add To Cart</button>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">
													<p>
														<a href="product_detail.html"><img
															src="resources/themes/images/cloth/bootstrap-women-ware5.jpg"
															alt="" /></a>
													</p>
													<a href="product_detail.html" class="title">You think
														fast</a><br /> <a href="products.html" class="category">World
														once</a>
													<p class="price">$25.60</p>
													<button class="btn btn-warning btn-sm">Add To Cart</button>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails">
											<li class="span3">
												<div class="product-box">
													<p>
														<a href="product_detail.html"><img
															src="resources/themes/images/cloth/bootstrap-women-ware4.jpg"
															alt="" /></a>
													</p>
													<a href="product_detail.html" class="title">Know
														exactly</a><br /> <a href="products.html" class="category">Quis
														nostrud</a>
													<p class="price">$45.50</p>
													<button class="btn btn-warning btn-sm">Add To Cart</button>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">
													<p>
														<a href="product_detail.html"><img
															src="resources/themes/images/cloth/bootstrap-women-ware3.jpg"
															alt="" /></a>
													</p>
													<a href="product_detail.html" class="title">Ut wisi
														enim ad</a><br /> <a href="products.html" class="category">Commodo
														consequat</a>
													<p class="price">$33.50</p>
													<button class="btn btn-warning btn-sm">Add To Cart</button>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">
													<p>
														<a href="product_detail.html"><img
															src="resources/themes/images/cloth/bootstrap-women-ware2.jpg"
															alt="" /></a>
													</p>
													<a href="product_detail.html" class="title">You think
														water</a><br /> <a href="products.html" class="category">World
														once</a>
													<p class="price">$45.30</p>
													<button class="btn btn-warning btn-sm">Add To Cart</button>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">
													<p>
														<a href="product_detail.html"><img
															src="resources/themes/images/cloth/bootstrap-women-ware1.jpg"
															alt="" /></a>
													</p>
													<a href="product_detail.html" class="title">Quis
														nostrud exerci</a><br /> <a href="products.html"
														class="category">Quis nostrud</a>
													<p class="price">$25.20</p>
													<button class="btn btn-warning btn-sm">Add To Cart</button>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row feature_box">
						<div class="span4">
							<div class="service">
								<div class="responsive">
									<img src="resources/themes/images/feature_img_2.png" alt="" />
									<h4>
										MODERN <strong>DESIGN</strong>
									</h4>
								</div>
							</div>
						</div>
						<div class="span4">
							<div class="service">
								<div class="customize">
									<img src="resources/themes/images/feature_img_1.png" alt="" />
									<h4>
										FREE <strong>SHIPPING</strong>
									</h4>
								</div>
							</div>
						</div>
						<div class="span4">
							<div class="service">
								<div class="support">
									<img src="resources/themes/images/feature_img_3.png" alt="" />
									<h4>
										24/7 LIVE <strong>SUPPORT</strong>
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="our_client">
			<h4 class="title">
				<span class="text">Manufactures</span>
			</h4>
			<div class="row">
				<div class="span2">
					<a href="#"><img alt="" src="resources/themes/images/clients/01.png"></a>
				</div>
				<div class="span2">
					<a href="#"><img alt="" src="resources/themes/images/clients/02.png"></a>
				</div>
				<div class="span2">
					<a href="#"><img alt="" src="resources/themes/images/clients/03.png"></a>
				</div>
				<div class="span2">
					<a href="#"><img alt="" src="resources/themes/images/clients/04.png"></a>
				</div>
				<div class="span2">
					<a href="#"><img alt="" src="resources/themes/images/clients/05.png"></a>
				</div>
				<div class="span2">
					<a href="#"><img alt="" src="resources/themes/images/clients/06.png"></a>
				</div>
			</div>
		</section>
		<section id="footer-bar">
			<div class="row">
				<div class="span3">
					<h4>Navigation</h4>
					<ul class="nav">
						<li><a href="#">Homepage</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Contac Us</a></li>
						<li><a href="#">Your Cart</a></li>
						<li><a href="#">Login</a></li>
					</ul>
				</div>
				<div class="span4">
					<h4>My Account</h4>
					<ul class="nav">
						<li><a href="#">My Account</a></li>
						<li><a href="#">Order History</a></li>
						<li><a href="#">Wish List</a></li>
						<li><a href="#">Newsletter</a></li>
					</ul>
				</div>
				<div class="span5">
					<!-- <p class="logo"><img src="themes/images/logo.png" class="site_logo" alt=""></p> -->
					<p class="logo">
					<h3 style="color: red;">Chocolate Store</h3>
					</p>
					<p>Make by:</p>
					<p>Trương Thành Công - 12truongcong@gmail.com</p>
					<p>Trần Thế Duy - trantheduyk13@gmail.com</p>
					<p>Nguyễn Lương Đạt - datit4869@gmail.com</p>
					<br /> <span class="social_icons"> <a class="facebook"
						href="#">Facebook</a> <a class="twitter" href="#">Twitter</a> <a
						class="skype" href="#">Skype</a> <a class="vimeo" href="#">Vimeo</a>
					</span>
				</div>
			</div>
		</section>
		<section id="copyright">
			<span>Copyright 2013 bootstrappage template All right
				reserved.</span>
		</section>
	</div>
	<%-- <script src="<c:url value="themes/js/common.js"/>"></script>
	<script src="<c:url value="themes/js/jquery.flexslider-min.js"/>"></script>
	<script type="text/javascript">
			$(function() {
				$(document).ready(function() {
					$('.flexslider').flexslider({
						animation: "fade",
						slideshowSpeed: 4000,
						animationSpeed: 600,
						controlNav: false,
						directionNav: true,
						controlsContainer: ".flex-container" // the container that holds the flexslider
					});
				});
			});
		</script> --%>
</body>
</body>
</html>