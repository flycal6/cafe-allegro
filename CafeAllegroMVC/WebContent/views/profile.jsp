<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="images/colorado-mountain-icon.png">

<title>${user.firstName}${user.lastName} - Profile</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/profile.css" rel="stylesheet">

<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
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

	<div class="container text-muted">
			<c:if test="${empty user}">
				<div class="row">
					<h3>User not found</h3>
				</div>
			</c:if>
			<c:if test="${not empty user}">
				<form action="UpdateUser.do" method="POST">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputFirstName" class="col-form-label">First Name</label> 
							<input type="text" class="form-control" id="inputFirstName" name="firstName" value="${user.firstName}">
						</div>
						<div class="form-group col-md-6">
							<label for="inputLastName" class="col-form-label">Last Name</label> 
							<input type="text" class="form-control" id="inputLastName" name="lastName" value="${user.lastName}">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputUsername" class="col-form-label">Username</label>
							<input type="text" class="form-control" id="inputAddress" name="username" value="${user.username}">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4" class="col-form-label">Password</label>
							<input type="password" class="form-control" id="inputPassword4" name="password" value="${user.password}">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4" class="col-form-label">Email</label> 
							<input type="email" class="form-control" id="inputEmail4" name="email" value="${user.email}">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPhone" class="col-form-label">Phone Number</label> 
							<input type="number" class="form-control" id="inputPhone" name="phoneNumber" value="${user.phoneNumber}"> 
							<input type="hidden" name="id" value="${user.id}">
						</div>
					</div>
					<button type="submit" name="submit" id="submit" class="btn btn-primary">Update Profile</button>
					<c:if test="${user.userRole.permission == 'admin'}">
						<a href="UpdateMenuItemsView.do" class="btn btn-secondary">Update Menu Items</a>
					</c:if>
				</form>
			</c:if>
		</div>
		<br>
		<div class="container text-muted">
		<hr>
		<div>
		<h4>$${totalSpent} total spent</h4></div>
			<div >
				<h4>You have ${userRewards} Reward Points.</h4>
			</div>
			
			<div>
				<h4>Order History</h4>
				<c:forEach var="order" items="${user.orders}">
				<h6>${order.time}</h6>
					<ul>
						<c:forEach var="item" items="${order.menuItems}">
							<li>${item.name} $${item.price} - ${item.description}</li>
						</c:forEach>
					</ul>
					<hr>
				</c:forEach>
			</div>
		</div>

	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
				<a href="#">Back to top</a>
			</p>
			<p>Album example is &copy; Bootstrap, but please download and
				customize it for yourself!</p>
			<p>
				New to Bootstrap? <a href="../../">Visit the homepage</a> or read
				our <a href="../../getting-started/">getting started guide</a>.
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
