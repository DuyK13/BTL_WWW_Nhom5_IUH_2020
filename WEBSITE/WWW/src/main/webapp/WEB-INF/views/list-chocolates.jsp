<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List chocolates</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-1 col-md-10">
			<input type="button" value="Add Chocolate"
				onclick="window.location.href='showChocolateForm'; return false;"
				class="btn btn-primary" /> <br /> <br />
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Chocolate List</div>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>amount</th>
							<th>cost</th>
							<th>description</th>
							<th>listImage</th>
							<th>discount</th>
							<th>category</th>
						</tr>

						<c:forEach var="chocolate" items="${chocolates}">
							<tr>
								<td>${chocolate.id}</td>
								<td>${chocolate.name}</td>
								<td>${chocolate.amount}</td>
								<td>${chocolate.cost}</td>
								<td>${chocolate.description}</td>
								<td><img alt="" src="${chocolate.image}"></td>
								<td>${chocolate.discount}</td>
								<td>${chocolate.category.name}</td>
							</tr>
						</c:forEach>

					</table>

				</div>
			</div>
		</div>

	</div>
</body>
</html>