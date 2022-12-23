<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  type="text/css" href="secondstyle.css">

<link rel="stylesheet" href="jeestyle.css">
<link rel="stylesheet" href=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
    </script>
    <script src=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
    </script>
<title>Bill Form</title>
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
	<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/billing" user="postgres" password="admin"/>
	

	<nav class="navbar navbar-expand-sm bg-light " style="" >
        <div class="container-fluid" style="height:70px; padding-top:10px;">
            <div class="navbar-header navbar-nav">
                <a class="navbar-brand" href="#">
                    LOGO</a>
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
	
	<form action="AddBill.jsp" class="form" id="billform" style="padding-top:50px;width:600px;margin:auto;">
				<button type="button" onclick="showArticleFormBill()" class="form-control">Add article</button>
	
	<div id="ArticleBillButton" class="ArticleBillButton" >
	
	<sql:query var="article" dataSource="${db}">
	
		select * from articles
	
		</sql:query>
        <table class="table table-hover">
		<tr class="active">
			<th>Reference</th>		
			<th>Name</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Delete</th>
			
		</tr>
		
		<c:forEach items="${article.rows}" var="i"> 
		<tr>
		<td id="articleref"> <c:out value="${i.reference}"></c:out> 	</td>
		<td><c:out value="${i.articlename}"></c:out> </td>
		<td><c:out value="${i.quantity}"></c:out> </td>
		<td><c:out value="${i.price}"></c:out> </td>
		 <td><input type="number" min="1" id="<c:out value="${i.reference}"></c:out>"></td>
			<td><button onclick="articledetails('<c:out value="${i.reference}"></c:out>','<c:out value="${i.articlename}"></c:out>')">Add article</button></td>
		 </tr>
	
		</c:forEach> 
	
		</table>
	</div>
		<input type="text" name="billnumber" placeholder="Bill number" class="form-control"> <br>
		<input type="date" name="billingdate" placeholder="Date" class="form-control"> <br>
		<fieldset>
		<div>
		<input type="radio" id="cash" name="paymentmethod" value="cash" class="form-control">
  		<label for="cash"> Cash</label><br>
  		<input type="radio" id="bank" name="paymentmethod" value="bank" class="form-control">
  		<label for="bank"> Bank transaction</label><br> <br></div>
  		</fieldset>		
  		
  		<select id="list" name="list" onchange="getSelectedValue()" class="form-control">
  			<option>Select client</option>
  			<sql:query var="client" dataSource="${db}">
	
				select * from clients
	
			</sql:query>
			
			<c:forEach items="${client.rows}" var="i"> 
			<option value="<c:out value='${i.idclient }'/>">
			
			
			<c:out value="${i.clientname}"></c:out> 	
			<%-- <c:set var="nameclient" value="${i.clientname}" scope="application"></c:set> --%>
			
			</option>
			</c:forEach>
			
  		</select> <br>
		

     
        <script>
        function articledetails  (ref,name){
        	var qnt = document.getElementById(ref).value;
        	var artref = document.getElementById("articleref").innerHTML;
        	document.getElementById("billform").innerHTML+="<input type='hidden' value='"+ ref+"/"+qnt+"' name ='idr' >";

        }
        
        
        </script>
  			
  		<script type="text/javascript">
  		 var selectedValue
  		
  		function getSelectedValue(){
  			
  			selectedValue = document.getElementById("list").value;
  			console.log(selectedValue);
  			
  		}
  		
  		
  		</script>
  		<c:set var="sel" value="${param.selectedValue}" scope="application"></c:set>
  		<c:out value="${sel}"></c:out>
  		 <br>
		
  		  		<c:set var="test" value="${param.billnumber}" scope="application"></c:set>
  		
		<input type="submit" value="add bill" class="items">
	
	</form> <br>
	
	

<script>
var show;

function showArticleFormBill(){ if(show == 1) {
	document.getElementById("ArticleBillButton").style.display="inline";
	return show = 0;
}else{
	document.getElementById("ArticleBillButton").style.display="none ";
	return show = 1;
}
}


</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>