<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="./common_css_js.jsp" %>
<title>User Login - MyCart</title>
</head>
<body>
	<!-- navbar added  -->
	<%@ include file="./navbar.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-header custom-bg text-white text-center">
						<h3>Login here</h3>
					</div>
					<div class="card-body">
					
						<%@ include file="./message.jsp" %>
						<form action="LoginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email address</label> 
								<input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" name="password" class="form-control" id="exampleInputPassword1">
							</div>
							<a href="register.jsp">if not register! Click Here</a>
							<div class="mb-3 text-center mt-2">
								<button type="submit" class="btn btn-primary border-0 custom-bg">Submit</button>
								<button type="reset" class="btn btn-primary border-0 custom-bg">Reset</button>
							</div>
						</form>
					</div>
					<div class="card-footer custom-bg"></div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>