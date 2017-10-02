<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../../../favicon.ico">

<title>${user.firstName} ${user.lastName} - Profile</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/profile.css" rel="stylesheet">
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
						<li><a href="#" class="text-white">Email me</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="navbar navbar-dark bg-dark">
		<div class="container d-flex justify-content-between">
			<a href="Cafe.do" class="navbar-brand">Home</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarHeader" aria-controls="navbarHeader"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</div>

	<div class="album text-muted">
		<div class="container">

			<div class="row">
				<form action="UpdateMenuItems.do" method="POST">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputFirstName" class="col-form-label">Name</label> 
							<input type="text" class="form-control" id="inputFirstName" name="firstName" value="${item.name}">
						</div>
						<div class="form-group col-md-6">
							<label for="inputLastName" class="col-form-label">Price</label>
							<input type="text" class="form-control" id="inputLastName" name="lastName" value="${item.price}">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputUsername" class="col-form-label">Description</label> 
							<input type="text" class="form-control" id="inputAddress" name="username" value="${item.description}">
						</div>
					</div>
					
					
					<button type="submit" name="submit" id="submit" class="btn btn-primary">Finish Updating and Return Home</button>
				</form>
			</div>
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
	<script src="js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
</body>
</html>
