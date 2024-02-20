<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
        }
        .parties {
            display: flex;
            justify-content: space-around; 
            flex-wrap: nowrap; 
        }
        .party {
            flex: 0 0 auto; 
            margin-bottom: 20px;
            text-align: center;
        }
        .party img {
            display: block;
            margin: 0 auto;
            width: 200px;
            height: auto;
        }
        .party-info {
            text-align: center;
        }
    </style>
</head>
<body>
    <script>
    function authenticate() {
        var password = prompt("Please enter the password:");
        if (password === "hariguru") {
            // Correct password, continue to display the page
        } else {
            alert("Incorrect password. Access denied!");
            window.location.href = "instruct.jsp"; // Redirect to the index page
        }
    }
 
</script>
  

    <div class="container">
        <h1>Voting Results</h1>
        <script>authenticate();</script>
        <div class="parties">
            <div class="party">
                <img src="bjp.png" alt="BJP">
                <div class="party-info">
                    <h3>BJP</h3>
                    <p>Votes: <% out.print(getVotesForParty("bjp")); %></p>
                </div>
            </div>
            <div class="party">
                <img src="congress.png" alt="Congress">
                <div class="party-info">
                    <h3>Congress</h3>
                    <p>Votes: <% out.print(getVotesForParty("congress")); %></p>
                </div>
            </div>
            <div class="party">
                <img src="aap.png" alt="AAP">
                <div class="party-info">
                    <h3>AAP</h3>
                    <p>Votes: <% out.print(getVotesForParty("APP")); %></p>
                </div>
            </div>
            <div class="party">
                <img src="nota.png" alt="NOTA">
                <div class="party-info">
                    <h3>NOTA</h3>
                    <p>Votes: <% out.print(getVotesForParty("NOTA")); %></p>
                </div>
            </div>
        </div>
    </div>

    <%! 
    public int getVotesForParty(String partyName) {
        int votes = 0;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql:///condidates", "root", "rakshu");
            
            // Prepare SQL statement to retrieve votes for the given party
            String sql = "SELECT votes FROM candida WHERE party = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, partyName);
            
            // Execute the query
            resultSet = preparedStatement.executeQuery();
            
            // If there are results, get the votes
            if (resultSet.next()) {
                votes = resultSet.getInt("votes");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the resources
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        // Return the votes
        return votes;
    }
    %>
</body>
</html>

