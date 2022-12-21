<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Bills list</title>
</head>
<body>
<nav class="navbar ">
  <!-- Navbar content -->
  	<div class="navlinks"  >LOGO</div>
	
  <form action="AdminDashboard.jsp" >
			<input type="submit" class="navlinks"  value="Home">
		</form>

	<form action="ClientsList.jsp"  >
			<input type="submit" class="navlinks" value="Clients List">
		</form>
	<form action="ArticlesList.jsp" >
			<input type="submit" class="navlinks"  value="Articles List">
		</form>
	<form action="BillsList.jsp" >
			<input type="submit" class="navlinks"  value="Bills List">
		</form>
	<form action="logout.jsp"  >
		<input type="submit" class="navlinks"  value="logout" class="logoutbutton">
	
	</form>
		
	</nav>
	<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/billing" user="postgres" password="admin"/>
	<sql:query var="bill" dataSource="${db}">
	
		select * from bill
	
	</sql:query>
	
		<table class="table table-striped">
		<tr class="odd:bg-white even:bg-slate-50">
			<th>Bill number</th>		
			<th>Billing date</th>
			<th>Payment method</th>
			<th>Client id</th>
			<th>Article/Quantity</th>
			
		</tr>
		
		
		
		<c:forEach items="${bill.rows}" var="i"> 
	<tr class="odd:bg-white even:bg-slate-50">
		<td> <c:out value="${i.billnumber}"></c:out> 	</td>
		<td><c:out value="${i.billingdate}"></c:out> </td>
		<td><c:out value="${i.paymentmethod}"></c:out> </td>
		<td><c:out value="${i.clientbill}"></c:out> </td>
		<td><c:out value="${i.article}"></c:out> </td>
		<td><a href="DeleteBill.jsp?billnumber=${i.billnumber}">Delete </a></td>
	 </tr>
	
	</c:forEach> 
			
		
		
	
	</table> <br>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>