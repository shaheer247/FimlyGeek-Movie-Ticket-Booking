<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>


<html>

<head>

<!-- Required meta tags -->

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>FilmyGeek - Heaven for Movie Lovers</title>

<link href='http://fonts.googleapis.com/css?family=Lato:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/jquery.seat-charts.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script src="js/jquery.seat-charts.js"></script>
</head>

<body>

	<!-- Navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">FilmyGeek</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>


				<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact
						Us</a></li>
			</ul>

			<!--  
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
			</form>
			<div class="mx-2">
				<button class="btn btn-danger" data-toggle="modal"
					data-target="#loginModal">Login</button>
				<button class="btn btn-danger" data-toggle="modal"
					data-target="#signupModal">SignUp</button>
			</div>
			-->

		</div>
	</nav>
	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="grid-50">

					<div id="seat-map">
						<div class="front-indicator">Movie Screen</div>
						<h4 class="text-muted fw-bold text-center"
							style="padding-left: 3em; margin: .5em"></h4>
						<div id="bus-seat-map"></div>
						<h4 class="text-muted fw-bold text-center"
							style="padding-left: 3em; margin: .5em"></h4>
					</div>

				</div>
				<div class="grid-50">
					<div class="booking-details">

						<form action="" method="post">

							<h2>Booking Details</h2>

							<h3>
								Selected Seats (<span id="counter">0</span>):
							</h3>
							<ul id="selected-seats"></ul>

							<h2>
								Total: <b>₹<span id="total">0</span></b>
							</h2>

							<button type="button" id="checkout-button">Proceed to
								Pay</button>
						</form>


						<div id="legend"></div>
						<button id="reset-btn" type="button">Reset Seat</button>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->

	<footer
		class="py-5 text-center text-body-secondary bg-body-tertiary bg-dark text-white">
		<p>
			FilmyGeek <a href=""></a> by <a href="">@Coding Hustlers</a>.
		</p>
		<p class="mb-0">
			<a href="#">Back to top</a>
		</p>
	</footer>


	<script src="./js/script.js"></script>



</body>

</html>