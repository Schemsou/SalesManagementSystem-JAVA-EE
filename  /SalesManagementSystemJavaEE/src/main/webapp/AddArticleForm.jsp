<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
    </script>
    <script src=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
    </script>
<title>Add Article</title>
</head>
<body>
<style>
	.navbar{
		background-color:#022E57; font-size:1.4em; margin-bottom:0px; padding-bottom:0px;
	  justify-content: center;height:100px;
	}
	.items {
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
  width:100%;
  background-color:#005A8D;
  font-size:1.5em;
  transition: 0.7s ease;
  font-weight:400;
  
}
input[type=submit]:hover{
	color:#005A8D;
	background-color:#EEEEEE;
	cursor: pointer;
    transform:scale(1.1);
	
}
.sidebuttons{
	padding-top:100px;	
}
	
	
	.navbuttons{border: none;
 	 color: white;
  	padding: 16px 32px;
  	text-decoration: none;
  	margin: 2px 2px;
 	 cursor: pointer;
 	 width:100%;
 	 background-color:#022E57;
 	 font-size:1.5em;
 	 transition: 0.7s ease;
  	font-weight:200;}
	.tst:hover{
	color:#005A8D;
	background-color:#EEEEEE;
	cursor: pointer;
    transform:scale(1.1);
	
}
.navbar-nav{
padding-top:15px;
}
	</style>
	<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/billing" user="postgres" password="admin"/>
	
	<nav class="navbar navbar-expand-sm bg-light " style="" >
        <div class="container-fluid" style="height:70px; padding-top:10px;">
            <div class="navbar-header navbar-nav">
                <a class="navbar-brand" href="#">
                    BSMG</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="AdminDashboard.jsp" class="navbuttons" >Home</a></li>
                <li><a href="ClientsList.jsp" class="navbuttons"> Clients List </a></li>
                <li><a href="ArticlesList.jsp" class="navbuttons">Articles List</a></li>
                <li><a href="BillsList.jsp" class="navbuttons">Bills List</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                
                <li><a href="logout.jsp">
                    <span class="glyphicon glyphicon-log-in"></span>
                    Logout</a></li>
            </ul>
        </div>
    </nav>

	<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/billing" user="postgres" password="admin"/>
	
	<form action="AddArticle.jsp" class="form" id="articleform" style="padding-top:50px;width:600px;margin:auto;">
	
		<input type="text" name="reference"  placeholder="Reference" class="form-control" > <br>
		<input type="text" name="articlename" placeholder="Name" class="form-control" > <br>
		<input type="number" min="1" name="quantity" placeholder="Quantity" class="form-control" > <br>
		<input type="text" name="price" placeholder="Price" class="form-control" ><br>
		<input type="submit" value="add article" class="items">
	
	</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>