<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<title>Articles List</title>
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
	
	<sql:query var="article" dataSource="${db}">
	
		select * from articles
	
	</sql:query>
	
	<table class="table table-striped">
		<tr class="">
			<th>Reference</th>		
			<th>Name</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Delete</th>
			
		</tr>
		
		<c:forEach items="${article.rows}" var="i"> 
	<tr>
		<td> <c:out value="${i.reference}"></c:out> 	</td>
		<td><c:out value="${i.articlename}"></c:out> </td>
		<td><c:out value="${i.quantity}"></c:out> </td>
		<td><c:out value="${i.price}"></c:out> </td>
		<td><a href="DeleteArticle.jsp?reference=${i.reference}">Delete</a></td>
	 </tr>
	
	</c:forEach> 
	</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>


</body>
</html>
