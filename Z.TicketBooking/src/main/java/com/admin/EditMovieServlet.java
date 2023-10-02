package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.DBConnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editMovie")
public class EditMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int movieId = Integer.parseInt(request.getParameter("editMovieId"));
        String movieName = request.getParameter("editMovieName");
        String movieDuration = request.getParameter("editMovieDuration");
        String movieGenre = request.getParameter("editMovieGenre");
        
        // Retrieve the selected show times as an array of strings
        String[] showTimes = request.getParameterValues("editShowTimes");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE movies SET movie_name = ?, movie_duration = ?, movie_genre = ?, show_times = ? WHERE movie_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, movieName);
            pstmt.setString(2, movieDuration);
            pstmt.setString(3, movieGenre);
            
            // Combine the selected show times into a single string
            String showTimesString = String.join(", ", showTimes);
            pstmt.setString(4, showTimesString);
            
            pstmt.setInt(5, movieId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect to the movie list page or handle the response as needed
        response.sendRedirect("movies.jsp");
    }
}
