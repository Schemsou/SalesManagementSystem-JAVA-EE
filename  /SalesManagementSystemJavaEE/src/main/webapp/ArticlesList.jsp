<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Articles List</title>
</head>
<body>
	
	<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/billing" user="postgres" password="admin"/>
	
	<sql:query var="article" dataSource="${db}">
	
		select * from articles
	
	</sql:query>
	
	<table>
		<tr>
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


</body>
</html>
