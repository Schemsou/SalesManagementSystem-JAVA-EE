<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
	
</script>
<meta charset="UTF-8">
<title>Bills list</title>
</head>
<body>
	<style>
.navbar {
	background-color: #022E57;
	font-size: 1.4em;
	margin-bottom: 0px;
	padding-bottom: 0px;
	justify-content: center;
	height: 100px;
}

.items {
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
	width: 100%;
	background-color: #005A8D;
	font-size: 1.5em;
	transition: 0.7s ease;
	font-weight: 400;
}

input[type=submit]:hover {
	color: #005A8D;
	background-color: #EEEEEE;
	cursor: pointer;
	transform: scale(1.1);
}

.sidebuttons {
	padding-top: 100px;
}

.navbuttons {
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 2px 2px;
	cursor: pointer;
	width: 100%;
	background-color: #022E57;
	font-size: 1.5em;
	transition: 0.7s ease;
	font-weight: 200;
}

.tst:hover {
	color: #005A8D;
	background-color: #EEEEEE;
	cursor: pointer;
	transform: scale(1.1);
}

.navbar-nav {
	padding-top: 15px;
}
</style>
	<sql:setDataSource var="db" driver="org.postgresql.Driver"
		url="jdbc:postgresql://localhost:5432/billing" user="postgres"
		password="admin" />

	
	<nav class="navbar navbar-expand-sm bg-light " style="">
		<div class="container-fluid" style="height: 70px; padding-top: 10px;">
			<div class="navbar-header navbar-nav">
				<a class="navbar-brand" href="#"> BSMG</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="AdminDashboard.jsp" class="navbuttons">Home</a></li>
				<li><a href="ClientsList.jsp" class="navbuttons"> Clients
						List </a></li>
				<li><a href="ArticlesList.jsp" class="navbuttons">Articles
						List</a></li>
				<li><a href="BillsList.jsp" class="navbuttons">Bills List</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="logout.jsp"> <span
						class="glyphicon glyphicon-log-in"></span> Logout
				</a></li>
			</ul>
		</div>
	</nav>
	<sql:setDataSource var="db" driver="org.postgresql.Driver"
		url="jdbc:postgresql://localhost:5432/billing" user="postgres"
		password="admin" />
	<sql:query var="bill" dataSource="${db}">
	
		select * from bill
	
	</sql:query>

	<table class="table table-striped">
		<tr class="odd:bg-white even:bg-slate-50">
			<th>Bill number</th>
			<th>Billing date</th>
			<th>Payment method</th>
			<th>Client id</th>
			<th>Article / Quantity</th>

		</tr>



		<c:forEach items="${bill.rows}" var="i">
			<tr class="odd:bg-white even:bg-slate-50">
				<td><c:out value="${i.billnumber}"></c:out></td>
				<td><c:out value="${i.billingdate}"></c:out></td>
				<td><c:out value="${i.paymentmethod}"></c:out></td>
				<td><c:out value="${i.clientbill}"></c:out></td>
				<td><c:out value="${i.article}"></c:out></td>
				<td><a href="DeleteBill.jsp?billnumber=${i.billnumber}">Delete
				</a></td>
			</tr>

		</c:forEach>




	</table>
	<br>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>