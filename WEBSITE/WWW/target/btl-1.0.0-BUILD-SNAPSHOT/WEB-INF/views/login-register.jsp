<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Đăng nhập</title>
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
	<script src="<c:url value="resources/themes/js/jquery-1.7.2.min.js"/>"></script>
	<script src="<c:url value="resources/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="resources/themes/js/superfish.js"/>"></script>
	<script src="<c:url value="resources/themes/js/jquery.scrolltotop.js"/>"></script>
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
					src="resources/themes/images/chocolate_store.jpg" class="site_logo" alt=""></a>
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
			<img class="pageBanner" src="resources/themes/images/banner1.png"
				alt="New products">
			<h4>
				<span>Login or Regsiter</span>
			</h4>
		</section>
		<section class="main-content">
			<div class="row">
				<div class="span5">
					<h4 class="title">
						<span class="text"><strong>Login</strong> Form</span>
					</h4>
					<form:form action="loginUser" method="post" modelAttribute="user">
						<input type="hidden" name="next" value="/">
						<fieldset>
							<div class="control-group">
								<label class="control-label">Tên tài khoản</label>
								<div class="controls">
									<form:input path="username" type="text" placeholder="Nhập tên tài khoản"
										id="username" class="input-xlarge"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Mật khẩu</label>
								<div class="controls">
									<form:input path="password" type="password" placeholder="Nhập mật khẩu"
										id="password" class="input-xlarge"/>
								</div>
							</div>
							<%-- <c:if test="${!empty message}"> --%>
								<label style="color: red;">${message}</label>
							<%-- </c:if> --%>
							<div class="control-group">
								<form:button tabindex="3" class="btn btn-inverse large" type="submit"
									value="Sign into your account">Đăng nhập</form:button>
								<hr>
								<p class="reset">
									Recover your <a tabindex="4" href="#"
										title="Recover your username or password">username or
										password</a>
								</p>
							</div>
						</fieldset>
					</form:form>
				</div>
				<div class="span7">
					<h4 class="title">
						<span class="text"><strong>Register</strong> Form</span>
					</h4>
					<form:form action="saveUser" method="post" modelAttribute="user" class="form-stacked">
						<fieldset>
							<div class="control-group">
								<label class="control-label">Tên tài khoản:</label>
								<div class="controls">
									<!-- <input type="text" placeholder="Nhập tên tài khoản"
										class="input-xlarge"> -->
									<form:input path="username" type="text" placeholder="Nhập tên tài khoản"
										class="input-xlarge"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Email:</label>
								<div class="controls">
									<!-- <input type="password" placeholder="Nhập email"
										class="input-xlarge"> -->
									<form:input path="email" type="email" placeholder="Nhập email"
										class="input-xlarge"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Mật khẩu:</label>
								<div class="controls">
									<!-- <input type="password" placeholder="Nhập mật khẩu"
										class="input-xlarge"> -->
									<form:input path="password" type="password" placeholder="Nhập mật khẩu"
										class="input-xlarge"/>
								</div>
							</div>
							<div class="control-group">
								<p>Now that we know who you are. I'm not a mistake! In a
									comic, you know how you can tell who the arch-villain's going
									to be?</p>
							</div>
							<hr>
							<div class="actions">
								<form:button tabindex="9" class="btn btn-inverse large" type="submit">
									Đăng ký tài khoản</form:button>
							</div>
						</fieldset>
					</form:form>
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
			<span>Copyright 2013 bootstrappage template All right
				reserved.</span>
		</section>
	</div>
	<script src="themes/js/common.js"></script>
	<script>
			$(document).ready(function() {
				$('#checkout').click(function (e) {
					document.location.href = "checkout.html";
				})
			});
		</script>
</body>
</html>