<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chocolate form</title>
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
		<div class="col-md-offset-2 col-md-7">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title text-center">Add Chocolate</div>
				</div>
				<div class="panel-body">
					<form:form action="saveChocolate" cssClass="form-horizontal"
						method="post" modelAttribute="chocolate"
						enctype="multipart/form-data">
						<form:hidden path="id" />

						<div class="form-group">
							<label for="name" class="col-md-3 control-label">Name</label>
							<div class="col-md-9">
								<form:input path="name" cssClass="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label for="amount" class="col-md-3 control-label">Amount</label>
							<div class="col-md-9">
								<form:input path="amount" value="" cssClass="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label for="cost" class="col-md-3 control-label">Cost</label>
							<div class="col-md-9">
								<form:input path="cost" value="" cssClass="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label for="description" class="col-md-3 control-label">Description</label>
							<div class="col-md-9">
								<form:input path="description" cssClass="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label for="discount" class="col-md-3 control-label">Discount</label>
							<div class="col-md-9">
								<form:input path="discount" cssClass="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label for="file" class="col-md-3 control-label">Images</label>
							<div class="col-md-9">
								<input type="file" id="file" name="file">
							</div>
						</div>

						<div class="form-group">
							<label for="category" class="col-md-3 control-label">Category</label>
							<div class="col-md-9">
								<form:select path="category">
									<form:option value="0" label="Please Select" />
									<c:forEach var="category" items="${categories}">
										<option value="${category.id}">${category.name}</option>
									</c:forEach>
								</form:select>
							</div>
						</div>

						<div class="form-group">
							<!-- Button -->
							<div class="text-center col-md-offset-3 col-md-9">
								<form:button cssClass="btn btn-primary">Submit</form:button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>