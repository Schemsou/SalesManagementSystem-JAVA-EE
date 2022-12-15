<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>        
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/billing" user="postgres" password="admin"/>
	
	<sql:update var="insert" dataSource="${db}">
	
		insert into articles values (?,?,?::integer,?::float);
		<sql:param value="${param.reference}"></sql:param>		
		<sql:param value="${param.articlename}"></sql:param>		
		<sql:param value="${param.quantity}"></sql:param>	
		<sql:param value="${param.price}"></sql:param>
	
	</sql:update>
	
	<c:redirect url="ArticlesList.jsp"></c:redirect>




</body>
</html>