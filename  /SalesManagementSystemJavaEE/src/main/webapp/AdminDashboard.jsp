<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Dashboard</title>
</head>
<body>

	<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/billing" user="postgres" password="admin"/>
	
	<%-- <c:set var="admin" value="${param.username}" scope="request"></c:set>
	Welcome, 
	${session}
	--%>
	<div class="grid grid-cols-6 gap-0 " >
	
	<div class="bg-sky-500 hover:bg-sky-700" >LOGO</div>
	
	<form action="AdminDashboard.jsp" class="bg-sky-500 hover:bg-sky-700" >
			<input type="submit" value="Home">
		</form>

	<form action="ClientsList.jsp" class="bg-sky-500 hover:bg-sky-700" >
			<input type="submit" value="Clients List">
		</form>
	<form action="ArticlesList.jsp" class="bg-sky-500 hover:bg-sky-700"  >
			<input type="submit" value="Articles List">
		</form>
	<form action="BillsList.jsp" class="bg-sky-500 hover:bg-sky-700" >
			<input type="submit" value="Bills List">
		</form>
	<form action="logout.jsp" class="bg-sky-500 hover:bg-sky-700" >
		<input type="submit" value="logout" class="logoutbutton">
	
	</form>
	
	
	</div>
	
	<ul>
		<li class="group/item hover:bg-slate-100 ...">
				<button type="button" id="AddClientButton" onclick="showClientForm()">Add new client</button> <br>
			
  		</li>
  		<li class="group/item hover:bg-slate-100 ...">
  			<button type="button" id="AddClientButton" onclick="showArticleForm()">Add new article</button> <br>
  		</li>
  		<li class="group/item hover:bg-slate-100 ...">
  			<button type="button" id="AddBillButton" onclick="showBillForm()">Add new bill</button> <br>
  		</li>
  		
  		</ul>
	
	


	<form action="AddClient.jsp" class="addingForms" id="clientform">
	
		<%-- <input type="number" name="idclient" placeholder="ID"> <br> --%>
		<input type="text" name="clientname" placeholder="Name"> <br>
		<input type="text" name="phonenumber" placeholder="Phone number"> <br>
		<input type="email" name="email" placeholder="Email"><br>
		<input type="submit" value="add client">
	
	</form>


	<form action="AddArticle.jsp" class="addingForms" id="articleform">
	
		<input type="text" name="reference" placeholder="Reference"> <br>
		<input type="text" name="articlename" placeholder="Name"> <br>
		<input type="number" name="quantity" placeholder="Quantity"> <br>
		<input type="text" name="price" placeholder="Price"><br>
		<input type="submit" value="add article">
	
	</form>
	
	
	
	
	<form action="AddBill.jsp" class="addingForms" id="billform">
	
		<input type="number" name="billnumber" placeholder="Bill number"> <br>
		<input type="date" name="billingdate" placeholder="Date"> <br>
		<input type="checkbox" id="cash" name="cash" value="cash">
  		<label for="cash"> Cash</label><br>
  		<input type="checkbox" id="bank" name="bank" value="bank">
  		<label for="vehicle2"> Bank </label><br> <br>
  				
  		
  		<select id="list" name="list" onchange="getSelectedValue()">
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
			
  		</select>
  		<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Add article
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
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
		<td id="articleref"> <c:out value="${i.reference}"></c:out> 	</td>
		<td><c:out value="${i.articlename}"></c:out> </td>
		<td><c:out value="${i.quantity}"></c:out> </td>
		<td><c:out value="${i.price}"></c:out> </td>
		 <td><input type="number" min="1" id="<c:out value="${i.reference}"></c:out>"></td>
			<td><button onclick="articledetails('<c:out value="${i.reference}"></c:out>','<c:out value="${i.articlename}"></c:out>')">Add article</button></td>
	 </tr>
	
	</c:forEach> 
		
	
		
		
	
	</table> <br>
        <script>
        function articledetails  (ref,name){
        	var qnt = document.getElementById(ref).value;
        	var artref = document.getElementById("articleref").innerHTML;
        	document.getElementById("billform").innerHTML+="<input type='hidden' value='"+ ref+"+"+qnt+"' name ='idr' >";

        }
        
        
        </script>
      </div>
      
    </div>
  </div>
</div>
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
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
  		<button type="button" id="BillLineButton" onclick="showBillLineForm()">Bill Line</button> <br>
		
		<input type="number" name="quantity" placeholder="Quantity"> <br>
  		
		<input type="submit" value="add bill">
	
	</form> <br>
	
	


		
  		






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
</body>
</html>