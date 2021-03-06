<%@page import="com.javadoterr.api.entity.User"%>
<%
	User user = (User) session.getAttribute("current-user");
	if(user == null){
		session.setAttribute("message", "You are not logged in !! Login first");
		response.sendRedirect("login.jsp");
		return;
	}else{
		
		if(user.getUserType().equals("normal")){
			session.setAttribute("message", "You are not Admin !! Do not access this page!");
			response.sendRedirect("login.jsp");
			return;
		}
		
	}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="./common_css_js.jsp" %>
<title>Admin Panel</title>
</head>
<body>

	<!-- navbar added  -->
	<%@ include file="./navbar.jsp" %>
	
	<div class="container">
		<div class="row mt-4">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle" alt="user_icon" src="./img/users.png">
						</div>
						<h2>2345</h2>
						<h2 class="text-uppercase">Users</h2>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle" alt="user_icon" src="./img/categories.png">
						</div>
						<h2>678</h2>
						<h2 class="text-uppercase">Categories</h2>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle" alt="user_icon" src="./img/products.png">
						</div>
						<h2>345</h2>
						<h2 class="text-uppercase">Products</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- second row -->
		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle" alt="user_icon" src="./img/add categories.png">
						</div>
						<p class="mt-2">Click here to add categories</p>
						<h2 class="text-uppercase">Add Categories</h2>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle" alt="user_icon" src="./img/add products.png">
						</div>
						<p class="mt-2">Click here to add new product</p>
						<h2 class="text-uppercase">Add Product</h2>
					</div>
				</div>
			</div>
		</div>
	
	</div>
	
	
			
	
	
	
	
	
	
	
	
	
	

</body>
</html>