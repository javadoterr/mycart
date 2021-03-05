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
	<h2>Creating connectin factory</h2>
	<%
		out.println(FactoryProvider.getFactory());
	%>
</body>
</html>