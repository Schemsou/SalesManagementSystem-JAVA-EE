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

<title>Clients List</title>
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
	
	<sql:query var="client" dataSource="${db}">
	
		select * from clients
	
	</sql:query>
	
	<table class="table table-striped">
		<tr class="odd:bg-white even:bg-slate-50">
			<th>ID</th>		
			<th>Name</th>
			<th>Phone</th>
			<th>Email</th>
			<th>Delete</th>
			
		</tr>
		
		
		
		<c:forEach items="${client.rows}" var="i"> 
	<tr class="odd:bg-white even:bg-slate-50">
		<td> <c:out value="${i.idclient}"></c:out> 	</td>
		<td><c:out value="${i.clientname}"></c:out> </td>
		<td><c:out value="${i.phonenumber}"></c:out> </td>
		<td><c:out value="${i.email}"></c:out> </td>
		<td><a href="Delete.jsp?idclient=${i.idclient}">Delete </a></td>
	 </tr>
	
	</c:forEach> 
			
		
		
	
	</table> <br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

</body>
</html>