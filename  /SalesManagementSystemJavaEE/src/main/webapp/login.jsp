<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginCheck</title>
</head>
<body>

	
		 <c:if test="${param.uname != null}">
		 
		 	<c:set var="username" value="${param.uname}" scope="request" />
         	<c:set var="password" value="${param.pwd}" scope="request" />
          
            	<c:if test="${username == 'admin' && password == 'admin'}">
              		<c:set var="session" value="admin" scope="session"  />
              		<c:redirect url="AdminDashboard.jsp"></c:redirect>
            	</c:if>
            
		 </c:if>
		 
		 <c:if test="${username != 'admin' && password!='admin'}">
		 
		 	<c:redirect url="index.html"></c:redirect>
		 		 
		 </c:if>            

</body>
</html>