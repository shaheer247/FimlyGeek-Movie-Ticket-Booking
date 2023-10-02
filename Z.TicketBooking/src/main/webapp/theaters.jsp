<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Theater List</title>
    <!-- Include Bootstrap CSS (Bootstrap 5) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
                    <li class="nav-item">
                        <a class="nav-link" href="admin.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Theaters</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="movies.jsp">Movies</a>
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

    <div class="container mt-5">
        <h2>Theater List</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Theater Name</th>
                    <th>Theater Location</th>
                    <th>Actions</th>
                    
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

                    String sql = "SELECT * FROM theaters";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        String theaterName = rs.getString("theater_name");
                        String theaterLocation = rs.getString("theater_location");
                        int theaterId = rs.getInt("theater_id");
                %>
                <tr>
                    <td><%=theaterName%></td>
                    <td><%=theaterLocation%></td>
                    <td>
                        <!-- Button to trigger the edit modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editTheaterModal<%=theaterId%>">Edit</button>
                    
                        <!-- Button to trigger the delete modal -->
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteTheaterModal<%=theaterId%>">Delete</button>
                    </td>
                </tr>

                <!-- Modal for Edit -->
                <div class="modal fade" id="editTheaterModal<%=theaterId%>" tabindex="-1" role="dialog" aria-labelledby="editTheaterModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editTheaterModalLabel">Edit Theater</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- Edit theater form -->
                                <form action="<%=request.getContextPath()%>/editTheater" method="post">
                                    <div class="mb-3">
                                        <label for="theaterName" class="form-label">Theater Name</label>
                                        <input type="text" class="form-control" id="theaterName" name="updatedTheaterName" value="<%=theaterName%>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="theaterLocation" class="form-label">Theater Location</label>
                                        <input type="text" class="form-control" id="theaterLocation" name="updatedTheaterLocation" value="<%=theaterLocation%>"  required>
                                    </div>
                                    <!-- Add hidden input for theaterId -->
                                    <input type="hidden" name="theaterId" value="<%=theaterId%>">
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal for Delete -->
                <div class="modal fade" id="deleteTheaterModal<%=theaterId%>" tabindex="-1" role="dialog" aria-labelledby="deleteTheaterModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteTheaterModalLabel">Confirm Deletion</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">Are you sure you want to delete this theater?</div>
                            <div class="modal-footer">
                                <form action="<%=request.getContextPath()%>/deleteTheater" method="post">
                                    <input type="hidden" name="theaterId" value="<%=theaterId%>">
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
            </tbody>
        </table>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
