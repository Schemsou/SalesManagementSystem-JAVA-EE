<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link rel="stylesheet" href="style.css">
<title>Dashboard</title>
</head>
<body>

	<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/billing" user="postgres" password="admin"/>
	
	<%-- <c:set var="admin" value="${param.username}" scope="request"></c:set>
	Welcome, 
	${session}
	--%>
	
	
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
	
	
	<div class="container-fluid my-container ">
	
		<div class="row my-row">
			<div class="col-2 my-col side">
				<div class="btn-group-vertical">
				<form action="AddClientForm.jsp" class="items" id="clientform">
					<input type="submit" value="add new client" class="items">
				</form>	
				<form action="AddArticleForm.jsp" id="articleform">
					<input type="submit" value="add new article" class="items">
					</form>
					<form action="AddBillForm.jsp" class="btn btn-secondary" id="billform">
					<input type="submit" value="add new bill" class="btn " >
				</form>
				</div>
						
  				
					
	  			
				
  				
				
			</div>
			<div class="col-10 my-col">
			
			<div class="main">
        <div class="pub">
            <div class="left">
                <div class="title" style="color:#263159;">BestSMGS</div>
                <div class="paragraphe">
                    With BestSMGS manage your sales perfectly!
                </div>
            </div>
            
        </div>
			</div>
		</div>
	
	</div>
	
	

<script>

	var show;
	function showClientForm(){
		if(show == 1){
			document.getElementById("clientform").style.display="inline";
			return show = 0;
		}
		else{
			document.getElementById("clientform").style.display="none ";
			return show = 1;
		}
	}
	
	function showArticleForm(){ if(show == 1) {
		document.getElementById("articleform").style.display="inline";
		return show = 0;
	}else{
		document.getElementById("articleform").style.display="none ";
		return show = 1;
	}
	}
	
	function showBillForm(){ if(show == 1) {
		document.getElementById("billform").style.display="inline";
		return show = 0;
	}else{
		document.getElementById("billform").style.display="none ";
		return show = 1;
	}
	}
	
	function showBillLineForm(){ if(show == 1) {
		document.getElementById("BillLineButton").style.display="inline";
		return show = 0;
	}else{
		document.getElementById("BillLineButton").style.display="none ";
		return show = 1;
	}
	}
	
	
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

</body>
</html>