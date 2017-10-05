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
<link rel="icon" href="images/colorado-mountain-icon.png">

<title>Updating Menu Items</title>

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
					<p class="text-muted">We are a family owned cafe and have been
						a part of the community for over 10 years.</p>
				</div>
				<div class="col-sm-4 py-4">
					<h4 class="text-white">Contact</h4>
					<ul class="list-unstyled">
						<li><font color="white">Cafe Allegro</font></li>
						<li><font color="white">7400 E Orchard Rd</font></li>
						<li><font color="white">Greenwood Village, CO 80111</font></li>
						<br>
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
			<a href="GetNewItemView.do" class="navbar-brand">Add New Item</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarHeader" aria-controls="navbarHeader"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</div>

		<div class="container text-muted">
			<c:forEach var="item" items="${items}">
				<form class="update-form-top" action="UpdateMenuItem.do" method="POST">
					<div class="form-row">
						<div class="form-group col-md-9">
							<label for="inputName" class="col-form-label">Name</label> 
							<input type="text" class="form-control" id="inputName" name="name" value="${item.name}">
						</div>
						<div class="form-group col-md-3">
							<label for="inputLast" class="col-form-label">Price</label>
							<input type="text" class="form-control" id="inputLast" name="price" value="${item.price}">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-12">
							<label for="inputDesc" class="col-form-label">Description</label> 
							<input type="text" class="form-control" id="inputDesc" name="description" value="${item.description}">
						</div>
					</div>
					<input type="hidden" name="id" value="${item.id}">
					<button type="submit" name="submit" id="submit" class="btn btn-primary">Update</button>
				</form>
				
				<form action="RemoveItem.do" method="post">
					<input type="hidden" name="id" value="${item.id}">
					<button type="submit" name="submit" class="btn btn-danger">Delete</button>
				</form>
				<hr>

			</c:forEach>
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
