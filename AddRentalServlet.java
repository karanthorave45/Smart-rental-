package com.example.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class AddRentalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String from = req.getParameter("from");
        String to = req.getParameter("to");
        double amount = Double.parseDouble(req.getParameter("amount"));

        String url = "jdbc:mysql://localhost:3306/rental";
        String user = "root";
        String pass = "password";

        try (Connection con = DriverManager.getConnection(url, user, pass);
             PreparedStatement ps = con.prepareStatement(
                 "INSERT INTO rentals (`from`, `to`, amount) VALUES (?, ?, ?)")) {
            ps.setString(1, from);
            ps.setString(2, to);
            ps.setDouble(3, amount);
            ps.executeUpdate();
            resp.sendRedirect("listRental.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
