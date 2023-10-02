<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>Insert title here</title>

<style>
/* Custom CSS to position the logout button on the right */
.custom-ml-auto {
	margin-left: auto;
}
</style>
</head>
<body>
<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Admin Panel</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="showHome()">Home</a></li>
				
				</ul>

				<ul class="navbar-nav custom-ml-auto">
					<li class="nav-item">
						<button class="btn btn-danger" onclick="logout()">Logout</button>

					</li>
				</ul>

			</div>
		</div>
	</nav>

<h1>Add Movies</h1>
<form action="SaveServlet" method="post">
<table>
<tr><td>Movie Name:</td><td><input type="text" name="name"/></td></tr>
<tr><td>Genre:</td><td><input type="text" name="genre"/></td></tr>
<tr><td>Theatre:</td><td><input type="text" name="theatre"/></td></tr>
<tr><td>City:</td><td>
<select name="city" style="width:150px">
<option>Rayachoti</option>
<option>Hyderabad</option>
<option>Bangalore</option>
<option>Delhi</option>
</select>
</td></tr>
<tr><td colspan="2"><input type="submit" value="Save Movie"/></td></tr>
</table>
</form>

<br/>

  <p><a class="btn btn-danger" href="ViewServlet">View Movies</a></p>
  
  <script>
	        function logout() {
	            // Redirect to the home page (index.jsp)
	            window.location.href = 'index.jsp'; // Adjust the URL as needed
	        }
	        
	        function showHome() {
	            // Redirect to the admin page (index.jsp)
	            window.location.href = 'admin.jsp'; // Adjust the URL as needed
	        }
	        </script>
	        
	        
	        
	        


</body>
</html>