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
				<h1><%= clist.size() %></h1>
				<%
					for(Category c: clist){
						out.println(c.getCategoryTitle()+"<br>");
					}
				%>
			</div>
			<!-- show products -->
			<div class="col-md-8">
				
				<h1>Number of Products is <%= list.size() %></h1>
				<%
					for(Product product : list){
						out.println(product.getpPhoto()+"<br>");
						out.println(product.getpName()+"<br><br>");
					}				
				%>
			
			</div>
		</div>		
	</div>




</body>
</html>