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
	<link href="resources/themes/css/flexslider.css" rel="stylesheet" />
	<link href="resources/themes/css/main.css" rel="stylesheet" />
	
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
		<section class="header_text sub">
			<img class="pageBanner" src="resources/themes/images/banner1.png"
				alt="New products">
			<h4>
				<span style="margin-top: 10px;">Chi tiết sản phẩm</span>
			</h4>
		</section>
		
		<section class="main-content">				
				<div class="row">						
					<div class="span9">
						<div class="row">
							<div class="span4">
							<img alt="Chocolate Image" src="<c:url value='${chocolateDetail.image}'/>">											
							</div>
							<div class="span5">
								<address>
									<strong>Tên sản phẩm:</strong> <span>${chocolateDetail.name }</span><br>
									<strong>Loại sản phẩm:</strong> <span>${chocolateDetail.category.name}</span><br>
									<strong>Khuyến mãi:</strong> <span>${chocolateDetail.discount }</span><br>								
								</address>									
								<h4><strong>Price:  ${chocolateDetail.cost } VND</strong></h4>
								<p>Mô tả: ${chocolateDetail.description }</p>
								<p>&nbsp;</p>
								<label>Qty: <input type="text" placeholder="1" style="margin-left: 20px;"></label>
								
								<button class="btn btn-warning btn-sm">Add To Cart</button>
								
							</div>														
						</div>
						<div class="row">
							<div class="span9">
														
							</div>						
							<div class="span9">	
								
							</div>
						</div>
					</div>
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">SUB CATEGORIES</li>
								<li><a href="products.html">Nullam semper elementum</a></li>
								<li class="active"><a href="products.html">Phasellus ultricies</a></li>
								<li><a href="products.html">Donec laoreet dui</a></li>
								<li><a href="products.html">Nullam semper elementum</a></li>
								<li><a href="products.html">Phasellus ultricies</a></li>
								<li><a href="products.html">Donec laoreet dui</a></li>
							</ul>
							<br/>
							<ul class="nav nav-list below">
								<li class="nav-header">MANUFACTURES</li>
								<li><a href="products.html">Adidas</a></li>
								<li><a href="products.html">Nike</a></li>
								<li><a href="products.html">Dunlop</a></li>
								<li><a href="products.html">Yamaha</a></li>
							</ul>
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

</body>
</html>