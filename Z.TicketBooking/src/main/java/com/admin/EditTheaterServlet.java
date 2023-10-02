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

@WebServlet("/editTheater")
public class EditTheaterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int theaterId = Integer.parseInt(request.getParameter("theaterId")); // Get theater ID from the form
        String updatedTheaterName = request.getParameter("updatedTheaterName");
        String updatedTheaterLocation = request.getParameter("updatedTheaterLocation");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE theaters SET theater_location = ?, theater_name = ? WHERE theater_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, updatedTheaterLocation);
            pstmt.setString(2, updatedTheaterName);
            pstmt.setInt(3, theaterId); // Set theater ID in the query
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect to the theater list page or handle the response as needed
        response.sendRedirect("theaters.jsp");
    }
}
