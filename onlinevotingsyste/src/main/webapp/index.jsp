<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting Hub</title>
    <link rel="icon" href="uncolored_logo2.png" type="image/png">
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 850;
            margin-bottom: 0.5rem;
            font-family: "Bodoni Moda", serif;
            font-optical-sizing: auto;
            font-style: normal;
        }

        h2 {
            font-size: 1rem;
            padding-bottom: 2px;
            font-family: "Salsa", cursive;
            font-weight: 500;
            font-style: normal;
            letter-spacing: 1px;
        }

        button {
            padding: 1rem;
            background-color: black;
            color: white;
            border-radius: 2rem;
            padding: 15px 58px 15px 58px;
            border: 0;
        }

        input {
            background-color: rgba(255, 255, 255, 0.2);
            color: rgba(50, 50, 54, 0.733);
            border-radius: 1rem;
            padding: 0.25rem;
            padding-left: 0.5rem;
            margin-bottom: 1rem;
            border: 0;
        }

        button:hover {
            background-color: #343a40;
        }

        input:hover {
            box-shadow: 0 8px 16px 0 rgb(37, 35, 31);
        }

        .main {
            width: 100vw;
            height: 100vh;
            background-image: url("sr.png");
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10rem;
        }

        .main img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .login {
            height: 36rem;
            width: 18rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 2rem;
            background-color: rgba(255, 255, 255, 0.08);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
            border-radius: 1.5rem;
        }

        .register {
            height: 36rem;
            width: 20rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            background-color: rgba(255, 255, 255, 0.08);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
            border-radius: 1.5rem;
        }

        #dob {
            padding: 0.25rem 2rem 0.25rem 2rem;
            text-align: center;
        }

        .sub-btn {
            width: 100%;
            height: 3.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bodoni+Moda:ital,opsz,wght@0,6..96,400..900;1,6..96,400..900&family=Salsa&display=swap" rel="stylesheet">
</head>

<body>
    <div class="main">
        <div class="login">
            <h1>Login</h1>
            <form id="login-form" action="login" method="post">
                <h2>Adhar Number</h2>
                <input type="text" id="loginAdharNumber" name="adharNumber">
                <h2>Password</h2>
                <input type="password" id="loginPassword" name="password">
                <div class="sub-btn"><button class="l-btn">Log In</button></div>
            </form>
        </div>
        <div class="register">
            <h1>Register</h1>
            <form id="registration-form" action="hariformregister" method="post" onsubmit="return validateForm()">
                <h2>Name</h2>
                <input type="text" id="uname" name="name">
                <h2>Adhar Number</h2>
                <input type="text" id="registerAdharNumber" name="adharNumber" required pattern="\d{12}">
                <h2>Date Of Birth</h2>
                <input type="date" id="dob" name="dob" onchange="calculateAge()">
                <h2>Password</h2>
                <input type="password" id="pword" name="password">
                <h2>Confirm Password</h2>
                <input type="password" id="cpassword" name="cpword">
                <h2>Enter otp (sent to number)</h2>
                <div class="sub-btn"><input type="text" id="otp"></div>
                 <div class="sub-btn"><button class="r-btn" onclick="getOTP()">get otp</button></div>
                <div class="sub-btn"><button class="r-btn" >Register</button></div>
            </form>
        </div>
    </div>
    <script>
        function calculateAge() {
            var dob = new Date(document.getElementById("dob").value);
            var today = new Date();
            var age = today.getFullYear() - dob.getFullYear();
          
            // Check if the birthday has occurred this year
            if (today.getMonth() < dob.getMonth() || (today.getMonth() == dob.getMonth() && today.getDate() < dob.getDate())) {
                age--;
            }

            if (age < 18) {
                alert("You are ineligible to vote and register.");
                document.getElementById("registration-form").reset(); // Clear the form
                return false; // Cancel form submission
            }
            return true; // Proceed with form submission
        }

        function getOTP() {
        
            alert("OTP set to registered Aadhar number."); 
           
        }

        function validateForm() {
            var password = document.getElementById("pword").value;
            var confirmPassword = document.getElementById("cpassword").value;
            var enteredOTP = document.getElementById("otp").value;
            var passwordRegex = /^(?=.*[0-9].*[0-9])(?=.*[@#$%])[0-9a-zA-Z@#$%]{5,}$/;

            if (!passwordRegex.test(password)) {
                alert("Password should be at least 5 characters long, contain at least 2 numbers, and include at least one of the following special characters: @, #, $, %");
                return false; // Cancel form submission
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false; // Cancel form submission
            }

            if (validateOTP(enteredOTP)) {
                return true; // Proceed with form submission
            } else {
                alert("Invalid OTP. Please enter the correct OTP.");
                return false; // Cancel form submission
            }
        }

        function validateOTP(enteredOTP) {
            var expectedOTP = "123456";
            return enteredOTP === expectedOTP;
        }

        // Code for handling URL parameters
        var urlParams = new URLSearchParams(window.location.search);
        var registrationStatus = urlParams.get('registration');
        if (registrationStatus === 'complete') {
            alert('Registration complete');
        }
        var adharRegistered = urlParams.get('adharRegistered');
        if (adharRegistered === 'true') {
            alert('Aadhar number already registered. You can login and vote.');
        }
        var message = urlParams.get('message');
        if (message) {
            alert(message);
        }
    </script>
</body>

</html>

