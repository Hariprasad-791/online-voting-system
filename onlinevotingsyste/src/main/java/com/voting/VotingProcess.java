package com.voting;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/votingProcess")
public class VotingProcess extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        response.setContentType("text/html");

        String adharNumber = request.getParameter("adharNumber");
        String votedParty = request.getParameter("votedParty");
    
      

        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql:///voters", "root", "rakshu");

            // Update voted for the voter in the 'voterin' table
            PreparedStatement psVoter = con.prepareStatement("UPDATE voterin SET votedparty = ? WHERE adharNumber = ?");
            psVoter.setString(1, "voted");
            psVoter.setString(2, adharNumber);
            int rowsAffectedVoter = psVoter.executeUpdate();

            if (rowsAffectedVoter > 0) {
                // Increment votes for the selected party in the 'candida' table
                try (Connection candidatesConnection = DriverManager.getConnection("jdbc:mysql:///condidates", "root", "rakshu")) {
                    PreparedStatement psCandidates = candidatesConnection.prepareStatement(
                            "UPDATE candida SET votes = votes + 1 WHERE party = ?"
                    );
                    psCandidates.setString(1, votedParty);
                    int rowsAffectedCandidates = psCandidates.executeUpdate();

                    if (rowsAffectedCandidates > 0) {
                    	response.sendRedirect("thankyou.jsp");
                    } else {
                        pw.println("<h3>Error incrementing votes for " +"</h3>");
                    }
                } catch (SQLException e) {
                    log("SQL Error during voting", e);
                    pw.println("<h3>Error during voting</h3>");
                }
            } else {
                pw.println("<h3>Error updating voted party for Aadhar number " + adharNumber + "</h3>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            log("Error during voting", e);
            pw.println("<h3>Error during voting</h3>");
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            pw.close();
        }
    }
}


