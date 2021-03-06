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
	
	<div class="container admin">
	
		<div class="container-fluid mt-3">
			<%@ include file="./message.jsp" %>
		</div>
	
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
				<div class="card" data-bs-toggle="modal" data-bs-target="#add-category-model">
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
	
	<!-- add category model -->
	<!-- Modal -->
	<div class="modal fade" id="add-category-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog model-lg">
	    <div class="modal-content">
	      <div class="modal-header custom-bg text-white">
	        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details </h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="ProductOperationServlet" method="post" >
	        
	        	<input type="hidden" name="operation" value="addCategory" />
	        
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required="required"/>
	        	</div>
	        	<div class="form-group mdt-2">
	        		<textarea class="form-control" rows="5" cols="" placeholder="Enter Category Description" name="catDescription" required="required"></textarea>
	        	</div>
	        	<div class="container mt-2 text-center">
	        		<button type="submit" class="btn btn-outline-success">Add Category</button>
	        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        	</div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- end of  add category model -->
			
	
	
	
	
	
	
	
	
	
	

</body>
</html>