<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="images/colorado-mountain-icon.png">

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="css/cart.css">

<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">

<title>Cart</title>
</head>
<body>
<div class="collapse bg-dark" id="navbarHeader">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 py-4">
					<h4 class="text-white">About</h4>
					<p class="text-muted">We are a family owned cafe and have been
						a part of the community for over 10 years.</p>
				</div>
				<div class="col-sm-4 py-4">
					<h4 class="text-white">Contact</h4>
					<ul class="list-unstyled">
						<li><font color="white">Cafe Allegro</font></li>
						<li><font color="white">7400 E Orchard Rd</font></li>
						<li><font color="white">Greenwood Village, CO 80111</font></li>
						<c:if test="${not empty user.username}">
							<li><a href="Logout.do" class="text-white">Logout</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="navbar navbar-dark bg-dark">
		<div class="container d-flex justify-content-between">
			<a href="Cafe.do" class="navbar-brand"><img class="img-fluid" id="nav-brand" src="images/colorado-mountain-icon.png"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarHeader" aria-controls="navbarHeader"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</div>
	<div class="container">
		<div class="row">
		<h1><b>Shopping Cart</b></h1>
		</div>
		<hr>
		<ul class="list-group">
			<c:forEach var="cart" items="${cart.itemsInCart}">
				<li class="list-group-item list-group-item-primary">${cart.name}<span class="float-sm-right">$${cart.price}</span></li>
			</c:forEach>
		  
		  <li class="list-group-item list-group-item-primary">Sub Total: <span class="float-sm-right">$${cartBeforeTax}</span></li>
		  <li class="list-group-item list-group-item-secondary">Tax 7% <span class="float-sm-right">${cartTax}</span></li>
		  <li class="list-group-item list-group-item-info">Total <span class="float-sm-right">${orderAfterTax}</span></li>
		  <li class="list-group-item list-group-item-light">You have ${userRewards} Reward Points.
		  <c:if test="${userRewards > 9}"><span class="float-sm-right">
				<a href="RedeemPoints.do" class="btn btn-secondary" type="submit">Redeem Points Now</a></span>
			</c:if></li>
		  <!-- <li class="list-group-item list-group-item-dark"></li> -->
		  <li class="list-group-item list-group-item-light"><form action="Cafe.do" method="GET">
		<button class="btn btn-secondary btn-block" type="submit">Add More Food</button>
		</form>
		<form action="finalizeOrder.do" method="POST">
		<button class="btn btn-primary btn-block" type="submit">Confirm Order</button>
		</form></li>
		</ul>
		
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document.write('<script src="js/jquery.min.js"><\/script>')
	</script>

	<script src="js/holder.js"></script>
	<script src="js/popper.min.js"></script>
	
	<script src="js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie-viewport-workaround.js"></script>
</body>
</html>