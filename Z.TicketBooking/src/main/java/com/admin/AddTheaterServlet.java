// AddTheaterServlet.java
package com.admin;

// AddTheaterServlet.java
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


@WebServlet("/addTheater")
public class AddTheaterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String theaterName = request.getParameter("theater_name");
        String theaterLocation = request.getParameter("theater_location");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO theaters (theater_name, theater_location) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, theaterName);
            pstmt.setString(2, theaterLocation);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect to a confirmation page or handle the response as needed
        response.sendRedirect("admin.jsp");
    }
}
