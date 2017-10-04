<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link href="css/checkout.css" rel="stylesheet">

<title>Checkout</title>


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
	<h1>Checkout Page</h1>
	<p>${order.time}</p>

	<p>${thanks}</p>
	<div class="container wrapper">
		<div class="row cart-head">
			<div class="container">
				<div class="row">
					<p></p>
				</div>
				<div class="row">
					<div style="display: table; margin: auto;">
						<form action="cart.do">
							<span class="step step_complete"> <a class="check-bc">Cart</a>
								<span class="step_line step_complete"> </span> <span
								class="step_line backline"> </span>
							</span>
						</form>
						<form>
							<span class="step step_complete"> <a class="check-bc">Checkout</a>
								<span class="step_line step_complete"> </span> <span
								class="step_line step_complete"> </span>
							</span> <span class="step_thankyou check-bc step_complete">Thank
								you</span>
						</form>
					</div>
				</div>
				<div class="row">
					<p></p>
				</div>
			</div>
		</div>
		<!-- end of container wrapper -->


		<div class="row cart-body">
			<form class="form-horizontal" method="post" action="">
				<div
					class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
					<!--REVIEW ORDER-->
					<div class="panel panel-info">
						<div class="panel-heading">
							Review Order
							<div class="pull-right">
								<small><a class="afix-1" href="#">Edit Cart</a></small>
							</div>
						</div>


						<c:forEach var="userOrder" items="${order.menuItems}">
							<div class="panel-body">
								<div class="form-group">
									<div class="col-sm-3 col-xs-3">
										<img class="img-responsive" src="images/cafe.png">
									</div>
									<div class="col-sm-6 col-xs-6">
										<div class="col-xs-12">${userOrder.name}</div>
										<div class="col-xs-12">${userOrder.description}</div>
										<div class="col-xs-12">
											<%-- <small>Quantity:<span>${cart.quantity}</span></small> --%>
										</div>
									</div>
									<div class="col-sm-3 col-xs-3 text-right">
										<h3>
											<span>$</span>${userOrder.price}
										</h3>
									</div>
								</div>
								<div class="form-group">
									<hr />
								</div>
						</c:forEach>


						<div class="form-group">
							<hr />
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<strong>Total</strong>
								<div class="pull-right">
									<span>$</span><span>${orderBeforeTax}</span>
								</div>
							</div>
							<div class="col-xs-12">
								<strong>Tax</strong>
								<div class="pull-right">
									<span>$</span><span>${orderTax}</span>
								</div>
							</div>
							<div class="col-xs-12">
								<strong>Order Total</strong>
								<div class="pull-right">
									<span>$</span><span>${orderAfterTax}</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--REVIEW ORDER END-->
		</div>
		<div
			class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
			<!-- <!-- SHIPPING METHOD
			<div class="panel panel-info">
				<div class="panel-heading">Address</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-md-12">
							<h4>Shipping Address</h4>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<strong>Country:</strong>
						</div>
						<div class="col-md-12">
							<input type="text" class="form-control" name="country" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6 col-xs-12">
							<strong>First Name:</strong> <input type="text" name="first_name"
								class="form-control" value="" />
						</div>
						<div class="span1"></div>
						<div class="col-md-6 col-xs-12">
							<strong>Last Name:</strong> <input type="text" name="last_name"
								class="form-control" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<strong>Address:</strong>
						</div>
						<div class="col-md-12">
							<input type="text" name="address" class="form-control" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<strong>City:</strong>
						</div>
						<div class="col-md-12">
							<input type="text" name="city" class="form-control" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<strong>State:</strong>
						</div>
						<div class="col-md-12">
							<input type="text" name="state" class="form-control" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<strong>Zip / Postal Code:</strong>
						</div>
						<div class="col-md-12">
							<input type="text" name="zip_code" class="form-control" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<strong>Phone Number:</strong>
						</div>
						<div class="col-md-12">
							<input type="text" name="phone_number" class="form-control"
								value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<strong>Email Address:</strong>
						</div>
						<div class="col-md-12">
							<input type="text" name="email_address" class="form-control"
								value="" />
						</div>
					</div>
				</div>
			</div>
			<--!SHIPPING METHOD END -->
			
			<!--CREDIT CART PAYMENT-->
			<div class="panel panel-info">
				<div class="panel-heading">
					<span><i class="glyphicon glyphicon-lock"></i></span> Secure
					Payment
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-md-12">
							<strong>Card Type:</strong>
						</div>
						<div class="col-md-12">
							<select id="CreditCardType" name="CreditCardType"
								class="form-control">
								<option value="5">Visa</option>
								<option value="6">MasterCard</option>
								<option value="7">American Express</option>
								<option value="8">Discover</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<strong>Credit Card Number:</strong>
						</div>
						<div class="col-md-12">
							<input type="text" class="form-control" name="car_number"
								value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<strong>Card CVV:</strong>
						</div>
						<div class="col-md-12">
							<input type="text" class="form-control" name="car_code" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<strong>Expiration Date</strong>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<select class="form-control" name="">
								<option value="">Month</option>
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<select class="form-control" name="">
								<option value="">Year</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
								<option value="2023">2023</option>
								<option value="2024">2024</option>
								<option value="2025">2025</option>
								<option value="2026">2024</option>
								<option value="2027">2025</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<span>Pay secure using your credit card.</span>
						</div>
						<div class="col-md-12">
							<ul class="cards">
								<li class="visa hand">Visa</li>
								<li class="mastercard hand">MasterCard</li>
								<li class="amex hand">Amex</li>
							</ul>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12">
						<form action ="confirmation.do" method=POST>
							<button type="submit" class="btn btn-primary btn-submit-fix">
							Place Order</button>
						</form>
						</div>
					</div>
				</div>
			</div>
			<!--CREDIT CART PAYMENT END-->
		</div>

		</form>
	</div>
	<div class="row cart-footer"></div>
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