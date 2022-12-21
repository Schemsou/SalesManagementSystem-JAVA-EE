<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>        
    
    

<!DOCTYPE html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/billing" user="postgres" password="admin"/>


	Welcome, 
	${idr} <br>
	${list}
	
	<%-- <sql:query var="client" dataSource="${db}">
	
		select * from clients where idclient = ?::integer;
		<sql:param value="${param.list}" />
	</sql:query>
	<c:forEach items="${client.rows}" var="i"> 
	
		${i.clientname}
	
	
	</c:forEach>--%>
	
<sql:update var="insert" dataSource="${db}">
	
		insert into bill (billnumber, billingdate, paymentmethod, clientbill, article) values (?,?::date,?,?,?);
		<sql:param value="${param.billnumber}"></sql:param>		
		<sql:param value="${param.billingdate}"></sql:param>	
		<sql:param value="${param.paymentmethod}"></sql:param>		
		<sql:param value="${param.list}"></sql:param>		
		<sql:param value="${param.idr}"></sql:param>		
		
	</sql:update>

	<c:redirect url="BillsList.jsp"></c:redirect>

</body>
</html>