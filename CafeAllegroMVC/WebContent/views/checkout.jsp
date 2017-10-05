<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="images/colorado-mountain-icon.png">

<title>Confirmation Page</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/checkout.css" rel="stylesheet">

<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">

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
			<a href="Cafe.do" class="navbar-brand"><img class="img-fluid"
				id="nav-brand" src="images/colorado-mountain-icon.png"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarHeader" aria-controls="navbarHeader"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</div>
	<br>
	<br>
	<div class="container" id="mainspot">
		<div>
			<h1>Order Confirmation</h1>
			<hr>
		</div>

		<div>
			<p class="lead">${order.time}</p>
		</div>
		
		<div>
			<h3>Thank You! <span class="lead">Your Order Is Being Processed.</span></h3>
		</div>
		
		<div>
			<c:forEach var="userOrder" items="${order.menuItems}">
				<p>${userOrder.name}</p>
				<p>${userOrder.description}</p>
			<hr>
			</c:forEach>
		</div>

		<div>
			<h3>Total Due:</h3>
			<h4>$${orderAfterTax}</h4>
	
			<p>Pick up in 15 min please.</p>
		</div>
	<br>
	<hr>
	<div>
			<form action="Cafe.do">
				<button id="buyButton" class="btn btn-primary" type="submit" value="Back to Homepage">
					Back to Home Page</button>
			</form>
		</div>
	</div>

<footer class="text-muted">
	<div class="container">
		<p class="float-right">
			<a href="#">Back to top</a>
		</p>
	</div>
</footer>



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