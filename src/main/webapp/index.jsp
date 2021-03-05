<%@page import="com.javadoterr.api.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
</head>
<body>
	<h2>Session Factory Object</h2>
	<%
		out.println(FactoryProvider.getFactory());
	
	%>
</body>
</html>