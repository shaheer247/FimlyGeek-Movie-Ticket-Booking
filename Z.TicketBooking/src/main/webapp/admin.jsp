<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

	<title>Admin Page</title>
</head>

<body>

	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">FlimyGeek</a>
			<a class="navbar-brand" href="#">Admin Panel</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="#">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="theaters.jsp">Theaters</a>
					</li> 
					

					<li class="nav-item">
						<a class="nav-link" href="movies.jsp" >Movies</a>
					</li>
				</ul>
			</div>
			 <div class="ml-auto">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                    <button class="btn btn-danger">Logout</button></a>
                </li>
            </ul>
        </div>
		</div>
	</nav>


	<!-- Home Page -->

	<div class="container mt-5" id="homePage">
		<div class="row justify-content-center">
			<div class="col-md-6 mb-4">
				<div class="card">
					<div class="card-header">
						<h4>Theaters</h4>
					</div>
					<div class="card-body">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#addTheaterModal">Add Theater</button>
					</div>
				</div>
			</div>
			<div class="col-md-6 mb-4">
				<div class="card">
					<div class="card-header">
						<h4>Movies</h4>
					</div>
					<div class="card-body">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#addMovieModal">Add Movie</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Add Theater Modal -->
	<div class="modal fade" id="addTheaterModal" tabindex="-1" role="dialog" aria-labelledby="addTheaterModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addTheaterModalLabel">Add Theater</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="addTheater" method="POST">
						<div class="mb-3">
							<label for="theater_name" class="form-label">Theater Name:</label>
							<input type="text" class="form-control" id="theater_name" name="theater_name" required>
						</div>
						<div class="mb-3">
							<label for="theater_location" class="form-label">Location:</label>
							<input type="text" class="form-control" id="theater_location" name="theater_location"
								required>
						</div>
						<button type="submit" class="btn btn-primary">Add Theater</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Movie Modal -->
	<!-- Add Movie Modal -->
<div class="modal fade" id="addMovieModal" tabindex="-1" role="dialog" aria-labelledby="addMovieModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addMovieModalLabel">Add Movie</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="addMovie" method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="movie_name" class="form-label">Movie Name:</label>
                        <input type="text" class="form-control" id="movie_name" name="movie_name" required>
                    </div>
                    <div class="mb-3">
                        <label for="movie_duration" class="form-label">Duration:</label>
                        <input type="text" class="form-control" id="movie_duration" name="movie_duration" required>
                    </div>
                    <div class="mb-3">
                        <label for="movie_genre" class="form-label">Genre:</label>
                        <select class="form-control" id="movie_genre" name="movie_genre">
                            <option value="">Select Genre</option>
                            <option value="Action">Action</option>
                            <option value="Adventure">Adventure</option>
                            <option value="Comedy">Comedy</option>
                            <option value="Drama">Drama</option>
                            <option value="Horror">Horror</option>
                            <option value="Kids">Kids</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="movie_image" class="form-label">Movie Image:</label>
                        <input type="file" class="form-control-file" id="movie_image" name="movie_image"
                            accept="image/*" required>
                    </div>
                    <div class="mb-3">
                        <label for="theater_input" class="form-label">Theater ID:</label>
                        <input type="text" class="form-control" id="theater_input" name="theater_name" required>
                    </div>
                    <!-- Show times checkboxes -->
                    <div class="mb-3">
                        <label class="form-label">Show Times:</label><br>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="show_times" value="10 AM" id="showTime1">
                            <label class="form-check-label" for="showTime1">10 AM</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="show_times" value="3 PM" id="showTime2">
                            <label class="form-check-label" for="showTime2">3 PM</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="show_times" value="6 PM" id="showTime3">
                            <label class="form-check-label" for="showTime3">6 PM</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="show_times" value="9 PM" id="showTime4">
                            <label class="form-check-label" for="showTime4">9 PM</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Movie</button>
                </form>
            </div>
        </div>
    </div>
</div>

	
	<!-- Bootstrap JS (v5.0.2) and Popper.js (v2.9.2) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


	
</body>

</html>