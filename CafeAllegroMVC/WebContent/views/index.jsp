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
					<p class="text-muted">We are a family owned cafe and have been a part of the community for over 10 years.</p>
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

	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">Cafe Allegro</h1>
			<p class="lead text-muted">Welcome to our site. Our food is ALWAYS freshly made to order and delivered with a smile. Please order below and we hope to see you soon!</p>

			<p>
				<c:if test="${not empty user.username}">
					<c:if test="${cart.quantity > 0}">
						<a href="showCart.do" class="btn btn-secondary">${cart.quantity}
							items in cart</a>
					</c:if>
					<a href="ViewProfile.do" class="btn btn-primary">Order History</a>
				</c:if>
				<c:if test="${empty user.username}">
					<a href="Login.do" class="btn btn-secondary">Login</a>
				</c:if>
			</p>
		</div>
	</section>


	<%-- <c:if test="${cart.quantity == 0}"><button class="btn btn-secondary">Empty cart</button></c:if> --%>


	<div class="container">
		<h2>Menu</h2>
	</div>

	<div class="album text-muted">
		<div class="container">
			<div class="row">
				<div class="card">
					<div class="crop">
						<img class="img-fluid" src="images/Breakfast.png"
							alt="Card image cap">
					</div>
					<p class="card-text">
						<b> Breakfast is served 8am - 11am </b> <br> Choice of Meat:
						Ham, Sausage, or Bacon
					</p>

					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown"> Breakfast <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<c:forEach var="item" items="${items}">
								<c:if test="${item.category == 'Breakfast'}">
									<!-- <form action="addToCart.do" method="POST"> -->
									<form action="SendItemToCart.do" method="POST">
										<ul>
											<li>${item.name}</li>
											<li>$${item.price}</li>
											<li>${item.description}</li>
										</ul>
										<input type="hidden" name="name" value="${item.name}">
										<input type="hidden" name="price" value="${item.price}">
										<input type="hidden" name="description"
											value="${item.description}"> <input id="buyButton"
											class="btn btn-secondary" type="submit" name="submit"
											value="Add to Cart">
									</form>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<%-- 	
					
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Breakfast'}">
							<!-- <form action="addToCart.do" method="POST"> -->
							<form action="SendItemToCart.do" method="POST">
								<ul>
									<li>${item.name}</li>
									<li>$${item.price}</li>
									<li>${item.description}</li>
								</ul>
								<input type="hidden" name="name" value="${item.name}">
								<input type="hidden" name="price" value="${item.price}">
								<input type="hidden" name="description" value="${item.description}">
								
								<input  id="buyButton" class="btn btn-secondary" type="submit" name="submit" value="Add to Cart">
							</form>
						</c:if>
					</c:forEach> --%>

				</div>

				<!-- <script>
				function change()
					{
					    document.getElementById("buyButton").value="Remove From Cart";
					    /* document.getElementById("buyButton").style.display="none"; */
					}
				</script> -->

				<div class="card">
					<div class="crop">
						<img class="img-fluid" src="images/sandwich.png"
							alt="Card image cap">
					</div>
					<p class="card-text">
						<b> House Special Sandwiches </b><br> Choice of bread with
						chips (1 oz.)
					</p>
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Sandwich'}">
							<!-- <form action="addToCart.do" method="POST"> -->
							<form action="SendItemToCart.do" method="POST">
								<ul>
									<li>${item.name}</li>
									<li>$${item.price}</li>
									<li>${item.description}</li>
								</ul>
								<input type="hidden" name="name" value="${item.name}"> <input
									type="hidden" name="price" value="${item.price}"> <input
									type="hidden" name="description" value="${item.description}">

								<input id="buyButton" class="btn btn-secondary" type="submit"
									name="submit" value="Add to Cart">
							</form>
						</c:if>
					</c:forEach>

				</div>

				<div class="card">
					<div class="crop">
						<img class="img-fluid" src="images/wrap.png" alt="Card image cap">
					</div>
					<p class="card-text">
						<b>Wraps</b>
					</p>
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Wrap'}">
							<!-- <form action="addToCart.do" method="POST"> -->
							<form action="SendItemToCart.do" method="POST">
								<ul>
									<li>${item.name}</li>
									<li>$${item.price}</li>
									<li>${item.description}</li>
								</ul>
								<input type="hidden" name="name" value="${item.name}"> <input
									type="hidden" name="price" value="${item.price}"> <input
									type="hidden" name="description" value="${item.description}">

								<input id="buyButton" class="btn btn-secondary" type="submit"
									name="submit" value="Add to Cart">
							</form>
						</c:if>
					</c:forEach>

				</div>

				<div class="card">
					<div class="crop">
						<img class="img-fluid" src="images/HotSub.png"
							alt="Card image cap">
					</div>
					<p class="card-text">
						<b>Hot Subs</b>
					</p>
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Hot Subs'}">
							<!-- <form action="addToCart.do" method="POST"> -->
							<form action="SendItemToCart.do" method="POST">
								<ul>
									<li>${item.name}</li>
									<li>$${item.price}</li>
									<li>${item.description}</li>
								</ul>
								<input type="hidden" name="name" value="${item.name}"> <input
									type="hidden" name="price" value="${item.price}"> <input
									type="hidden" name="description" value="${item.description}">

								<input id="buyButton" class="btn btn-secondary" type="submit"
									name="submit" value="Add to Cart">
							</form>
						</c:if>
					</c:forEach>

				</div>

				<div class="card">
					<div class="crop">
						<img class="img-fluid" src="images/Taco.png" alt="Card image cap">
					</div>
					<p class="card-text">
						<b>Mexican Food</b>
					</p>
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Mexican'}">
							<!-- <form action="addToCart.do" method="POST"> -->
							<form action="SendItemToCart.do" method="POST">
								<ul>
									<li>${item.name}</li>
									<li>$${item.price}</li>
									<li>${item.description}</li>
								</ul>
								<input type="hidden" name="name" value="${item.name}"> <input
									type="hidden" name="price" value="${item.price}"> <input
									type="hidden" name="description" value="${item.description}">

								<input id="buyButton" class="btn btn-secondary" type="submit"
									name="submit" value="Add to Cart">
							</form>
						</c:if>
					</c:forEach>

				</div>

				<div class="card">
					<div class="crop">
						<img class="img-fluid" src="images/riceBowl.png"
							alt="Card image cap">
					</div>
					<p class="card-text">
						<b>Rice Bowls</b>
					</p>
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Rice Bowl'}">
							<!-- <form action="addToCart.do" method="POST"> -->
							<form action="SendItemToCart.do" method="POST">
								<ul>
									<li>${item.name}</li>
									<li>$${item.price}</li>
									<li>${item.description}</li>
								</ul>
								<input type="hidden" name="name" value="${item.name}"> <input
									type="hidden" name="price" value="${item.price}"> <input
									type="hidden" name="description" value="${item.description}">

								<input id="buyButton" class="btn btn-secondary" type="submit"
									name="submit" value="Add to Cart">
							</form>
						</c:if>
					</c:forEach>

				</div>

				<div class="card">
					<div class="crop">
						<img class="img-fluid" src="images/salad.png" alt="Card image cap">
					</div>
					<p class="card-text">
						<b>Salad</b>
					</p>
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Salad'}">
							<!-- <form action="addToCart.do" method="POST"> -->
							<form action="SendItemToCart.do" method="POST">
								<ul>
									<li>${item.name}</li>
									<li>$${item.price}</li>
									<li>${item.description}</li>
								</ul>
								<input type="hidden" name="name" value="${item.name}"> <input
									type="hidden" name="price" value="${item.price}"> <input
									type="hidden" name="description" value="${item.description}">

								<input id="buyButton" class="btn btn-secondary" type="submit"
									name="submit" value="Add to Cart">
							</form>
						</c:if>
					</c:forEach>

				</div>

				<div class="card">
					<div class="crop">
						<img class="img-fluid" src="images/burger.png"
							alt="Card image cap">
					</div>
					<p class="card-text">
						<b>Burgers</b>
					</p>
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Burgers'}">
							<!-- <form action="addToCart.do" method="POST"> -->
							<form action="SendItemToCart.do" method="POST">
								<ul>
									<li>${item.name}</li>
									<li>$${item.price}</li>
									<li>${item.description}</li>
								</ul>
								<input type="hidden" name="name" value="${item.name}"> <input
									type="hidden" name="price" value="${item.price}"> <input
									type="hidden" name="description" value="${item.description}">

								<input id="buyButton" class="btn btn-secondary" type="submit"
									name="submit" value="Add to Cart">
							</form>
						</c:if>
					</c:forEach>

				</div>

				<div class="card">
					<div class="crop">
						<img class="img-fluid" src="images/soup.png" alt="Card image cap">
					</div>
					<p class="card-text">
						<b>Soups</b>
					</p>
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Soups'}">
							<!-- <form action="addToCart.do" method="POST"> -->
							<form action="SendItemToCart.do" method="POST">
								<ul>
									<li>${item.name}</li>
									<li>$${item.price}</li>
									<li>${item.description}</li>
								</ul>
								<input type="hidden" name="name" value="${item.name}"> <input
									type="hidden" name="price" value="${item.price}"> <input
									type="hidden" name="description" value="${item.description}">

								<input id="buyButton" class="btn btn-secondary" type="submit"
									name="submit" value="Add to Cart">
							</form>
						</c:if>
					</c:forEach>

				</div>

				<div class="card">
					<div class="crop">
						<img class="img-fluid" src="images/Drinks.jpeg"
							alt="Card image cap">
					</div>
					<p class="card-text">
						<b>Drinks</b>
					</p>
					<c:forEach var="item" items="${items}">
						<c:if test="${item.category == 'Drinks'}">
							<!-- <form action="addToCart.do" method="POST"> -->
							<form action="SendItemToCart.do" method="POST">
								<ul>
									<li>${item.name}</li>
									<li>$${item.price}</li>
									<li>${item.description}</li>
								</ul>
								<input type="hidden" name="name" value="${item.name}"> <input
									type="hidden" name="price" value="${item.price}"> <input
									type="hidden" name="description" value="${item.description}">

								<input id="buyButton" class="btn btn-secondary" type="submit"
									name="submit" value="Add to Cart">
							</form>
						</c:if>
					</c:forEach>

				</div>

			</div>
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
