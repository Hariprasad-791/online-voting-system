package com.voterinformation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hariformregister")
public class voterreg extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        response.setContentType("text/html");
        String name = request.getParameter("name");
        String adharNumber = request.getParameter("adharNumber");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }

        try (Connection con = DriverManager.getConnection("jdbc:mysql:///voters", "root", "rakshu")) {
            // Check if Aadhar number already exists
            PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM voterin WHERE adharNumber = ?");
            checkStatement.setString(1, adharNumber);
            ResultSet resultSet = checkStatement.executeQuery();

            if (resultSet.next()) {
                // Aadhar number already exists, redirect to login page
                response.sendRedirect("index.jsp?adharRegistered=true");
            } else {
                // Aadhar number doesn't exist, proceed with registration
                PreparedStatement ps = con.prepareStatement("INSERT INTO voterin(name, adharNumber, dob, password) VALUES (?, ?, ?, ?)");
                ps.setString(1, name);
                ps.setString(2, adharNumber);
                ps.setString(3, dob);
                ps.setString(4, password);

                int row = ps.executeUpdate();

                if (row == 1) {
                    // Registration completed, redirect to index.jsp
                    response.sendRedirect("index.jsp?registration=complete");
                } else {
                    pw.println("<h3>Error during registration</h3>");
                }
            }

        } catch (SQLException sc) {
            pw.println("<h3>" + sc.getMessage() + "</h3");
            sc.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        pw.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

