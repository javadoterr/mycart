<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="./common_css_js.jsp" %>
<title>checkout</title>
</head>
<body>

	<!-- navbar added  -->
	<%@ include file="./navbar.jsp" %>
	
	
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- cart body -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center my-3">Your Selected Items :</h3>
						<div class="cart-body">
				
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<!-- form details -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center my-3">Your details for order</h3>
						<form action="#">
							<div class="form-group">
								<label for="email">Email :</label>
								<input type="email" class="form-control" id="email" name="email" placeholder="enter your email">
							</div>
							<div class="form-group">
								<label for="name">Name :</label>
								<input type="text" class="form-control" id="name" name="name" placeholder="enter your name">
							</div>
							<div class="form-group">
								<label for="address">Address :</label>
								<textarea class="form-control" id="address" name="address" placeholder="enter shipping address" rows="3" cols=""></textarea>
							</div>
							<div class="container mt-2 text-center">
								<button class="btn btn-outline-success">Order Now</button>
								<button class="btn btn-outline-primary">Continue Shopping</button>
							</div>
						</form>						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- cart model added -->
	<%@ include file="./common-modal.jsp" %>
</body>
</html>