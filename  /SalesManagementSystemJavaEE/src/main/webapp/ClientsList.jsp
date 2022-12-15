<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <script src="https://cdn.tailwindcss.com"></script>

<title>Clients List</title>
</head>
<body>
	
	<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/billing" user="postgres" password="admin"/>
	
	<sql:query var="client" dataSource="${db}">
	
		select * from clients
	
	</sql:query>
	
	<table>
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
		<td><a href="Delete.jsp?idclient=${i.idclient}">Delete</a></td>
	 </tr>
	
	</c:forEach> 
			
		
		
	
	</table> <br>


</body>
</html>