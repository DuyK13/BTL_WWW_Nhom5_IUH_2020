<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Giỏ hàng</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
<!-- bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/themes/css/bootstrappage.css"
	rel="stylesheet" />

<!-- global styles -->
<link
	href="${pageContext.request.contextPath}/resources/themes/css/flexslider.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/themes/css/main.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/cart.css"
	rel="stylesheet" />
<!-- scripts -->
<script
	src="${pageContext.request.contextPath}/resources/themes/js/jquery-1.7.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/themes/js/superfish.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/themes/js/jquery.scrolltotop.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>


<style type="text/css">
.search_form input {
	color: #000;
}




#input-wrap {
	margin: 0px;
	padding: 0px;
}

input.number {
	text-align: center;
    border: none;
    border: 1px solid #ddd;
    margin: 0px;
    width: 20px;
    height: 17px;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body>
	<div id="top-bar" class="container">
		<div class="row">
			<div class="span4">
				<form method="POST" class="search_form">
					<input type="text" class="input-block-level search-query"
						Placeholder="Bạn muốn tìm kiếm gì?">
				</form>
			</div>
			<div class="span8">
				<div class="account pull-right">
					<ul class="user-menu">
						<li><a href="#">Tài khoản</a></li>
						<li><a href="cart.html">Giỏ hàng</a></li>
						<li><a href="checkout.html">Thanh toán</a></li>
						<li><a href="<c:url value="/login"/>">Đăng nhập</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="wrapper" class="container">
		<section class="navbar main-menu">
			<div class="navbar-inner main-menu">
				<a href="index.html" class="logo pull-left"><img
					src="resources/themes/images/chocolate_store.jpg" class="site_logo"
					alt=""></a>
				<nav id="menu" class="pull-right">
					<ul>
						<li><a href="./products.html">Woman</a>
							<ul>
								<li><a href="./products.html">Lacinia nibh</a></li>
								<li><a href="./products.html">Eget molestie</a></li>
								<li><a href="./products.html">Varius purus</a></li>
							</ul></li>
						<li><a href="./products.html">Man</a></li>
						<li><a href="./products.html">Sport</a>
							<ul>
								<li><a href="./products.html">Gifts and Tech</a></li>
								<li><a href="./products.html">Ties and Hats</a></li>
								<li><a href="./products.html">Cold Weather</a></li>
							</ul></li>
						<li><a href="./products.html">Hangbag</a></li>
						<li><a href="./products.html">Best Seller</a></li>
						<li><a href="./products.html">Top Seller</a></li>
					</ul>
				</nav>
			</div>
		</section>
		<section class="header_text sub">
			<img class="pageBanner"
				src="${pageContext.request.contextPath}/resources/themes/images/pageBanner.png"
				alt="New products">
			<h4>
				<span>Shopping Cart</span>
			</h4>
		</section>
		<section class="main-content">
			<div class="row">
				<div class="span9">
					<h4 class="title">
						<span class="text"><strong>Your</strong> Cart</span>
					</h4>
					<table class="table table-striped">
						<thead>
							<tr>

								<th>Image</th>
								<th>Product Name</th>
								<th>Quantity</th>
								<th>Unit Price</th>
								<th>Tool</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="x" items="${cart.getAll()}" varStatus="c">
								<input type="hidden" id="choco_id${c.index}" value="${x.id}"
									name="product_id">
								<tr>
									<td class="cart-product-image"><a
										href="product_detail.html"><img alt=""
											src="${pageContext.request.contextPath}/resources/themes/images/ladies/9.jpg"></a></td>
									<td>${x.name}</td>
									<%-- <td>
										<div class="value-button"  id="btnDown${c.index}"
											onclick="btnDownClick(${c.index})">-	</div>
											<input type="number" class="number" id="quan${c.index}" value="${x.quantity}" min="1" />
										<div class="value-button" id="btnUp${c.index}"
											 onclick="btnUpClick(${c.index})">+</div>
									</td> --%>
									<td><a id="btnDown${c.index}"
										onclick="btnDownClick(${c.index})"><button
												class="minus is-form">-</button></a> <input type="number" class="number" id="quan${c.index}" value="${x.quantity}" min="1" /> <a
										id="btnUp${c.index}" onclick="btnUpClick(${c.index})"><button
												class="plus is-form">+</button></a></td> 
									<td>${x.cost}</td>
									<td><a id="btnRemove${c.index}"
										onclick="btnRemoveClick(${c.index})"><button>Xóa
												giỏ hàng</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="span3">
					<!-- 	<div class="block"></div> -->
					<div id="cart-total">
						<ul class="prices-items">
							<li class="prices-item"><span class="price-text">Thành
									Tiền</span> <input type="text" value="${cart.getTotal()}"></li>
						</ul>
					</div>

					<div>
						<button type="button" class="btnSubmit">Tiến hành thanh
							toán</button>
					</div>
				</div>
			</div>
		</section>
		<section id="footer-bar">
			<div class="row">
				<div class="span3">
					<h4>Navigation</h4>
					<ul class="nav">
						<li><a href="./index.html">Homepage</a></li>
						<li><a href="./about.html">About Us</a></li>
						<li><a href="./contact.html">Contac Us</a></li>
						<li><a href="./cart.html">Your Cart</a></li>
						<li><a href="./register.html">Login</a></li>
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
			<span>Copyright@ CongDuyDat.</span>
		</section>
	</div>
</body>
</html>