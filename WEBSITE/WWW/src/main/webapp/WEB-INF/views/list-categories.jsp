<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>>List categories</title>
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
			<input type="button" value="Add Category"
				onclick="window.location.href='showCategoryForm'; return false;"
				class="btn btn-primary" /> <br /> <br />
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Category List</div>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>Name</th>
						</tr>
						<tr>
							<th>${categories}</th>
						</tr>

						<%-- 						<c:forEach var="category" items="${categories}">
							<tr>
								<td>${category.name}</td>
							</tr>
						</c:forEach> --%>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>