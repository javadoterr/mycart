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

</body>
</html>