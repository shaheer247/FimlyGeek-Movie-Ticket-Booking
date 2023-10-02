<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>

<!doctype html>
<html lang="en">

<head>

<!-- Required meta tags -->

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Welcome to FilmyGeek. A Movie Ticket Booking Website">

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<title>FilmyGeek - Heaven for Movie Lovers</title>
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
				<li class="nav-item active">
					<a class="nav-link" href="#">Home</a>
				</li>

				<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact
						Us</a></li>
			</ul>
			
			<form class="form-inline my-2 my-lg-0">

				<input id="movieSearch" class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button id="searchButton" class="btn btn-outline-light my-2 my-sm-0"
					type="button">Search</button>

			</form>
			<div style="width: 10px;"></div>
			
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="cityDropdown" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Select City</button>
				<div class="dropdown-menu" aria-labelledby="cityDropdown">
					<a class="dropdown-item active" href="#" data-city="all">All
						Cities</a>
					 <a class="dropdown-item" href="#" data-city="city1">Bengaluru</a>
					<a class="dropdown-item" href="#" data-city="city2">Hyderabad</a> <a
						class="dropdown-item" href="#" data-city="city3">Delhi</a>
					<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try {
						// Establish a database connection
						Class.forName("com.mysql.cj.jdbc.Driver");
						String url = "jdbc:mysql://localhost:3306/filmygeek";
						String username = "root";
						String password = "root";
						conn = DriverManager.getConnection(url, username, password);

						String sql = "SELECT DISTINCT T.theater_location FROM theaters T " + "JOIN movies M ON T.theater_id = M.theater_id";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();

						while (rs.next()) {
							String theaterLocation = rs.getString("theater_location");
					%>
					<a class="dropdown-item" href="#"
						data-city="<%=theaterLocation%>"><%=theaterLocation%></a>
					<%
					}
					} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
					} finally {
					try {
					if (rs != null)
						rs.close();
					} catch (SQLException e) {
					e.printStackTrace();
					}
					try {
					if (pstmt != null)
						pstmt.close();
					} catch (SQLException e) {
					e.printStackTrace();
					}
					try {
					if (conn != null)
						conn.close();
					} catch (SQLException e) {
					e.printStackTrace();
					}
					}
					%>
				</div>
			</div>


			<div class="mx-2">
				<a href="login.jsp" class="btn btn-danger" role="button">Login</a> <a
					href="signup.jsp" class="btn btn-danger" role="button">SignUp</a>
			</div>
		</div>
	</nav>


	<!-- carousel -->

	<div id="carouselExampleCaptions" class="carousel slide carousel-fade"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleCaptions" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">

				<img class="bd-placeholder-img card-img-top" width="100%"
					height="550" src="int.jpg  " alt="" class="src">
				<div class="carousel-caption d-none d-md-block">
					<h2>Welcome to FilmyGeek</h2>
					<p>Fun and Entertainment</p>

					<a href="theatre.jsp" class="btn btn-danger" role="button">Book
						Ticket Now</a>

				</div>
			</div>
			<div class="carousel-item">

				<img class="bd-placeholder-img card-img-top" width="100%"
					height="550" src="dun.jpg  " alt="" class="src">
				<div class="carousel-caption d-none d-md-block">
					<h2>Welcome to FilmyGeek</h2>
					<p>Fun and Entertainment</p>
					<a href="theatre.jsp" class="btn btn-danger" role="button">Book
						Ticket Now</a>

				</div>
			</div>
			<div class="carousel-item">

				<img class="bd-placeholder-img card-img-top" width="100%"
					height="550" src="inc.jpg  " alt="" class="src">
				<div class="carousel-caption d-none d-md-block">
					<h2>Welcome to FilmyGeek</h2>
					<p>Fun and Entertainment</p>
					<a href="theatre.jsp" class="btn btn-danger" role="button">Book
						Ticket Now</a>

				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleCaptions"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only"></span>
		</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only"></span>
		</a>
	</div>



	<div class="col" data-city="city1">
		<div class="container my-5">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
				id="movieContainerCity1">
				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="300" src="inc.jpg" alt="Inception" class="src">

						<div class="card-body">
							<h5 class="card-title">Inception</h5>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">

									<a href="theatre.jsp" class="btn btn-danger" role="button">Book
										Ticket</a>
								</div>
								<small class="text-muted">On Screen</small>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="300" src="int.jpg" alt="Interstellar" class="src">
						<div class="card-body">
							<h5 class="card-title">Interstellar</h5>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">

									<a href="theatre.jsp" class="btn btn-danger" role="button">Book
										Ticket</a>
								</div>
								<small class="text-muted">On Screen</small>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="300" src="dun.jpg  " class="" alt="Dunkirk" class="src">
						<div class="card-body">
							<h5 class="card-title">Dunkirk</h5>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">


									<a href="theatre.jsp" class="btn btn-danger" role="button">Book
										Ticket</a>

								</div>
								<small class="text-muted">On Screen</small>
							</div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>



	<div class="col" data-city="city2">
		<div class="container my-5">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
				id="movieContainerCity2">

				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="300" src="images/movie4.jpeg" alt="Aladdin" class="src">
						<div class="card-body">
							<h5 class="card-title">Aladdin</h5>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="theatre.jsp" class="btn btn-danger" role="button">Book
										Ticket</a>
								</div>
								<small class="text-muted">On Screen</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="300" src="images/movie5.jpeg" alt="Avatar The way of Water" class="src">
						<div class="card-body">
							<h5 class="card-title">Avatar The way of Water</h5>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="theatre.jsp" class="btn btn-danger" role="button">Book
										Ticket</a>
								</div>
								<small class="text-muted">On Screen</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="300" src="images/movie6.jpeg" alt="Avengers End Game" class="src">
						<div class="card-body">
							<h5 class="card-title">Avengers End Game</h5>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="theatre.jsp" class="btn btn-danger" role="button">Book
										Ticket</a>
								</div>
								<small class="text-muted">On Screen</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


	<div class="col" data-city="city3">
		<div class="container my-5">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
				id="movieContainerCity2">

				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="300" src="images/jawan.jpeg" alt="Jawan" class="src">
						<div class="card-body">
							<h5 class="card-title">Jawan</h5>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="theatre.jsp" class="btn btn-danger" role="button">Book
										Ticket</a>
								</div>
								<small class="text-muted">On Screen</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="300" src="images/guardians.jpg" alt="Guardians of the Galaxy" class="src">
						<div class="card-body">
							<h5 class="card-title">Guardians of the Galaxy</h5>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="theatre.jsp" class="btn btn-danger" role="button">Book
										Ticket</a>
								</div>
								<small class="text-muted">On Screen</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="300" src="images/antman.jpg" alt="Quantumania" class="src">
						<div class="card-body">
							<h5 class="card-title">Quantumania</h5>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="theatre.jsp" class="btn btn-danger" role="button">Book
										Ticket</a>
								</div>
								<small class="text-muted">On Screen</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	
	<div class="container mt-5">
		
		<div class="row">
			<%
			
			try {
				// Establish a database connection
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/filmygeek";
				String username = "root";
				String password = "root";
				conn = DriverManager.getConnection(url, username, password);

				String sql = "SELECT * FROM movies";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					int movieId = rs.getInt("movie_id"); // Use movie_id as a unique identifier
					String movieName = rs.getString("movie_name");
					//String movieDuration = rs.getString("movie_duration");
					//String movieGenre = rs.getString("movie_genre");
					String movieImage = rs.getString("movie_image");
			%>
			
			<div class="col-md-4 mb-4">
				<div class="card">
					<img
						src="<%=request.getContextPath() + "/DBimages/" + movieImage%>"
						class="card-img-top" alt="<%=movieName%>"
							height="300">
					<div class="card-body">
						<h5 class="card-title"><%=movieName%></h5>
						
						
						<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="theatre.jsp" class="btn btn-danger">Book
										Ticket</a>
								</div>
								<small class="text-muted">On Screen</small>
							</div>
					</div>
				</div>
			</div>
			<%
			}
			} catch (ClassNotFoundException | SQLException e) {
			// Handle exceptions here, e.g., display an error message or log the error
			e.printStackTrace();
			} finally {
			// Close resources in a finally block
			try {
			if (rs != null)
				rs.close();
			} catch (SQLException e) {
			e.printStackTrace();
			}
			try {
			if (pstmt != null)
				pstmt.close();
			} catch (SQLException e) {
			e.printStackTrace();
			}
			try {
			if (conn != null)
				conn.close();
			} catch (SQLException e) {
			e.printStackTrace();
			}
			}
			%>
		</div>
	</div>





	<!--  Footer  -->

	<footer
		class="py-5 text-center text-body-secondary bg-body-tertiary bg-dark text-white">
		<p>
			FilmyGeek <a href=""></a> by <a href="">@Coding Hustlers</a>.
		</p>
		<p class="mb-0">
			<a href="#">Back to top</a>
		</p>
	</footer>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>



	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Get references to the search input, city dropdown button, and movie containers
			const movieSearchInput = document.getElementById('movieSearch');
			const cityDropdownButton = document.getElementById('cityDropdown');
			const cityDropdownItems = document
					.querySelectorAll('.dropdown-item');
			const movieContainers = document
					.querySelectorAll('.col[data-city]');

			// Function to filter movies based on search query and selected city
			function filterMovies(searchQuery, selectedCity) {
				// Loop through each movie container and check if it matches the selected city
				movieContainers.forEach(function(movieContainer) {
					const city = movieContainer.getAttribute('data-city');
					const movieCards = movieContainer.querySelectorAll('.col');

					if (city === selectedCity || selectedCity === 'all') {
						let cityHasMovies = false;

						// Loop through each movie card and check if it matches the search query
						movieCards.forEach(function(movieCard) {
							const movieTitle = movieCard
									.querySelector('.card-title').textContent
									.toLowerCase();
							if (movieTitle.includes(searchQuery)) {
								movieCard.style.display = 'block'; // Show the movie card
								cityHasMovies = true;
							} else {
								movieCard.style.display = 'none'; // Hide the movie card
							}
						});

						if (cityHasMovies) {
							movieContainer.style.display = 'block'; // Show the movie container if it has matching movies
						} else {
							movieContainer.style.display = 'none'; // Hide the movie container if it has no matching movies
						}
					} else {
						// Hide movie containers for non-selected cities
						movieContainer.style.display = 'none';
					}
				});
			}

			// Initialize with "All Cities" selected
			cityDropdownButton.innerText = "All Cities";
			cityDropdownButton.setAttribute('data-city', 'all');

			// Add an event listener to the search button for filtering when clicked
			const searchButton = document.getElementById('searchButton');
			searchButton.addEventListener('click', function() {
				const searchQuery = movieSearchInput.value.toLowerCase();
				const selectedCity = cityDropdownButton
						.getAttribute('data-city');
				filterMovies(searchQuery, selectedCity);
			});

			// Add event listeners to city dropdown items to update the selected city
			cityDropdownItems.forEach(function(item) {
				item.addEventListener('click', function() {
					const selectedCity = item.getAttribute('data-city');
					cityDropdownButton.innerText = item.innerText; // Update the dropdown button text
					cityDropdownButton.setAttribute('data-city', selectedCity); // Update the data-city attribute
					const searchQuery = movieSearchInput.value.toLowerCase();
					filterMovies(searchQuery, selectedCity);
				});
			});

			// Trigger filtering when the page loads with "All Cities" selected
			filterMovies('', 'all');
		});
	</script>




</body>

</html>