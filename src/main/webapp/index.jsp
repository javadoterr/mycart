<%@page import="com.javadoterr.api.helper.Helper"%>
<%@page import="com.javadoterr.api.entity.Category"%>
<%@page import="com.javadoterr.api.dao.CategoryDao"%>
<%@page import="com.javadoterr.api.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.javadoterr.api.dao.ProductDao"%>
<%@page import="com.javadoterr.api.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="./common_css_js.jsp" %>
<title>MyCart - Home</title>
</head>
<body>
	<!-- navbar added  -->
	<%@ include file="./navbar.jsp" %>
	
	<div class="container">
		<div class="row mt-3 mx-2">
		
			<%
				ProductDao dao = new ProductDao(FactoryProvider.getFactory());
				List<Product> list =  dao.getAllProducts();
				
				CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
				List<Category> clist =  cDao.getCategories();
			%>
		
			<!-- show categories -->
			<div class="col-md-2">

				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action active"aria-current="true">
						All Products 
					</a>
					
					<%
						for(Category c: clist){
					%>
						<a href="#" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
					<% 
						}
					%>
				</div>
			</div>
			<!-- show products -->
			<div class="col-md-8 ">
				<div class="row mt-4" data-masonry='{"percentPosition": true }'>				
					<div class="col-md-12">
						<div class="card-columns">
								<!-- traversion products -->
								<%
									for(Product p : list){
								%>
									<div class="card m-2">
										<img src="img/products/<%= p.getpPhoto() %>" style="max-height: 100px; max-width: 100px; width: auto;" class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title"><%= p.getpName() %></h5>
											<p class="card-text">
												<%= Helper.get10Words(p.getpDesc())%>
											</p>
										</div>
										<div class="card-footer">
											<button class="btn custom-bg text-white">Add to Cart</button>
											<button class="btn btn-outline-primary">&#x20B9;<%= p.getpPrice() %></button>
										</div>
									</div>
								
								<% 
									}
								%>
						</div>
					</div>					 
				</div>
			</div>
		</div>		
	</div>




</body>
</html>