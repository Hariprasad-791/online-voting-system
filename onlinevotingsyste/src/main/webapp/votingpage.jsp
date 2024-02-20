<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting Page</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background-image: url('back.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            width: 100%;
            height: 100%;
            color: #fff;
            font-family: Arial, sans-serif;
        }

        .main {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 2.5rem;
            height: 100vh;
            padding: 20px;
            overflow-y: auto;
        }

        .block {
            display: flex;
            gap: 1rem;
            margin: 5px;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 15px;
            border-radius: 10px;
        }

        .block img {
            max-width: 100px;
            height: auto;
            border-radius: 10px;
        }

        .context {
            flex: 1;
        }

        .btn {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        .submit-btn {
            padding: 10px 30px;
            border-radius: 20px;
            border: 0;
            font-size: 15px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #555;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .welcome {
            font-size: 24px;
            text-align: center;
            margin-bottom: 10px;
            color: orange;
        }

        .sentence {
            text-align: center;
            font-size: 18px;
            color: green;
        }

        .adhar {
            text-align: center;
            color: green;
            margin-top: 10px;
        }

        .adhar input[type="text"] {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <form action="votingProcess" method="post" id="votingForm">
        <div class="main">
            <div class="headings">
                <div class="context">
                    <h2 class="welcome">WELCOME TO VOTING PAGE</h2>
                    <p class="sentence">CHOOSE A PARTY THAT WILL LEAD THE COUNTRY AND WORK FOR DEVELOPMENT</p>
                    <div class="adhar">
                        <label for="adharNumber">Aadhar Number:</label>
                        <input type="text" name="adharNumber" value="${param.adharNumber}" readonly>
                        <br>
                    </div>
                </div>
            </div>


            <input type="hidden" name="votedParty" id="votedParty" value="">
            <div class="block">
        
                <div class="img">
                    <img src="bjp.png" alt="Image of BJP">
                </div>
                <div class="context">
                    <h2>Bharatiya Janata Party</h2>
                    <p>The Bharatiya Janata Party is a political party in India and one of the two major Indian
                        political
                        parties alongside the Indian National Congress. Since 2014, it has been the ruling political
                        party
                        in India under the incumbent Prime Minister Narendra Modi. The BJP is aligned with right-wing
                        politics and has close ideological and organisational links to the Rashtriya Swayamsevak Sangh
                        (RSS)
                        volunteer paramilitary organisation. Its policies adhere to Hindutva, a Hindu nationalist
                        ideology.
                        As of December 2023, it is the country's biggest political party in terms of representation in
                        the
                        Parliament of India as well as state legislatures.</p>
                    <div class="voting-sec">
                        <input type="radio" id="party1" name="voted" value="BJP" onclick="updateVotedParty(this.value)">
                        <label for="party1">I am voting for this party.</label>
                    </div>
                </div>
            </div>
            <div class="block">
    
                <div class="img">
                    <img src="congress.png" alt="Image of Congress">
                </div>
                <div class="context">
                    <h2>Bharatiya Janata Party</h2>
                    <h2>Indian National Congress</h2>
                    <p>The Indian National Congress (INC), colloquially the Congress Party or simply the Congress, is a
                        political party in India with widespread roots. Founded in 1885, it was the first modern
                        nationalist
                        movement to emerge in the British Empire in Asia and Africa. From the late 19th century, and
                        especially after 1920, under the leadership of Mahatma Gandhi, the Congress became the principal
                        leader of the Indian independence movement. The Congress led India to independence from the
                        United
                        Kingdom, and significantly influenced other anti-colonial nationalist movements in the British
                        Empire.</p>
                    <div class="voting-sec">
                        <input type="radio" id="party2" name="voted" value="Congress"  onclick="updateVotedParty(this.value)">
                        <label for="party2">I am voting for this party.</label>
                    </div>
                </div>
            </div>
            <div class="block">
            
                <div class="img">
                    <img src="aap.png" alt="Image of AAP">
                </div>
                <div class="context">
                    <h2>Aam Aadmi Party</h2>
                    <p>The Aam Aadmi Party is a political party in India. It was founded on 26 November 2012 by Arvind
                        Kejriwal and his then-companions, following the 2011 Indian anti-corruption movement. AAP is
                        currently the governing party in the Indian state of Punjab and the union territory of Delhi. On
                        10
                        April 2023, AAP was officially granted the status of National party by ECI. The party's election
                        symbol is a broom. The party is currently part of the coalition I.N.D.I.A Alliance.</p>
                    <div class="voting-sec">
                        <input type="radio" id="party3" name="voted" value="APP" onclick="updateVotedParty(this.value)">
                        <label for="party3">I am voting for this party.</label>
                    </div>
                </div>
            </div>
            <div class="block">
               
                <div class="img">
                    <img src="nota.png" alt="Image of AAP">
                </div>
                <div class="context">
                    <h2>NOTA</h2>
                    <p>NOTA, or "None of the Above," is an option available to voter, allowing them
                        to express their dissatisfaction with the listed candidates. When a voter selects NOTA, it
                        signifies
                        their choice to reject all candidates presented in the election. While NOTA votes are counted,
                        they
                        do not
                        affect the final outcome of the election; instead, they serve as a crucial tool for voter to
                        voice
                        their
                        disapproval of the candidates and encourage political parties to nominate more suitable
                        candidates
                        in future
                        elections.NOTA empowers voter to participate actively in the democratic process by providing
                        them
                        with a means
                        to register their discontent with the available choices, thereby promoting accountability and
                        transparency in
                        the electoral system.</p>
                    <div class="voting-sec">
                        <input type="radio" id="party3" name="voted" value="NOTA"
                            onclick="updateVotedParty(this.value)">
                        <label for="party3">I am voting for this party.</label>
                    </div>
                </div>
            </div>


            <div class="btn">
                <button type="submit" class="submit-btn">Submit Vote</button>
            </div>

        </div>
    </form>

    <script>
        function updateVotedParty(party) {
            document.getElementById('votedParty').value = party;
        }
        function preventBack() {
            window.history.forward();
        }

        setTimeout(preventBack, 0);
        window.onunload = function () {
            null;
        };
    </script>
</body>

</html>

