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

<title>Cafe Allegro</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/home.css" rel="stylesheet">

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
					<h4 class="text-white">Contact</h4><br>
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
			<p class="lead text-muted">Welcome to our site. Our food is
				ALWAYS freshly made and delivered with a smile. Please
				order below and we hope to see you soon!</p>

			<p>
				<c:if test="${not empty user.username}">
					<c:if test="${cart.quantity > 0}">
						<a href="showCart.do" class="btn btn-secondary">${cart.quantity}
							Items in Cart</a>
					</c:if>
					<a href="ViewProfile.do" class="btn btn-primary">Order History</a>
				</c:if>
				<c:if test="${empty user.username}">
					<a href="Login.do" class="btn btn-secondary">Login to Order</a>
				</c:if>
			</p>
		</div>
	</section>


	<%-- <c:if test="${cart.quantity == 0}"><button class="btn btn-secondary">Empty cart</button></c:if> --%>


	<div class="album text-muted">
<div class="container">

<div class="row">
				<div class="card">
  <div class="col-md-4">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">
      <img class="img-fluid list-header-images" src="images/Breakfast.png" alt="Card image cap"> Breakfast</a>
      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">
      <img class="img-fluid list-header-images" src="images/burger.png" alt="Card image cap"> Burgers</a>
      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">
      <img class="img-fluid list-header-images" src="images/HotSub.png" alt="Card image cap"> Hot Subs</a>
      <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">
      <img class="img-fluid list-header-images" src="images/sandwich.png" alt="Card image cap"> Sandwiches</a>
      
      <a class="list-group-item list-group-item-action" id="list-salad-list" data-toggle="list" href="#list-salad" role="tab" aria-controls="home">
      <img class="img-fluid list-header-images" src="images/salad.png" alt="Card image cap"> Salads</a>
      <a class="list-group-item list-group-item-action" id="list-wrap-list" data-toggle="list" href="#list-wrap" role="tab" aria-controls="profile">
      <img class="img-fluid list-header-images" src="images/wrap.png" alt="Card image cap"> Wraps</a>
      <a class="list-group-item list-group-item-action" id="list-mexican-list" data-toggle="list" href="#list-mexican" role="tab" aria-controls="messages">
      <img class="img-fluid list-header-images" src="images/Taco.png" alt="Card image cap"> Mexican</a>
      <a class="list-group-item list-group-item-action" id="list-rice-list" data-toggle="list" href="#list-rice" role="tab" aria-controls="settings">
      <img class="img-fluid list-header-images" src="images/riceBowl.png" alt="Card image cap"> Rice Bowls</a>
      <a class="list-group-item list-group-item-action" id="list-soup-list" data-toggle="list" href="#list-soup" role="tab" aria-controls="settings">
      <img class="img-fluid list-header-images" src="images/soup.png" alt="Card image cap"> Soups</a>
      <a class="list-group-item list-group-item-action" id="list-drink-list" data-toggle="list" href="#list-drink" role="tab" aria-controls="settings">
      <img class="img-fluid list-header-images" src="images/Drinks.jpeg" alt="Card image cap"> Drinks</a>
    </div>
  </div>
  <div class="col-md-8">
    <div class="tab-content" id="nav-tabContent">

      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
      <c:forEach var="item" items="${items}">
			<c:if test="${item.category == 'Breakfast'}">
				<form action="SendItemToCart.do" method="POST">
					<input type="hidden" name="name" value="${item.name}">
					<input type="hidden" name="price" value="${item.price}">
					<input type="hidden" name="description" value="${item.description}"> 
						<c:if test="${not empty user.username}">
							<input class="btn btn-secondary float-sm-right" type="submit" name="submit" value="Add to Cart">
						</c:if>
					<ul>
						<li>${item.name} $${item.price}</li>
						<li>${item.description}</li>
					</ul>
				</form>
			</c:if>
		</c:forEach>
      </div>
      
      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
      <c:forEach var="item" items="${items}">
			<c:if test="${item.category == 'Burgers'}">
				<form action="SendItemToCart.do" method="POST">
					<input type="hidden" name="name" value="${item.name}">
					<input type="hidden" name="price" value="${item.price}">
					<input type="hidden" name="description" value="${item.description}"> 
						<c:if test="${not empty user.username}">
							<input class="btn btn-secondary float-sm-right" type="submit" name="submit" value="Add to Cart">
						</c:if>
					<ul>
						<li>${item.name} $${item.price}</li>
						<li>${item.description}</li>
					</ul>
				</form>
			</c:if>
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
      <c:forEach var="item" items="${items}">
			<c:if test="${item.category == 'Hot Subs'}">
				<form action="SendItemToCart.do" method="POST">
					<input type="hidden" name="name" value="${item.name}">
					<input type="hidden" name="price" value="${item.price}">
					<input type="hidden" name="description" value="${item.description}"> 
						<c:if test="${not empty user.username}">
							<input class="btn btn-secondary float-sm-right" type="submit" name="submit" value="Add to Cart">
						</c:if>
					<ul>
						<li>${item.name} $${item.price}</li>
						<li>${item.description}</li>
					</ul>
				</form>
			</c:if>
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
      <c:forEach var="item" items="${items}">
			<c:if test="${item.category == 'Sandwich'}">
				<form action="SendItemToCart.do" method="POST">
					<input type="hidden" name="name" value="${item.name}">
					<input type="hidden" name="price" value="${item.price}">
					<input type="hidden" name="description" value="${item.description}"> 
						<c:if test="${not empty user.username}">
							<input class="btn btn-secondary float-sm-right" type="submit" name="submit" value="Add to Cart">
						</c:if>
					<ul>
						<li>${item.name} $${item.price}</li>
						<li>${item.description}</li>
					</ul>
				</form>
			</c:if>
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-salad" role="tabpanel" aria-labelledby="list-salad-list">
      <c:forEach var="item" items="${items}">
			<c:if test="${item.category == 'Salad'}">
				<form action="SendItemToCart.do" method="POST">
					<input type="hidden" name="name" value="${item.name}">
					<input type="hidden" name="price" value="${item.price}">
					<input type="hidden" name="description" value="${item.description}"> 
						<c:if test="${not empty user.username}">
							<input class="btn btn-secondary float-sm-right" type="submit" name="submit" value="Add to Cart">
						</c:if>
					<ul>
						<li>${item.name} $${item.price}</li>
						<li>${item.description}</li>
					</ul>
				</form>
			</c:if>
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-wrap" role="tabpanel" aria-labelledby="list-wrap-list">
      <c:forEach var="item" items="${items}">
			<c:if test="${item.category == 'Wrap'}">
				<form action="SendItemToCart.do" method="POST">
					<input type="hidden" name="name" value="${item.name}">
					<input type="hidden" name="price" value="${item.price}">
					<input type="hidden" name="description" value="${item.description}"> 
						<c:if test="${not empty user.username}">
							<input class="btn btn-secondary float-sm-right" type="submit" name="submit" value="Add to Cart">
						</c:if>
					<ul>
						<li>${item.name} $${item.price}</li>
						<li>${item.description}</li>
					</ul>
				</form>
			</c:if>
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-mexican" role="tabpanel" aria-labelledby="list-mexican-list">
      <c:forEach var="item" items="${items}">
			<c:if test="${item.category == 'Mexican'}">
				<form action="SendItemToCart.do" method="POST">
					<input type="hidden" name="name" value="${item.name}">
					<input type="hidden" name="price" value="${item.price}">
					<input type="hidden" name="description" value="${item.description}"> 
						<c:if test="${not empty user.username}">
							<input class="btn btn-secondary float-sm-right" type="submit" name="submit" value="Add to Cart">
						</c:if>
					<ul>
						<li>${item.name} $${item.price}</li>
						<li>${item.description}</li>
					</ul>
				</form>
			</c:if>
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-rice" role="tabpanel" aria-labelledby="list-rice-list">
      <c:forEach var="item" items="${items}">
			<c:if test="${item.category == 'Rice Bowl'}">
				<form action="SendItemToCart.do" method="POST">
					<input type="hidden" name="name" value="${item.name}">
					<input type="hidden" name="price" value="${item.price}">
					<input type="hidden" name="description" value="${item.description}"> 
						<c:if test="${not empty user.username}">
							<input class="btn btn-secondary float-sm-right" type="submit" name="submit" value="Add to Cart">
						</c:if>
					<ul>
						<li>${item.name} $${item.price}</li>
						<li>${item.description}</li>
					</ul>
				</form>
			</c:if>
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-soup" role="tabpanel" aria-labelledby="list-soup-list">
      <c:forEach var="item" items="${items}">
			<c:if test="${item.category == 'Soups'}">
				<form action="SendItemToCart.do" method="POST">
					<input type="hidden" name="name" value="${item.name}">
					<input type="hidden" name="price" value="${item.price}">
					<input type="hidden" name="description" value="${item.description}"> 
						<c:if test="${not empty user.username}">
							<input class="btn btn-secondary float-sm-right" type="submit" name="submit" value="Add to Cart">
						</c:if>
					<ul>
						<li>${item.name} $${item.price}</li>
						<li>${item.description}</li>
					</ul>
				</form>
			</c:if>
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-drink" role="tabpanel" aria-labelledby="list-drink-list">
      <c:forEach var="item" items="${items}">
			<c:if test="${item.category == 'Drinks'}">
				<form action="SendItemToCart.do" method="POST">
					<input type="hidden" name="name" value="${item.name}">
					<input type="hidden" name="price" value="${item.price}">
					<input type="hidden" name="description" value="${item.description}"> 
						<c:if test="${not empty user.username}">
							<input class="btn btn-secondary float-sm-right" type="submit" name="submit" value="Add to Cart">
						</c:if>
					<ul>
						<li>${item.name} $${item.price}</li>
						<li>${item.description}</li>
					</ul>
				</form>
			</c:if>
		</c:forEach>
      </div>
    </div>
  </div>
</div>
</div>
</div>



	</div>


	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
				<a href="#">Back to Top</a>
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
