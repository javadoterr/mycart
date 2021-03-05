<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="./common_css_js.jsp" %>
<title>New User</title>
</head>
<body>
	<!-- navbar added  -->
	<%@ include file="./navbar.jsp" %>
	<div class="container-fluid">
		<div class="row mt-4">
		<div class="col-md-4 offset-md-4">
		
			<div class="card">
				<!-- displaying message -->
				<%@ include file="./message.jsp" %>
				<div class="card-body">
					<h3 class="text-center my-3">Sign Up Here !!</h3>
						<form action="RegisterServlet">
							<div class="">
			    				<label for="name" class="form-label">User Name</label>
			    				<input type="text" class="form-control" id="name" name="userName" placeholder="Enter your name" aria-describedby="nameHelp">
			  				</div>
			  				<div class="">
			    				<label for="email" class="form-label">User Email</label>
			    				<input type="email" class="form-control" id="email" name="userEmail" placeholder="Enter your email" aria-describedby="nameHelp">
			  				</div>
			  				<div class="">
			    				<label for="password" class="form-label">User Password</label>
			    				<input type="password" class="form-control" id="password" name="userPassword" placeholder="Enter your pass" aria-describedby="nameHelp">
			  				</div>
			  				<div class="">
			    				<label for="phone" class="form-label">User Phone</label>
			    				<input type="number" class="form-control" id="phone" name="userPhone" placeholder="Enter your phone" aria-describedby="nameHelp">
			  				</div>
			  				<div class="">
			    				<label for="address" class="form-label">User Address</label>
			    				<textarea class="form-control" placeholder="Enter your address" id="address" name="userAddress" rows="3" cols=""></textarea>
			  				</div>
			  				<div class=" mt-2 text-center">
			  					<button type="submit" class="btn btn-outline-success">Register</button>
			  					<button type="submit" class="btn btn-outline-warning">Reset</button>
			  				</div>
						</form>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>