<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting Hub</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <style>
        body,
        html {
            margin: 0;
            padding: 0;
            height: 100%;
            background-image: url("kar.jpg");
            background-size: cover;
        }

        .main-head,
        h1 {
            text-align: center;
            padding-bottom: 1rem;
            color: white;
            font-size: 2.2em;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .main {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .content {
            width: 80%;
            max-width: 800px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-weight: 600;
            font-style: normal;
            background-color: rgba(255, 255, 255, 0.2);
            font-size: 21px;
            border-radius: 3rem;
            padding: 1rem;
            color: rgb(13, 21, 29);
            box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
            margin-top: 1rem;
        }

        .checker {
            text-align: center;
            margin: 1rem 0 1rem 0;
            padding-left: 10px;
        }

        .vote {
            width: 100%;
            height: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .vote-btn {
            color: black;
            background-color: rgba(255, 255, 255, 0.001);
            border: 2px solid rgb(0, 0, 0);
            padding: 8px;
            font-weight: 200;
            border-radius: 4px;
            text-decoration: none;
        }

        a:hover {
            background-color: #4d2c64;
            border: 0.5px solid #697082;
        }

        .vote-btn:hover {
            color: rgb(152, 176, 204);
            transition: border 0.4s;
            border: 2px solid rgb(152, 176, 204);
        }

        .results-link {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 18px;
            color: blue;
            text-decoration: none;
        }

        .results-link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div><h1 class="main-head">Welcome to online voting system</h1></div>
    <div class="main">
        
        <div class="content">

            <main>
                <h3> Please read the following instructions carefully before proceeding</h3>

                <ol>
                    <li>Registration: Make sure you are a registered voter. If not, please register before proceeding.
                    </li>
                    <li>Eligibility: age above 18 year ,voters are eligible to participate.</li>
                    <li>Voting: Each voter can cast only one vote.</li>
                    <li>Selection: Select your preferred candidate by clicking on their name or photo.</li>
                    <li>Confirmation: Review your selection before confirming your vote.</li>
                    <li>Security: This platform is secure, and your vote will remain anonymous.</li>
                </ol>
            </main>
            <main>
                <h3>Please read the following procedure carefully before proceeding</h3>

                <ol>
                    <li>Click on the "Vote Now" button to proceed to the login and registration page.</li>
                    <li>If you are a registered voter, log in directly. If not, you need to register.</li>
                    <li>After logging in, you will be redirected to the voting page.</li>
                    <li>Select the candidate's party that you want to vote for.</li>
                    <li>Click on the "Submit" button to complete your vote.</li>
                </ol>
            </main>
            <div class="checker">
                <input type="checkbox" id="agreeCheckbox">
                <label for="agreeCheckbox" class="checkbox-label">I have read and understood the instructions.</label>
            </div>
            <div class="vote">
                <button class="vote-btn" onclick="submitVote()">VOTE NOW</button>
            </div>
            <a href="result.jsp" class="results-link">Results</a>
        </div>
    </div>
    <script>
        function submitVote() {
            if (document.querySelector("#agreeCheckbox").checked) {
                console.log("hi");
                window.location.href = "index.jsp";
            } else {
                alert("Please check the box first!");
            }
        }
        
    </script>
</body>

</html>

