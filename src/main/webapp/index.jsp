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
			
				String cat =  request.getParameter("category");
				
			
				ProductDao dao = new ProductDao(FactoryProvider.getFactory());
				List<Product> list = null;
				
				if(cat == null || cat.trim().equals("all")){
					list =  dao.getAllProducts();	
				}else{
					int cid = Integer.parseInt(cat.trim());
					list = dao.getAllProductsByCategoryId(cid);
				}
				
				
				
				
				CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
				List<Category> clist =  cDao.getCategories();
			%>
		
			<!-- show categories -->
			<div class="col-md-2">

				<div class="list-group">
					<a href="index.jsp?category=all" class="list-group-item list-group-item-action active"aria-current="true">
						All Products 
					</a>
					
					<%
						for(Category c: clist){
					%>
						<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
					<% 
						}
					%>
				</div>
			</div>
			<!-- show products -->
			<div class="col-md-10">
					<div class="container my-3">
					    <div class="row" data-masonry='{"percentPosition": true }'>
					    	<!-- traversion products -->
							<%
								for(Product p : list){
							%>
					        <div class="col-md-4 py-3">
					            <div class="card border-primary product-card">
					            	<div class="container text-center">
					            		<img src="img/products/<%= p.getpPhoto() %>" style="max-height: 100px; max-width: 100%; width: auto;" class="card-img-top" alt="...">
					            	</div>
					                <div class="card-body">
					                    <h3 class="card-title"><%= p.getpName() %></h3>
					                    <p class="card-text"><%= Helper.get10Words(p.getpDesc())%></p>
					                </div>
					                <div class="card-footer text-center">
										<button class="btn custom-bg text-white">Add to Cart</button>
										<button class="btn btn-outline-primary">
											&#x20B9;<%= p.getPriceAfterApplyingDiscount() %>/- 
											<span class="text-secondary discount-label"> 
												&#x20B9;<%= p.getpPrice() %> , <%= p.getpDiscount() %> off
											</span>
										</button>
									</div>
					            </div>
					        </div>
					        <% 
								}
								
								if(list.size() == 0) {
									out.println("<h3>No item in this category...</h3>");
								}
							%>
					    </div>
					</div>
				
				<%-- <div class="row mt-4" data-masonry='{"percentPosition": true }'>				
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
				</div> --%>
			</div>
		</div>		
	</div>




</body>
</html>