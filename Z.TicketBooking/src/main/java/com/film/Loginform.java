package com.film;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DBConnection.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/LoginForm")
//public class Loginform extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        String myemail = request.getParameter("email1");
//        String mypass = request.getParameter("pass1");
//
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        try {
//            conn = DBConnection.getConnection();
//            ps = conn.prepareStatement("SELECT * FROM register WHERE email=? and password=?");
//            ps.setString(1, myemail);
//            ps.setString(2, mypass);
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                response.setContentType("text/html");
//                out.print("Login Successfully");
//                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
//                rd.include(request, response);
//            } else {
//                response.setContentType("text/html");
//                out.print("Email and password do not match");
//                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
//                rd.include(request, response);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DBConnection.closeConnection();
//        }
//    }
//}


@WebServlet("/LoginForm")
public class Loginform extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String myemail = request.getParameter("email1");
        String mypass = request.getParameter("pass1");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement("SELECT * FROM register WHERE email=? and password=?");
            ps.setString(1, myemail);
            ps.setString(2, mypass);
            rs = ps.executeQuery();
            if (rs.next()) {
                String userType = rs.getString("type");
                if ("admin".equals(userType)) {
                    // Redirect to the admin page
                    response.sendRedirect("admin.jsp");
                } else if ("normal".equals(userType)) {
                    // Redirect to the home page
                	
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.setContentType("text/html");
                out.print("Email and password do not match");
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.include(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection();
        }
    }
}
