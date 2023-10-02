package com.admin;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.DBConnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/addMovie")
@MultipartConfig
public class AddMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String movieName = request.getParameter("movie_name");
        String movieDuration = request.getParameter("movie_duration");
        String movieGenre = request.getParameter("movie_genre");
        String theaterName = request.getParameter("theater_name");
        
        // Get selected show times as an array of strings
        String[] selectedShowTimes = request.getParameterValues("show_times");
        
       
        // Join selected show times into a single string (comma-separated)
        String showTimes = "";
        if (selectedShowTimes != null) {
            showTimes = String.join(",", selectedShowTimes);
        }

       


        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO movies (movie_name, movie_duration, movie_genre, movie_image, theater_id, show_times) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, movieName);
            pstmt.setString(2, movieDuration);
            pstmt.setString(3, movieGenre);
            pstmt.setString(5, theaterName);

            // Handle file upload
            Part filePart = request.getPart("movie_image");
            if (filePart != null) {
                // Get the input stream from the uploaded file
                InputStream fileContent = filePart.getInputStream();

                // Define a directory to store uploaded files (adjust the path as needed)
                String uploadDir ="C:\\Users\\91939\\Desktop\\Z.TicketBooking\\src\\main\\webapp\\DBimages";
                
                // Generate a unique file name or use the original file name
                String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();

                // Create a Path object for the destination file
                Path uploadPath = Paths.get(uploadDir, fileName);

                // Copy the file to the destination path
                Files.copy(fileContent, uploadPath, StandardCopyOption.REPLACE_EXISTING);

                // Set the file name in the database
                pstmt.setString(4, fileName);
            }

            pstmt.setString(6, showTimes); // Set the show times
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect to a confirmation page or handle the response as needed
        response.sendRedirect("admin.jsp");
    }
}
