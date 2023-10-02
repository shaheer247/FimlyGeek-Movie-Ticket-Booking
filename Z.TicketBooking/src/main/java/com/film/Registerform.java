package com.film;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.DBConnection.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/regForm")
public class Registerform extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String myfname = request.getParameter("fname1");
        String mylname = request.getParameter("lname1");
        String myemail = request.getParameter("email1");
        String mypass = request.getParameter("pass1");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement("INSERT INTO register (firstname, lastname, email, password) VALUES (?, ?, ?, ?)");
            ps.setString(1, myfname);
            ps.setString(2, mylname);
            ps.setString(3, myemail);
            ps.setString(4, mypass);

            int i = ps.executeUpdate();
            if (i > 0) {
                response.setContentType("text/html");
                out.print("User Registered Successfully");
                RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
                rd.include(request, response);
            } else {
                response.setContentType("text/html");
                out.print("User not Registered Successfully");
                RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
                rd.include(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection();
        }
    }
}
