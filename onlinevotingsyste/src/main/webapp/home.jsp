<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting Hub</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-color: rgb(28, 25, 25);
        }

        a {
            text-decoration: none;
            color: white;
            letter-spacing: 0.7px;
        }

        p {
            font-size: 90px;
            padding-top: 40px;
            margin-top: 40px;
        }

        button {
            padding: 5px 60px 5px 60px;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            font-size: 20px;
            letter-spacing: 1px;
        }

        .main {
            height: 99vh;
            width: 99vw;
        }

        .name {
            display: flex;
            gap: 0.3rem;
            color: #fff;
            font-weight: 400;
        }

        .pic {
            height: 2rem;
            width: 2rem;
        }

        .pic img {
            height: 100%;
            width: 100%;
            object-fit: contain;
        }

        .nav-bar {
            display: flex;
            justify-content: space-between;
            padding: 5px 10px 5px 10px;
            align-items: center;
            margin-top: 5px;
            font-family: "Roboto", sans-serif;
            font-weight: 400;
            font-style: normal;
        }

        .options {
            display: flex;
            gap: 1.2rem;
        }

        .context {
            height: 90%;
            width: 96%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px;
        }

        .para {
            height: 100%;
            width: 45%;
            padding-left: 15px;
            color: #fff;
            font-family: "Source Code Pro", monospace;
            font-optical-sizing: auto;
            font-weight: 600;
            font-style: normal;
        }

        .content {
            height: 100%;
            width: 45%;
            display: flex;
            flex-direction: column;
        }

        .booth {
            height: 80%;
            width: 100%;
        }

        .booth img {
            height: 100%;
            width: 100%;
            object-fit: contain;
        }

        .btn {
            width: 100%;
            height: 5rem;
            display: flex;
            justify-content: center;
        }

        button:hover {
            background-color: #000000;
            cursor: pointer;
            color: #fff;
            border: 3px solid rgb(40, 38, 38);
            transition: color 1s;
        }

        a:hover {
            text-decoration: overline;
            transition: text-decoration 1s;
        }
        .main {
            height: 99vh;
            width: calc(99vw - 2vw);
        }
    </style>
    <link rel="icon" href="uncolored_logo2.png" type="image/png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Sixtyfour&family=Source+Code+Pro:ital,wght@0,200..900;1,200..900&display=swap"
        rel="stylesheet">
</head>

<body>
    <div class="main">
        <div class="nav-bar">
            <div class="name">
                <div class="pic"><img src="Colored_logo1-removebg-preview.png" alt="The Logo"></div>
                <h2>Voting Hub</h2>
            </div>
            <div class="options">
                
                <a href="#about">ABOUT US</a>
                <a href="#contact">CONTACT US</a>
            </div>
        </div>
        <div class="context">
            <div class="para">
                <p>Choose Your Nation's Leader with a Single Click Now.</p>
            </div>
            <div class="content">
                <div class="booth">
                    <img src="hand.jpg" alt="An random Image">
                </div>
                <div class="btn">
                    <button class="vote-btn" onclick="redirectToVotingPage()">VOTE NOW</button>
                </div>
            </div>
        </div>
        
    </div>
    <script>
        function redirectToVotingPage() {
        	 window.location.href = 'votingpage.jsp?adharNumber=' + adharNumber;
        }
        var adharNumber = new URLSearchParams(window.location.search).get('adharNumber');
       
    </script>

</body>

</html>