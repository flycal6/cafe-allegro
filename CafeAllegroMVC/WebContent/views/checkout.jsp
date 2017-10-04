<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="images/colorado-mountain-icon.png">

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/checkout.css" rel="stylesheet">

<title>Confirmation Page</title>
</head>

<body>
	<div class="collapse bg-dark" id="navbarHeader">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 py-4">
					<h4 class="text-white">About</h4>
					<p class="text-muted">Add some information about the album
						below, the author, or any other background context. Make it a few
						sentences long so folks can pick up some informative tidbits.
						Then, link them off to some social networking sites or contact
						information.</p>
				</div>
				<div class="col-sm-4 py-4">
					<h4 class="text-white">Contact</h4>
					<ul class="list-unstyled">
						<li><a href="#" class="text-white">Follow on Twitter</a></li>
						<li><a href="#" class="text-white">Like on Facebook</a></li>
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

	<div class="container wrapper">
		<div class="row cart-head">
			<div class="container">
			
				<div class="row">
					<h2></h2>
				</div>
				<div class="row">
					<h2></h2>
				</div>
				
				<div class="row">
					<h2>Confirmation Page</h2>
				</div>

				<div class="row">
					<p>${order.time}</p>
				</div>
				
				<div class="row">
					<h3>Thank You!</h3>
				</div>
				<div class="row">
					<h3>Your Order Is Being Processed.</h3>
				</div>

				<div class="row">
					<p></p>
				</div>
			</div>
		</div>
		<!-- end of container wrapper -->


		<!-- 	<div class="row cart-body">
			<form class="form-horizontal" method="post" action="">
		</div> -->


		<c:forEach var="userOrder" items="${order.menuItems}">
			<div class="panel-body">
				<div class="form-group">
					<!-- <div class="col-sm-3 col-xs-3">
						<img class="img-responsive" src="images/cafe.png">
					</div> -->
					<div class="col-sm-6 col-xs-6">
						<div class="col-xs-12">${userOrder.name}</div>
						<div class="col-xs-12">${userOrder.description}</div>
					</div>
					<hr>
		</c:forEach>
		<div class="row">
			<p></p>
		</div>

		<h3>Total Paid:</h3>
		<div class="col-sm-3 col-xs-3 text-right">
			<h4>
				<span>$</span>${orderAfterTax}
			</h4>
		</div>
	</div>

	<!-- 
		<div class="form-group">
			<hr />
		</div> -->
	<%-- <div class="form-group">
			<div class="col-xs-12">
				<strong>Order Total</strong>
				<div class="pull-right">
					<span>$</span><span>${orderAfterTax}</span>
				</div>
			</div>
		</div> --%>
	<!--REVIEW ORDER END-->
	<!-- 	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
		<div class="form-group"> -->

	<div class="row">
		<p></p>
	</div>

	
		<form action="Cafe.do">
			<input id="buyButton" class="btn btn-primary" type="submit" value="Back to Homepage">
		</form>


	<div class="row cart-footer"></div>



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