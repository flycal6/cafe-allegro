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

<title>Cart</title>
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
			<a href="Cafe.do" class="navbar-brand"><img class="img-fluid" id="nav-brand" src="images/colorado-mountain-icon.png"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarHeader" aria-controls="navbarHeader"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</div>
	<div class="container">

		<h1><b>Shopping Cart</b></h1>
		<hr>
		<table class="table table-striped table-hover table-bordered">
			
			    <tr>

					<c:forEach var="cart" items="${cart.itemsInCart}">
						<td>${cart.name}</td><td>${cart.price}</td>
					</c:forEach>
				</tr>
				<tr>
					<th colspan="3"><span class="pull-right">Sub Total</span></th>
					<th>${cartBeforeTax}</th>
				</tr>
				<tr>
				
				<tr>
					<th colspan="3"><span class="pull-right">Tax 20%</span></th>
					<th>${cartTax}</th>
				</tr>
				<tr>
					<th colspan="3"><span class="pull-right">Total</span></th>
					<th>${orderAfterTax}</th>
				</tr>
				<tr>
					<th>You have ${userRewards} Reward Points.</th>
					<c:if test="${userRewards > 9}">
					<th><a href="RedeemPoints.do" class="btn btn-success" type="submit">Redeem Points Now</a></th>
					</c:if>
				</tr>
				<tr>
		
					<form action="Cafe.do" method="GET">
					<button class="btn btn-lg btn-primary btn-block" type="submit">Add More Food</button>
					</form>
					<form action="finalizeOrder.do" method="POST">
					<button class="btn btn-lg btn-primary btn-block" type="submit">Checkout</button>
					</form>			
				</tr>
			</tbody>
		</table>

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