<%@page import="java.util.Map"%>
<%@page import="com.javadoterr.api.helper.Helper"%>
<%@page import="com.javadoterr.api.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.javadoterr.api.helper.FactoryProvider"%>
<%@page import="com.javadoterr.api.dao.CategoryDao"%>
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
<!-- list of Category  -->
<%
	CategoryDao categoryDao = new  CategoryDao(FactoryProvider.getFactory());
	List<Category> list =  categoryDao.getCategories();
	
	//getting product and user count
	 Map<String, Long> m =  Helper.getCounts(FactoryProvider.getFactory());
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
						<h2><%= m.get("userCount") %></h2>
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
						<h2><%= list.size() %></h2>
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
						<h2><%= m.get("productCount") %></h2>
						<h2 class="text-uppercase">Products</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- second row -->
		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
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
				<div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
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
	<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	<!-- ----------------------------------------- -->
	<!-- start of  add product model -->
		<!-- Modal -->
		<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      
		        <!-- start form -->
		        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
		        
		        	<input type="hidden" name="operation" value="addProduct">
		        
		        	<!-- product title  -->
		        	<div class="form-group mb-2">
		        		<input type="text" class="form-control" placeholder="Enter title of product" name="pName" required="required"/>
		        	</div>
		        	<!-- product description -->
		        	<div class="form-group mb-2">
		        		<textarea rows="3" cols="" class="form-control" placeholder="enter product description" name="pDesc"></textarea>
		        	</div>
		        	
		        	<!-- product price -->
		        	<div class="form-group mb-2">
		        		<input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required="required"/>
		        	</div>
		        	
		        	<!-- product discount -->
		        	<div class="form-group mb-2">
		        		<input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required="required"/>
		        	</div>
		        	
		        	<!-- product quantity -->
		        	<div class="form-group mb-2">
		        		<input type="number" class="form-control" placeholder="Enter product qnantity" name="pQuantity" required="required"/>
		        	</div>
		        	
		        	<!-- product categories  -->
		        	
		        	
		        	<div class="form-group mb-2 ">
		        		<select name="catId" class="form-control" id="">
		        			
		        			<%
		        				for(Category c: list) {
		        			
		        			%>		
		        			<option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
		        			<%
		        				}
		        			%>
		        		</select>
		        	</div>
		        	
		        	<!-- product file -->
		        	<div class="form-group mb-2">
		        		<label for="pPhoto" class="form-label">Select Product Photo</label>
		        		<input type="file" class="form-control" id="pPhoto" name="pPhoto" required="required">
		        	</div>
		        	
		        	<!-- Submit button -->
		        	<div class="container text-center">
		        		<button type="submit" class="btn btn-outline-success">Add Product</button>
		        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        	</div>
		        	
		        </form> 
		        <!-- end form -->
		      </div>
		      <div class="modal-footer">
		        
		      </div>
		    </div>
		  </div>
		</div>
	<!-- end of  add product model -->
	
	
	
	<!-- cart model added -->
	<%@ include file="./common-modal.jsp" %>
	
	
	
	
	
	

</body>
</html>