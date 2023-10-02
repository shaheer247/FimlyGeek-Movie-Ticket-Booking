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

@WebServlet("/contact")
public class contact extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String myname = request.getParameter("name1");
        String myemail = request.getParameter("email1");
        String myphone = request.getParameter("phone1");
        String mymessage = request.getParameter("message1");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement("INSERT INTO contact (name, email, phone_no, message) VALUES (?, ?, ?, ?)");
            ps.setString(1, myname);
            ps.setString(2, myemail);
            ps.setString(3, myphone);
            ps.setString(4, mymessage);

            int i = ps.executeUpdate();
            if (i > 0) {
                response.setContentType("text/html");
                out.print("Your Message Sent Successfully.We will contact you later.");
                RequestDispatcher rd = request.getRequestDispatcher("/contact.jsp");
                rd.include(request, response);
            } else {
                response.setContentType("text/html");
                out.print("Message not sent Successfully");
                RequestDispatcher rd = request.getRequestDispatcher("/contact.jsp");
                rd.include(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection();
        }
    }
}

