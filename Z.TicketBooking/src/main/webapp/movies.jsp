<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie List</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin.jsp">FlimyGeek</a>
			<a class="navbar-brand" href="admin.jsp">Admin Panel</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="admin.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="theaters.jsp">Theaters</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Movies</a></li>
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

    <div class="container mt-5">
        <h2>Movie List</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Movie Name</th>
                    <th>Duration</th>
                    <th>Genre</th>
                    <th>Theater ID</th>
                    <th>Show Times</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
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

                        String sql = "SELECT * FROM movies";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            int movieId = rs.getInt("movie_id"); // Use movie_id as a unique identifier
                            String movieName = rs.getString("movie_name");
                            String movieDuration = rs.getString("movie_duration");
                            String movieGenre = rs.getString("movie_genre");
                            int theaterId = rs.getInt("theater_id");
                            String movieImage = rs.getString("movie_image");
                            String showTimes = rs.getString("show_times"); // Retrieve show times from the database
                %>
                <tr>
                    <td><%=movieName%></td>
                    <td><%=movieDuration%></td>
                    <td><%=movieGenre%></td>
                    <td><%=theaterId%></td>
                    <td><%=showTimes%></td> <!-- Display show times for the movie -->
                    <td>
                    
                    <img src="<%=request.getContextPath() + "/DBimages/" + movieImage%>" alt="<%=movieName%>" width="100"></td>
                    <td>
                        <!-- Button to trigger the Edit Movie modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editMovieModal<%=movieId%>">Edit</button>
                        <!-- Button to trigger the Delete Movie modal -->
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteMovieModal<%=movieId%>">Delete</button>
                    </td>
                </tr>
                <!-- Modal for Edit Movie -->
                <div class="modal fade" id="editMovieModal<%=movieId%>" tabindex="-1" role="dialog" aria-labelledby="editMovieModalLabel<%=movieId%>" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editMovieModalLabel<%=movieId%>">Edit Movie</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- Edit movie form here with fields like movie name, duration, genre, and theater ID -->
                                <form action="<%=request.getContextPath()%>/editMovie" method="post">
                                    <div class="mb-3">
                                        <label for="editMovieName<%=movieId%>" class="form-label">Movie Name:</label>
                                        <input type="text" class="form-control" id="editMovieName<%=movieId%>" name="editMovieName" value="<%=movieName%>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editMovieDuration<%=movieId%>" class="form-label">Duration:</label>
                                        <input type="text" class="form-control" id="editMovieDuration<%=movieId%>" name="editMovieDuration" value="<%=movieDuration%>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editMovieGenre<%=movieId%>" class="form-label">Genre:</label>
                                        <input type="text" class="form-control" id="editMovieGenre<%=movieId%>" name="editMovieGenre" value="<%=movieGenre%>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editTheaterId<%=movieId%>" class="form-label">Theater ID:</label>
                                        <input type="text" class="form-control" id="editTheaterId<%=movieId%>" name="editTheaterId" value="<%=theaterId%>" required>
                                    </div>
                                    <!-- Add checkboxes for show times in the edit movie form -->
                                    <div class="mb-3">
                                        <label class="form-label">Show Times:</label><br>
                                        <input type="checkbox" id="editShowTime1<%=movieId%>" name="editShowTimes" value="10 AM"> 10 AM
                                        <input type="checkbox" id="editShowTime2<%=movieId%>" name="editShowTimes" value="3 PM"> 3 PM
                                        <input type="checkbox" id="editShowTime3<%=movieId%>" name="editShowTimes" value="6 PM"> 6 PM
                                        <input type="checkbox" id="editShowTime4<%=movieId%>" name="editShowTimes" value="9 PM"> 9 PM
                                    </div>
                                    <!-- Add more edit fields as needed -->
                                    <input type="hidden" name="editMovieId" value="<%=movieId%>">
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
               
                
                <!-- Modal for Delete Movie -->
                <div class="modal fade" id="deleteMovieModal<%=movieId%>" tabindex="-1" role="dialog" aria-labelledby="deleteMovieModalLabel<%=movieId%>" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteMovieModalLabel<%=movieId%>">Confirm Deletion</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">Are you sure you want to delete this movie?</div>
                            <div class="modal-footer">
                                <!-- Form to submit the delete request -->
                                <form action="<%=request.getContextPath()%>/deleteMovie" method="post">
                                    <input type="hidden" name="deleteMovieId" value="<%=movieId%>">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
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
                        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
