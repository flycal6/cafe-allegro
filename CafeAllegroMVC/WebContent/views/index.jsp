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

<title>Cafe Allegro</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/home.css" rel="stylesheet">
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
			<c:if test="${not empty user.username}">
				<a href="ViewProfile.do" class="navbar-brand"> ${user.username} </a>
			</c:if>
			<c:if test="${empty user.username}">
				<a href="Login.do" class="navbar-brand">Login</a>
			</c:if>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarHeader" aria-controls="navbarHeader"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</div>

	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">Cafe Allegro</h1>
			<p class="lead text-muted">Something short and leading about the
				collection below—its contents, the creator, etc. Make it short and
				sweet, but not too short so folks don't simply skip over it
				entirely.</p>
			<p>
				<a href="#" class="btn btn-primary">Main call to action</a> <a
					href="#" class="btn btn-secondary">Secondary action</a>
			</p>
		</div>
	</section>
	
	<div class="album text-muted">
		<div class="container">
			<div class="row">

				<div class="card">
					<img class="img-fluid" src="images/Breakfast.png"
						alt="Card image cap">
					<p class="card-text">
						Breakfast is served 8am - 11am<br> Choice of Meat: Ham,
						Sausage, or Bacon
					</p>
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Breakfast'}">
							<%-- <form action="cart.do?itemId=${item.id}" method="GET">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-secondary"> <input
										type="submit" value="${item.name}"> 
									</label>
								</div>
								<input type="submit" value="test"/>
							</form> --%>
							<form action="cart.do" method="POST">
								<input type="hidden" name="itemId" value="${item.id}">
								<input type="submit" value="test">
							</form>
						</c:if>
					</c:forEach>
				</div>


				<div class="card">
					<img class="img-fluid" src="images/sandwich.png"
						alt="Card image cap">
					<p class="card-text">
						House Special Sandwiches<br> Choice of bread with chips (1
						oz.)
					</p>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
					<br>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
				</div>
				<div class="card">
					<img class="img-fluid" src="images/wrap.png" alt="Card image cap">
					<p class="card-text">Wraps</p>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
					<br>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
				</div>
				<div class="card">
					<img class="img-fluid" src="images/HotSub.png" alt="Card image cap">
					<p class="card-text">Hot Subs</p>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
					<br>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
				</div>
				<div class="card">
					<img class="img-fluid" src="images/Taco.png" alt="Card image cap">
					<p class="card-text">Mexican Food</p>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
					<br>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
				</div>
				<div class="card">
					<img class="img-fluid" src="images/riceBowl.png"
						alt="Card image cap">
					<p class="card-text">Rice Bowls</p>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
					<br>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
				</div>
				<div class="card">
					<img class="img-fluid" src="images/salad.png" alt="Card image cap">
					<p class="card-text">Salad</p>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
					<br>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
				</div>
				<div class="card">
					<img class="img-fluid" src="images/burger.png" alt="Card image cap">
					<p class="card-text">Burgers</p>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
					<br>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
				</div>
				<div class="card">
					<img class="img-fluid" src="images/soup.png" alt="Card image cap">
					<p class="card-text">Soups</p>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
					<br>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
				</div>
				<div class="card">
					<img class="img-fluid" src="images/drinks.png" alt="Card image cap">
					<p class="card-text">Drinks</p>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
					<br>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 1
						</label> <label class="btn btn-secondary"> <input type="checkbox"
							autocomplete="off"> Checkbox 2
						</label>
					</div>
				</div>

			</div>
		</div>
	</div>
	
<a href="views/cart.jsp">Cart</a>
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
	<script>
		$(function() {
			Holder.addTheme("thumb", {
				background : "#55595c",
				foreground : "#eceeef",
				text : "Thumbnail"
			});
		});
	</script>
	<script src="js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script>
		$().button('toggle')
	</script>
</body>
</html>
